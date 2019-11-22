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

+ (NSInteger)toNSInteger:(id)object;
+ (BOOL)toBool:(id)object;
+ (CGFloat)toCGFloat:(id)object;
+ (NSUInteger)toNSUInteger:(id)object;

/**
 获取rect
 
 {{0,0},{300,400}}
 {{0,0},{w,h}}
 {{0,0},{300*s1,400*s1}}
 {{0,0},{300*s2,400*s2}}
 {0,0,300*s2,400*s2}
 0,0,300*s2,400*s2
 
  w,h 表示屏幕的宽高
  * 表示按照设备宽进行等比放大
  s1,s2... 表示参照的设置类型,可自定义
 */
+ (CGRect)toCGRect:(id)object;

/**
 获取颜色
 
 #FFFFFF
 0xFFFFFF
 #FFFFFF,1
 0xFFFFFF,0.5
 */
+ (UIColor *)toUIColor:(id)object;

/**
 获取字体
 
 13
 13,B
 13,,PingFang SC
 13,,,<UIFontWeight>
 */
+ (UIFont *)toUIFont:(id)object;

@end

NS_ASSUME_NONNULL_END
