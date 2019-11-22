//
//  DyLabel.m
//  SMRDydeploymentDemo
//
//  Created by Tinswin on 2019/11/21.
//  Copyright © 2019 Tinswin. All rights reserved.
//

#import "DyLabel.h"
#import "SMRDydeployment.h"

@implementation DyLabel

- (void)dyViewDidLoad:(SMRDyView *)dyView {
    [super dyViewDidLoad:dyView];
    
    self.text = dyView.class_name;
    self.textColor = [UIColor blackColor];
}

@end
