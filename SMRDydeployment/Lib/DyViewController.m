//
//  DyViewController.m
//  SMRDydeploymentDemo
//
//  Created by Tinswin on 2019/11/20.
//  Copyright © 2019 Tinswin. All rights reserved.
//

#import "DyViewController.h"
#import "SMRDydeployment.h"

@interface DyViewController ()

@end

@implementation DyViewController

- (void)dyPageViewDidLoad:(SMRDyPage *)dyPage {
    NSString *path = [[NSBundle mainBundle] pathForResource:dyPage.identifier ofType:@"json"];
    SMRDyPage *page = [SMRDyPage dyInstanceWithContentOfFile:path];
    dyPage = page?:dyPage;
    [super dyPageViewDidLoad:dyPage];
}

@end
