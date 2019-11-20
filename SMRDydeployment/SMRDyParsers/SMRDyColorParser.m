//
//  SMRDyColorParser.m
//  SMRDydeploymentDemo
//
//  Created by Tinswin on 2019/11/20.
//  Copyright © 2019 Tinswin. All rights reserved.
//

#import "SMRDyColorParser.h"

@implementation SMRDyColorParser

+ (UIColor *)color:(NSString *)string alpha:(nullable NSString *)alpha {
    string = string.uppercaseString;
    if ([string.lowercaseString hasPrefix:@"0x"]) string = [string substringFromIndex:2];
    if ([string hasPrefix:@"#"]) string = [string substringFromIndex:1];
    if (string.length != 6) return nil;
    UIColor *result = nil;
    unsigned int colorCode = 0;
    unsigned char R, G, B;
    if (nil != string) {
        NSScanner *scanner = [NSScanner scannerWithString:string];
        (void) [scanner scanHexInt:&colorCode];
    }
    R = (unsigned char) (colorCode >> 16);
    G = (unsigned char) (colorCode >> 8);
    B = (unsigned char) (colorCode >> 0); 
    result = [UIColor colorWithRed: (float)R/0xFF green: (float)G/0xFF blue: (float)B/0xFF alpha:alpha?alpha.doubleValue:1];
    return result;
}

@end
