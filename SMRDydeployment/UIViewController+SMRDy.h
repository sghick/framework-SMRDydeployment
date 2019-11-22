//
//  UIViewController+SMRDy.h
//  SMRDydeploymentDemo
//
//  Created by Tinswin on 2019/11/21.
//  Copyright © 2019 Tinswin. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SMRDyProtocols.h"

NS_ASSUME_NONNULL_BEGIN

@class SMRDyPage;
@interface UIViewController (SMRDy)<SMRDyPageProtocol>

@property (strong, nonatomic) SMRDyPage *dyPage;

/// dyPageDidLoad中已经的处理逻辑
- (void)smr_dyPageDidLoad:(SMRDyPage *)dyPage;
/// viewDidLoad中需要的处理逻辑
- (void)smr_dyPageViewDidLoad:(SMRDyPage *)dyPage;

@end

NS_ASSUME_NONNULL_END
