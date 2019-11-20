//
//  SMRDyFrameParser.m
//  SMRDydeploymentDemo
//
//  Created by Tinswin on 2019/11/20.
//  Copyright © 2019 Tinswin. All rights reserved.
//

#import "SMRDyFrameParser.h"

@implementation SMRDyFrameParser

+ (CGRect)frame:(NSString *)x y:(NSString *)y w:(NSString *)w h:(NSString *)h {
    
    return CGRectMake(x.doubleValue, y.doubleValue, w.doubleValue, h.doubleValue);
}

@end
