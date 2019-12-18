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
    
    for (NSDictionary *dp in dyView.properties) {
        for (NSString *dpk in dp.allKeys) {
            @try {
                SEL sel = [SMRDyUtils toSetter:dpk];
                if ([self respondsToSelector:sel]) {
                    [SMRDySafePerform safe_performAction:sel
                                                  object:dp[dpk]
                                                  target:self];
                } else {
                    NSLog(@"Dylog:-[%@ %@]: unrecognized selector sent to instance %p", NSStringFromClass(self.class), NSStringFromSelector(sel), self);
                }
            } @catch (NSException *exception) {
                NSLog(@"Dylog:<%@: %p>:%@", NSStringFromClass(self.class), self, exception);
            } @finally {
                
            }
        }
    }
    
    for (SMRDyView *dv in dyView.sub_views) {
        UIView *view = [SMRDyLoader viewWithDyView:dv];
        [self addSubview:view];
    }
    
    for (NSDictionary *dm in dyView.methods) {
        for (NSString *dmk in dm.allKeys) {
            @try {
                SEL sel = NSSelectorFromString(dmk);
                if ([self respondsToSelector:sel]) {
                    [SMRDySafePerform safe_performAction:sel
                                                 objects:dm[dmk]
                                                  target:self];
                } else {
                    NSLog(@"Dylog:-[%@ %@]: unrecognized selector sent to instance %p", NSStringFromClass(self.class), dmk, self);
                }
            } @catch (NSException *exception) {
                NSLog(@"Dylog:<%@: %p>:%@", NSStringFromClass(self.class), self, exception);
            } @finally {
                
            }
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
