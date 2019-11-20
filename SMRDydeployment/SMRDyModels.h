//
//  SMRDyModels.h
//  SMRDydeploymentDemo
//
//  Created by Tinswin on 2019/11/20.
//  Copyright © 2019 Tinswin. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface SMRDyModels : NSObject

@end

@interface SMRDyView : NSObject

@property (strong, nonatomic) NSString *class_name;
@property (strong, nonatomic, nullable) NSArray<SMRDyView *> *sub_views;

@end

@interface SMRDyPage : NSObject

@property (strong, nonatomic) NSString *class_name;

@property (strong, nonatomic) NSString *title;
@property (strong, nonatomic) NSString *backgroundColor;

@property (strong, nonatomic, nullable) NSArray<SMRDyView *> *sub_views;
@property (strong, nonatomic, nullable) NSArray<SMRDyPage *> *sub_pages;

#pragma mark - Test

+ (SMRDyPage *)rootPage;

@end

NS_ASSUME_NONNULL_END
