//
//  DyTabBarController.m
//  SMRDydeploymentDemo
//
//  Created by Tinswin on 2019/11/20.
//  Copyright © 2019 Tinswin. All rights reserved.
//

#import "DyTabBarController.h"
#import "SMRDydeployment.h"

@interface DyTabBarController ()

@end

@implementation DyTabBarController

- (void)viewDidLoad {
    [super viewDidLoad];
}

- (void)dyPageDidLoad:(SMRDyPage *)dyPage {
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

@end
