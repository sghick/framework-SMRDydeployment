//
//  UIView+SMRDy.m
//  SMRDydeploymentDemo
//
//  Created by Tinswin on 2019/11/21.
//  Copyright © 2019 Tinswin. All rights reserved.
//

#import "UIView+SMRDy.h"
#import <objc/runtime.h>
#import "SMRDyLoader.h"
#import "SMRDyUtils.h"
#import "SMRDySafePerform.h"
#import "SMRDyModels.h"

@implementation UIView (SMRDy)

- (void)dyViewDidLoad:(SMRDyView *)dyView {
    [self smr_dyViewDidLoad:dyView];
}

- (void)smr_dyViewDidLoad:(SMRDyView *)dyView {
    self.dyView = dyView;
    
    if (dyView.frame) {
        self.frame = [SMRDyUtils toCGRect:dyView.frame];
    }
    if (dyView.backgroundColor) {
        self.backgroundColor = [SMRDyUtils toUIColor:dyView.backgroundColor];
    }
    
    for (SMRDyProperty *dp in dyView.properties) {
        @try {
            if ([self respondsToSelector:dp.p_setter]) {
                [SMRDySafePerform safe_performAction:dp.p_setter
                                              object:dp.p_object
                                              target:self];
            } else {
                NSLog(@"Dylog:-[%@ %@]: unrecognized selector sent to instance %p", NSStringFromClass(self.class), NSStringFromSelector(dp.p_setter), self);
            }
        } @catch (NSException *exception) {
            NSLog(@"Dylog:<%@: %p>:%@", NSStringFromClass(self.class), self, exception);
        } @finally {
            
        }
    }
    
    for (SMRDyView *dv in dyView.sub_views) {
        UIView *view = [SMRDyLoader viewWithDyView:dv];
        [self addSubview:view];
    }
    
    for (SMRDyMethod *dm in dyView.methods) {
        @try {
            if ([self respondsToSelector:NSSelectorFromString(dm.method)]) {
                [SMRDySafePerform safe_performAction:NSSelectorFromString(dm.method)
                                             objects:[dm.params valueForKeyPath:@"p_object"]
                                              target:self];
            } else {
                NSLog(@"Dylog:-[%@ %@]: unrecognized selector sent to instance %p", NSStringFromClass(self.class), dm.method, self);
            }
        } @catch (NSException *exception) {
            NSLog(@"Dylog:<%@: %p>:%@", NSStringFromClass(self.class), self, exception);
        } @finally {
            
        }
    }
}

#pragma mark - Getters/Setters

// dyPage
static const char SMRDyViewPropertyKey = '\0';
- (void)setDyView:(SMRDyView *)dyView {
    if (dyView != self.dyView) {
        objc_setAssociatedObject(self, &SMRDyViewPropertyKey, dyView, OBJC_ASSOCIATION_RETAIN);
    }
}

- (SMRDyView *)dyView {
    return objc_getAssociatedObject(self, &SMRDyViewPropertyKey);
}

@end
