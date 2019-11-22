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

+ (id)safe_performAction:(SEL)action target:(NSObject *)target object:(id)object;

@end

NS_ASSUME_NONNULL_END
