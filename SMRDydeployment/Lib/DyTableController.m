//
//  DyTableController.m
//  SMRDydeploymentDemo
//
//  Created by Tinswin on 2019/11/20.
//  Copyright © 2019 Tinswin. All rights reserved.
//

#import "DyTableController.h"
#import "SMRDydeployment.h"

@interface DyTableController ()

@end

@implementation DyTableController

@synthesize dyPage = _dyPage;

- (void)loadDyPage:(SMRDyPage *)dyPage {
    _dyPage = dyPage;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

@end
