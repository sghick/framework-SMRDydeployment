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

+ (NSInteger)toNSInteger:(id)object {
    if ([object isKindOfClass:NSString.class]) {
        return ((NSString *)object).integerValue;
    }
    if ([object isKindOfClass:NSNumber.class]) {
        return ((NSNumber *)object).integerValue;
    }
    return 0;
}

+ (BOOL)toBool:(id)object {
    if ([object isKindOfClass:NSString.class]) {
        return ((NSString *)object).boolValue;
    }
    if ([object isKindOfClass:NSNumber.class]) {
        return ((NSNumber *)object).boolValue;
    }
    return NO;
}

+ (CGFloat)toCGFloat:(id)object {
    if ([object isKindOfClass:NSString.class]) {
        return ((NSString *)object).doubleValue;
    }
    if ([object isKindOfClass:NSNumber.class]) {
        return ((NSNumber *)object).doubleValue;
    }
    return 0;
}

+ (NSUInteger)toNSUInteger:(id)object {
    if ([object isKindOfClass:NSString.class]) {
        return ((NSString *)object).longLongValue;
    }
    if ([object isKindOfClass:NSNumber.class]) {
        return ((NSNumber *)object).unsignedLongValue;
    }
    return 0;
}

+ (CGRect)toCGRect:(id)object {
    if (![object isKindOfClass:NSString.class]) {
        return CGRectZero;
    }
    NSString *string = (NSString *)object;
    string = [string stringByReplacingOccurrencesOfString:@"{" withString:@""];
    string = [string stringByReplacingOccurrencesOfString:@"}" withString:@""];
    NSArray<NSString *> *sps = [string componentsSeparatedByString:@","];
    NSString *x = [self objectAtIndex:0 array:sps];
    NSString *y = [self objectAtIndex:1 array:sps];
    NSString *w = [self objectAtIndex:2 array:sps];
    NSString *h = [self objectAtIndex:3 array:sps];
    return [SMRDyFrameParser frame:x y:y w:w h:h];
}

+ (UIColor *)toUIColor:(id)object {
    if (![object isKindOfClass:NSString.class]) {
        return nil;
    }
    NSString *string = (NSString *)object;
    NSArray<NSString *> *sps = [string componentsSeparatedByString:@","];
    NSString *cString = [self objectAtIndex:0 array:sps];
    NSString *alpha = [self objectAtIndex:1 array:sps];
    return [SMRDyColorParser color:cString alpha:alpha];
}

+ (UIFont *)toUIFont:(id)object {
    if (![object isKindOfClass:NSString.class]) {
        return nil;
    }
    NSString *string = (NSString *)object;
    NSArray<NSString *> *sps = [string componentsSeparatedByString:@","];
    NSString *size = [self objectAtIndex:0 array:sps];
    NSString *type = [self objectAtIndex:1 array:sps];
    NSString *name = [self objectAtIndex:2 array:sps];
    NSString *weight = [self objectAtIndex:3 array:sps];
    return [SMRDyFontParser font:size type:type name:name weight:weight];
}

@end
