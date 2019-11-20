//
//  SMRDyUtils.m
//  SMRDydeploymentDemo
//
//  Created by Tinswin on 2019/11/20.
//  Copyright © 2019 Tinswin. All rights reserved.
//

#import "SMRDyUtils.h"

@implementation SMRDyUtils

+ (id)objectAtIndex:(NSInteger)index array:(NSArray *)array {
    return [self objectAtIndex:index array:array trimSpace:YES];
}
+ (id)objectAtIndex:(NSInteger)index array:(NSArray *)array trimSpace:(BOOL)trimSpace {
    if ((index >= 0) && (index < array.count)) {
        NSString *rtn = array[index];
        if ([rtn isKindOfClass:NSString.class] && trimSpace) {
            // 去除首尾空格
            rtn = [[rtn stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]] uppercaseString];
            // 长度为0时,返回nil
            rtn = rtn.length ? rtn : nil;
            return rtn;
        }
        return rtn;
    }
    return nil;
}

+ (UIColor *)color:(NSString *)string {
    NSArray<NSString *> *sps = [string componentsSeparatedByString:@","];
    NSString *cString = [self objectAtIndex:0 array:sps];
    NSString *alpha = [self objectAtIndex:1 array:sps];
    //把开头截取
    if ([cString.lowercaseString hasPrefix:@"0x"]) cString = [cString substringFromIndex:2];
    if ([cString hasPrefix:@"#"]) cString = [cString substringFromIndex:1];
    if (cString.length != 6) return nil;
    UIColor *result = nil;
    unsigned int colorCode = 0;
    unsigned char R, G, B;
    if (nil != cString) {
        NSScanner *scanner = [NSScanner scannerWithString:cString];
        (void) [scanner scanHexInt:&colorCode]; // ignore error
    }
    R = (unsigned char) (colorCode >> 16);
    G = (unsigned char) (colorCode >> 8);
    B = (unsigned char) (colorCode >> 0); // masks off high bits
    result = [UIColor colorWithRed: (float)R/0xFF green: (float)G/0xFF blue: (float)B/0xFF alpha:alpha?alpha.intValue:1];
    return result;
}

+ (UIFont *)font:(NSString *)string {
    NSArray<NSString *> *sps = [string componentsSeparatedByString:@","];
    NSString *size = [self objectAtIndex:0 array:sps];
    NSString *type = [self objectAtIndex:1 array:sps];
    NSString *name = [self objectAtIndex:2 array:sps];
    NSString *weight = [self objectAtIndex:3 array:sps];
    if (!type) {
        if ([type isEqualToString:@"B"]) {
            return [UIFont boldSystemFontOfSize:size.doubleValue];
        }
        if ([type isEqualToString:@"I"]) {
            return [UIFont italicSystemFontOfSize:size.doubleValue];
        }
    }
    if (!name) {
        return [UIFont fontWithName:name size:size.doubleValue];
    }
    if (!weight) {
        return [UIFont systemFontOfSize:size.doubleValue weight:weight.doubleValue];
    }
    return [UIFont systemFontOfSize:size.doubleValue];
}

@end
