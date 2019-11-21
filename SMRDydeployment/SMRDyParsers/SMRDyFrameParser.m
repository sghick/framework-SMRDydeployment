//
//  SMRDyFrameParser.m
//  SMRDydeploymentDemo
//
//  Created by Tinswin on 2019/11/20.
//  Copyright © 2019 Tinswin. All rights reserved.
//

#import "SMRDyFrameParser.h"

typedef NS_ENUM(NSInteger, SMRDyExpressType) {
    SMRDyExpressPluss,    // 加 +
    SMRDyExpressReduce,   // 减 -
    SMRDyExpressRide,     // 乘 *
    SMRDyExpressExcept,   // 除 /
    SMRDyExpressMode,     // 模 %
};

typedef struct SMRDyExpress {
    struct SMRDyExpress *e1;
    struct SMRDyExpress *e2;
    double v1;
    double v2;
    SMRDyExpressType type;
} SMRDyExpress;

NS_INLINE SMRDyExpress SMRDyExpressBaseMake(double v1, double v2, SMRDyExpressType type) {
    SMRDyExpress ep;
    ep.e1 = NULL;
    ep.e2 = NULL;
    ep.v1 = v1;
    ep.v2 = v2;
    ep.type = type;
    return ep;
};

NS_INLINE SMRDyExpress SMRDyExpressMake(SMRDyExpress *e1, double v1, SMRDyExpress *e2, double v2, SMRDyExpressType type) {
    SMRDyExpress ep = SMRDyExpressBaseMake(v1, v1, type);
    ep.e1 = e1;
    ep.e2 = e2;
    return ep;
};

NS_INLINE double SMRDyExpressExcute(SMRDyExpress e) {
    double rtn = 0;
    double v1 = (e.e1 != NULL) ? SMRDyExpressExcute(*e.e1) : e.v1;
    double v2 = (e.e2 != NULL) ? SMRDyExpressExcute(*e.e2) : e.v2;
    switch (e.type) {
        case SMRDyExpressPluss:   {return v1 + v2;} break;
        case SMRDyExpressReduce:  {return v1 - v2;} break;
        case SMRDyExpressRide:    {return v1 * v2;} break;
        case SMRDyExpressExcept:  {return v1 / v2;} break;
        case SMRDyExpressMode:    {return (int64_t)v1 % (int64_t)v2;} break;
            
        default:
            break;
    }
    return rtn;
}

NS_INLINE SMRDyExpress SMRDyExpressBaseFromString(NSString *exp) {
    SMRDyExpressType type = SMRDyExpressPluss;
    NSString *ch = @"";
    if ([exp containsString:@"+"]) {type = SMRDyExpressPluss; ch = @"+";}
    else if ([exp containsString:@"-"]) {type = SMRDyExpressReduce; ch = @"-";}
    else if ([exp containsString:@"*"]) {type = SMRDyExpressRide; ch = @"*";}
    else if ([exp containsString:@"/"]) {type = SMRDyExpressExcept; ch = @"/";}
    else if ([exp containsString:@"%"]) {type = SMRDyExpressMode; ch = @"%";}
    NSArray<NSString *> *sp = [exp componentsSeparatedByString:ch];
    SMRDyExpress e = SMRDyExpressBaseMake(sp.firstObject.doubleValue,
                                          sp.lastObject.doubleValue,
                                          type);
    return e;
}

NS_INLINE double SMRDyExpressExcuteBaseString(NSString *exp) {
    return SMRDyExpressExcute(SMRDyExpressBaseFromString(exp));
}

@implementation SMRDyFrameParser

+ (CGRect)frame:(NSString *)x y:(NSString *)y w:(NSString *)w h:(NSString *)h {
    return CGRectMake(SMRDyExpressExcuteBaseString([self stringByReplace:x]),
                      SMRDyExpressExcuteBaseString([self stringByReplace:y]),
                      SMRDyExpressExcuteBaseString([self stringByReplace:w]),
                      SMRDyExpressExcuteBaseString([self stringByReplace:h]));
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
