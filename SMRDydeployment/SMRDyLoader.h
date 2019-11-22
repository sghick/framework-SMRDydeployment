//
//  SMRDyLoader.h
//  SMRDydeploymentDemo
//
//  Created by Tinswin on 2019/11/20.
//  Copyright © 2019 Tinswin. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@class SMRDyPage;
@class SMRDyView;
@interface SMRDyLoader : NSObject

+ (instancetype)loader;

- (void)loadfile:(NSString *)file inWindow:(UIWindow *)inWindow;
- (void)loadjson:(NSDictionary *)json inWindow:(UIWindow *)inWindow;
- (void)loadDyPage:(SMRDyPage *)dyPage inWindow:(UIWindow *)inWindow;

#pragma mark - Utils

+ (UIViewController *)controllerWithDyPage:(SMRDyPage *)dyPage;
+ (UIView *)viewWithDyView:(SMRDyView *)dyView;

@end

NS_ASSUME_NONNULL_END
