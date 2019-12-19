//
//  SMRDyFrameParser.m
//  SMRDydeploymentDemo
//
//  Created by Tinswin on 2019/11/20.
//  Copyright © 2019 Tinswin. All rights reserved.
//

#import "SMRDyFrameParser.h"
#import <JavaScriptCore/JavaScriptCore.h>

@implementation SMRDyFrameParser

+ (CGRect)frame:(NSString *)x y:(NSString *)y w:(NSString *)w h:(NSString *)h {
    return CGRectMake([self valueByJavaString:[self stringByReplace:x]],
                      [self valueByJavaString:[self stringByReplace:y]],
                      [self valueByJavaString:[self stringByReplace:w]],
                      [self valueByJavaString:[self stringByReplace:h]]);
}

+ (double)valueByJavaString:(NSString *)string {
    NSString *jsString = [NSString stringWithFormat:@"function valueByJS(){return %@};valueByJS()", string];
    JSContext *context = [[JSContext alloc] init];
    JSValue *jsvalue = [context evaluateScript:jsString];
    return jsvalue.toDouble;
}

+ (NSString *)stringByReplace:(NSString *)string {
    NSString *w = [NSString stringWithFormat:@"%@", @([UIScreen mainScreen].bounds.size.width)];
    NSString *h = [NSString stringWithFormat:@"%@", @([UIScreen mainScreen].bounds.size.height)];
    string = [string stringByReplacingOccurrencesOfString:@"w" withString:w];
    string = [string stringByReplacingOccurrencesOfString:@"h" withString:h];
    string = [self stringByReplacingSalef:@"s" fromString:string];
    string = [self stringByReplacingSalef:@"s1" fromString:string];
    string = [self stringByReplacingSalef:@"s2" fromString:string];
    return string;
}

+ (NSString *)stringByReplacingSalef:(NSString *)salef fromString:(NSString *)fromString {
    if (![fromString containsString:salef]) {
        return fromString;
    }
    NSNumber *w = [self saleBaseWidthMapper][salef];
    NSString *r = [NSString stringWithFormat:@"%@", @([UIScreen mainScreen].bounds.size.width/w.doubleValue)];
    return [fromString stringByReplacingOccurrencesOfString:salef withString:r];
}

+ (NSDictionary *)saleBaseWidthMapper {
    // width of iPhone6
    return @{@"s":@(375.0), @"s1":@(375.0), @"s2":@(414.0)};
}

@end
