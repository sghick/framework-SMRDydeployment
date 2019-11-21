//
//  UIView+SMRDy.h
//  SMRDydeploymentDemo
//
//  Created by Tinswin on 2019/11/21.
//  Copyright © 2019 Tinswin. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SMRDyProtocols.h"

NS_ASSUME_NONNULL_BEGIN

@class SMRDyView;
@interface UIView (SMRDy)<SMRDyViewProtocol>

@property (strong, nonatomic) SMRDyView *dyView;

@end

NS_ASSUME_NONNULL_END
