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

- (void)setDyPage:(SMRDyPage *)dyPage {
    _dyPage = dyPage;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [SMRDyUtils color:self.dyPage.backgroundColor];
}

@end
