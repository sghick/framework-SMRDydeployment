//
//  SMRDySafePerform.h
//  SMRDydeploymentDemo
//
//  Created by Tinswin on 2019/11/22.
//  Copyright © 2019 Tinswin. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface SMRDySafePerform : NSObject

+ (instancetype)sharedInstance;

+ (id)safe_performAction:(SEL)action object:(id)object target:(NSObject *)target;
+ (id)safe_performAction:(SEL)action objects:(NSArray *)objects target:(NSObject *)target;

@end

NS_ASSUME_NONNULL_END
