//
//  SMRDyFontParser.h
//  SMRDydeploymentDemo
//
//  Created by Tinswin on 2019/11/20.
//  Copyright © 2019 Tinswin. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface SMRDyFontParser : NSObject

/**
获取字体

13,B,PingFang SC,<UIFontWeight>
*/
+ (UIFont *)font:(NSString *)size type:(nullable NSString *)type name:(nullable NSString *)name weight:(nullable NSString *)weight;

@end

NS_ASSUME_NONNULL_END
