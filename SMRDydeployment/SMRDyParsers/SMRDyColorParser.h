//
//  SMRDyColorParser.h
//  SMRDydeploymentDemo
//
//  Created by Tinswin on 2019/11/20.
//  Copyright © 2019 Tinswin. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface SMRDyColorParser : NSObject

/**
获取颜色

#FFFFFF,1
0xFFFFFF,0.5
*/
+ (UIColor *)color:(NSString *)string alpha:(nullable NSString *)alpha;

@end

NS_ASSUME_NONNULL_END
