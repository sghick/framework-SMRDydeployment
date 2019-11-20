//
//  SMRDyModels.m
//  SMRDydeploymentDemo
//
//  Created by Tinswin on 2019/11/20.
//  Copyright © 2019 Tinswin. All rights reserved.
//

#import "SMRDyModels.h"

@implementation SMRDyModels

@end

@implementation SMRDyView

@end

@implementation SMRDyPage

+ (SMRDyPage *)rootPage {
    SMRDyPage *rootPage = [[SMRDyPage alloc] init];
    rootPage.class_name = @"DyTabBarController";
    
    SMRDyPage *tabHomePage = [SMRDyPage tabHomePage];
    SMRDyPage *tabShopPage = [SMRDyPage tabShopPage];
    SMRDyPage *tabOrderPage = [SMRDyPage tabOrderPage];
    SMRDyPage *tabMyPage = [SMRDyPage tabMyPage];
    rootPage.sub_pages = @[tabHomePage, tabShopPage, tabOrderPage, tabMyPage];
    
    return rootPage;
}

+ (SMRDyPage *)tabHomePage {
    SMRDyPage *page = [[SMRDyPage alloc] init];
    page.class_name = @"DyViewController";
    page.title = @"首页";
    page.backgroundColor = @"#F19722";
    
    SMRDyView *leftView = [[SMRDyView alloc] init];
    leftView.class_name = @"DyView";
    leftView.frame = @"{{10,100},{100,100}}";
    leftView.backgroundColor = @"#D12920,0.7";
    
    SMRDyView *rightView = [[SMRDyView alloc] init];
    rightView.class_name = @"DyView";
    rightView.frame = @"{{100*5,100*2},{100*0.5,100/2}}";
    rightView.backgroundColor = @"#848484,0.5";
    
    page.sub_views = @[leftView, rightView];
    
    return page;
}

+ (SMRDyPage *)tabShopPage {
    SMRDyPage *page = [[SMRDyPage alloc] init];
    page.class_name = @"DyViewController";
    page.title = @"商城";
    page.backgroundColor = @"#D12920";
    return page;
}

+ (SMRDyPage *)tabOrderPage {
    SMRDyPage *page = [[SMRDyPage alloc] init];
    page.class_name = @"DyViewController";
    page.title = @"订单";
    page.backgroundColor = @"#848484";
    return page;
}

+ (SMRDyPage *)tabMyPage {
    SMRDyPage *page = [[SMRDyPage alloc] init];
    page.class_name = @"DyViewController";
    page.title = @"我的";
    page.backgroundColor = @"#4A80E3";
    return page;
}

@end
