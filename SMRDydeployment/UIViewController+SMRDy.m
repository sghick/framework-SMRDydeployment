//
//  UIViewController+SMRDy.m
//  SMRDydeploymentDemo
//
//  Created by Tinswin on 2019/11/21.
//  Copyright © 2019 Tinswin. All rights reserved.
//

#import "UIViewController+SMRDy.h"
#import <objc/runtime.h>
#import "SMRDyLoader.h"
#import "SMRDyUtils.h"
#import "SMRDyModels.h"

@implementation UIViewController (SMRDy)

#pragma mark - SMRDyPageProtocol

- (void)loadDyPage:(SMRDyPage *)dyPage {
    [self smr_loadDyPage:dyPage];
}

- (void)dyPageViewDidLoad {
    [self smr_dyPageViewDidLoad];
}

#pragma mark - Utils

- (void)smr_loadDyPage:(SMRDyPage *)dyPage {
    self.dyPage = dyPage;
    
    // for UITabBarController
    if ([self isKindOfClass:UITabBarController.class]) {
        UITabBarController *tab = (UITabBarController *)self;
        NSMutableArray<UIViewController *> *controllers = [NSMutableArray array];
        for (SMRDyPage *dp in self.dyPage.sub_pages) {
            UIViewController *page = [SMRDyLoader controllerWithDyPage:dp];
            UINavigationController *nav = [[UINavigationController alloc] initWithRootViewController:page];
            nav.tabBarItem.title = dp.title;
            [controllers addObject:nav];
        }
        tab.viewControllers = controllers;
    }
}

- (void)smr_dyPageViewDidLoad {
    self.view.backgroundColor = [SMRDyUtils color:self.dyPage.backgroundColor];
    
    for (SMRDyView *dv in self.dyPage.sub_views) {
        UIView *view = [SMRDyLoader viewWithDyView:dv];
        [self.view addSubview:view];
    }
}

#pragma mark - Getters/Setters

// dyPage
static const char SMRDyPagePropertyKey = '\0';
- (void)setDyPage:(SMRDyPage *)dyPage {
    if (dyPage != self.dyPage) {
        objc_setAssociatedObject(self, &SMRDyPagePropertyKey, dyPage, OBJC_ASSOCIATION_RETAIN);
    }
}

- (SMRDyPage *)dyPage {
    return objc_getAssociatedObject(self, &SMRDyPagePropertyKey);
}

@end
