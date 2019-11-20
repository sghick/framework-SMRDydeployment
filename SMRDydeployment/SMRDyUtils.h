//
//  SMRDyUtils.h
//  SMRDydeploymentDemo
//
//  Created by Tinswin on 2019/11/20.
//  Copyright © 2019 Tinswin. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface SMRDyUtils : NSObject

+ (id)objectAtIndex:(NSInteger)index array:(NSArray *)array;
+ (id)objectAtIndex:(NSInteger)index array:(NSArray *)array trimSpace:(BOOL)trimSpace;

/**
 获取颜色
 
 #FFFFFF
 0xFFFFFF
 #FFFFFF,1
 0xFFFFFF,0.5
 */
+ (UIColor *)color:(NSString *)string;

/**
 获取字体
 
 13
 13,B
 13,,PingFang SC
 13,,,<UIFontWeight>
 */
+ (UIFont *)font:(NSString *)string;

@end

NS_ASSUME_NONNULL_END
