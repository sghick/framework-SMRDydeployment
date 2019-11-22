//
//  SMRDyLoader.m
//  SMRDydeploymentDemo
//
//  Created by Tinswin on 2019/11/20.
//  Copyright © 2019 Tinswin. All rights reserved.
//

#import "SMRDyLoader.h"
#import "SMRDyProtocols.h"
#import "SMRDyEnums.h"
#import "SMRDyModels.h"
#import "UIViewController+SMRDy.h"
#import "UIView+SMRDy.h"

@implementation SMRDyLoader

+ (instancetype)loader {
    SMRDyLoader *loader = [[SMRDyLoader alloc] init];
    return loader;
}

- (void)loadfilepath:(NSString *)filepath inWindow:(UIWindow *)inWindow {
    NSDictionary *json = [[NSDictionary alloc] initWithContentsOfFile:filepath];
    [self loadjson:json inWindow:inWindow];
}

- (void)loadjson:(NSDictionary *)json inWindow:(UIWindow *)inWindow {
    SMRDyPage *rootPage = [self rootPageWithJson:json];
    UIViewController *root = [SMRDyLoader controllerWithDyPage:rootPage];
    inWindow.rootViewController = root;
    [inWindow makeKeyAndVisible];
}

- (SMRDyPage *)rootPageWithJson:(NSDictionary *)json {
    // TODO:test data
    SMRDyPage *rootPage = [SMRDyPage rootPage];
    return rootPage;
}

#pragma mark - Utils

+ (UIViewController *)controllerWithDyPage:(SMRDyPage *)dyPage {
    Class cls = NSClassFromString(dyPage.class_name);
    UIViewController<SMRDyPageProtocol> *page = (UIViewController<SMRDyPageProtocol> *)[[cls alloc] init];
    if ([page isKindOfClass:UIViewController.class]) {
        page.dyPage = dyPage;
        [page dyPageDidLoad:dyPage];
        return page;
    }
    return nil;
}

+ (UIView *)viewWithDyView:(SMRDyView *)dyView {
    Class cls = NSClassFromString(dyView.class_name);
    UIView<SMRDyViewProtocol> *view = (UIView<SMRDyViewProtocol> *)[[cls alloc] init];
    if ([view isKindOfClass:UIView.class]) {
        view.dyView = dyView;
        [view dyViewDidLoad:dyView];
        return view;
    }
    return nil;
}

@end
