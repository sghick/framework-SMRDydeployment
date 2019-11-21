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
#import "SMRDyModels.h"

@implementation UIView (SMRDy)

- (void)loadDyView:(SMRDyView *)dyView {
    self.dyView = dyView;
    if (dyView.frame) {
        self.frame = [SMRDyUtils rect:dyView.frame];
        self.backgroundColor = [SMRDyUtils color:dyView.backgroundColor];
    }
    for (SMRDyView *dv in dyView.sub_views) {
        UIView *view = [SMRDyLoader viewWithDyView:dv];
        [self addSubview:view];
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
