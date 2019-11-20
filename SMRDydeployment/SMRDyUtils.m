//
//  SMRDyUtils.m
//  SMRDydeploymentDemo
//
//  Created by Tinswin on 2019/11/20.
//  Copyright © 2019 Tinswin. All rights reserved.
//

#import "SMRDyUtils.h"
#import "SMRDyFontParser.h"
#import "SMRDyColorParser.h"
#import "SMRDyFrameParser.h"

@implementation SMRDyUtils

+ (id)objectAtIndex:(NSInteger)index array:(NSArray *)array {
    return [self objectAtIndex:index array:array trimSpace:YES];
}
+ (id)objectAtIndex:(NSInteger)index array:(NSArray *)array trimSpace:(BOOL)trimSpace {
    if ((index >= 0) && (index < array.count)) {
        NSString *rtn = array[index];
        if ([rtn isKindOfClass:NSString.class] && trimSpace) {
            // 去除首尾空格
            rtn = [rtn stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]];
            // 长度为0时,返回nil
            rtn = rtn.length ? rtn : nil;
            return rtn;
        }
        return rtn;
    }
    return nil;
}

+ (CGRect)rect:(NSString *)string {
    string = [string stringByReplacingOccurrencesOfString:@"{" withString:@""];
    string = [string stringByReplacingOccurrencesOfString:@"}" withString:@""];
    NSArray<NSString *> *sps = [string componentsSeparatedByString:@","];
    NSString *x = [self objectAtIndex:0 array:sps];
    NSString *y = [self objectAtIndex:1 array:sps];
    NSString *w = [self objectAtIndex:2 array:sps];
    NSString *h = [self objectAtIndex:3 array:sps];
    return [SMRDyFrameParser frame:x y:y w:w h:h];
}

+ (UIColor *)color:(NSString *)string {
    NSArray<NSString *> *sps = [string componentsSeparatedByString:@","];
    NSString *cString = [self objectAtIndex:0 array:sps];
    NSString *alpha = [self objectAtIndex:1 array:sps];
    return [SMRDyColorParser color:cString alpha:alpha];
}

+ (UIFont *)font:(NSString *)string {
    NSArray<NSString *> *sps = [string componentsSeparatedByString:@","];
    NSString *size = [self objectAtIndex:0 array:sps];
    NSString *type = [self objectAtIndex:1 array:sps];
    NSString *name = [self objectAtIndex:2 array:sps];
    NSString *weight = [self objectAtIndex:3 array:sps];
    return [SMRDyFontParser font:size type:type name:name weight:weight];
}

@end
