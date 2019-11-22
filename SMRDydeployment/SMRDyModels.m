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
    leftView.frame = @"{{10,100},{300,300}}";
    leftView.backgroundColor = @"#D12920,0.7";
    
    SMRDyView *leftView1 = [[SMRDyView alloc] init];
    leftView1.class_name = @"DyView";
    leftView1.frame = @"{10,10,110,110}";
    leftView1.backgroundColor = @"#F19722,0.7";
    
    SMRDyView *leftView2 = [[SMRDyView alloc] init];
    leftView2.class_name = @"DyLabel";
    leftView2.frame = @"120,120,110,110";
    leftView2.backgroundColor = @"#4A80E3,0.7";
    
    leftView.sub_views = @[leftView1, leftView2];
    
    SMRDyView *rightView = [[SMRDyView alloc] init];
    rightView.class_name = @"DyView";
    rightView.frame = @"{{10*5,200+100*2},{300*0.5,300/2}}";
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
