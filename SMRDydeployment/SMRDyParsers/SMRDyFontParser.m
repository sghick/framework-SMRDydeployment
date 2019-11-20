//
//  SMRDyFontParser.m
//  SMRDydeploymentDemo
//
//  Created by Tinswin on 2019/11/20.
//  Copyright © 2019 Tinswin. All rights reserved.
//

#import "SMRDyFontParser.h"

@implementation SMRDyFontParser

+ (UIFont *)font:(NSString *)size type:(NSString *)type name:(NSString *)name weight:(NSString *)weight {
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
