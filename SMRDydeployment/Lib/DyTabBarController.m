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

@synthesize dyPage = _dyPage;

- (void)setDyPage:(SMRDyPage *)dyPage {
    _dyPage = dyPage;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    NSMutableArray<UIViewController *> *controllers = [NSMutableArray array];
    for (SMRDyPage *sp in self.dyPage.sub_pages) {
        UIViewController *page = [SMRDyLoader controllerWithDyPage:sp];
        UINavigationController *nav = [[UINavigationController alloc] initWithRootViewController:page];
        [controllers addObject:nav];
    }
    self.viewControllers = controllers;
}

@end