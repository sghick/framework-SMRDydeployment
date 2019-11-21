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
@synthesize dyPage = _dyPage;

- (void)loadDyPage:(SMRDyPage *)dyPage {
    _dyPage = dyPage;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self dyPageViewDidLoad];
}

- (void)dyPageViewDidLoad {
    self.view.backgroundColor = [SMRDyUtils color:self.dyPage.backgroundColor];
    
    for (SMRDyView *dv in self.dyPage.sub_views) {
        UIView *view = [SMRDyLoader viewWithDyView:dv];
        [self.view addSubview:view];
    }
}

@end
