//
//  DyView.m
//  SMRDydeploymentDemo
//
//  Created by Tinswin on 2019/11/20.
//  Copyright © 2019 Tinswin. All rights reserved.
//

#import "DyView.h"
#import "SMRDydeployment.h"

@implementation DyView

@synthesize dyView = _dyView;

- (void)setDyView:(SMRDyView *)dyView {
    _dyView = dyView;
    if (dyView.frame) {
        self.frame = [SMRDyUtils rect:dyView.frame];
        self.backgroundColor = [SMRDyUtils color:dyView.backgroundColor];
    }
}

@end
