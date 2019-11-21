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
    // TODO:replace s1,s2...
    string = [string stringByReplacingOccurrencesOfString:@"s1" withString:@"1.5"];
    string = [string stringByReplacingOccurrencesOfString:@"s2" withString:@"2"];
    return string;
}

@end
