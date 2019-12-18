//
//  SMRLabel.h
//  SMRDydeploymentDemo
//
//  Created by Tinswin on 2019/11/28.
//  Copyright © 2019 Tinswin. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface SMRLabel : UIView

@property (strong, nonatomic, readonly) UIImageView *backImageView;
@property (assign, nonatomic) UIEdgeInsets contentInsets;
@property (strong, nonatomic, readonly) UILabel *textLabel;

@end

NS_ASSUME_NONNULL_END
