//
//  SMRDyFrameParser.h
//  SMRDydeploymentDemo
//
//  Created by Tinswin on 2019/11/20.
//  Copyright © 2019 Tinswin. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface SMRDyFrameParser : NSObject

/**
获取rect

 0,0,300,400
 0,0,w,h
 0,0,300*s1,400*s2

 w,h 表示屏幕的宽高
 * 表示按照设备宽进行等比放大
 s1,s2... 表示参照的设置类型,可自定义
*/
+ (CGRect)frame:(NSString *)x y:(NSString *)y w:(NSString *)w h:(NSString *)h;

@end

NS_ASSUME_NONNULL_END
