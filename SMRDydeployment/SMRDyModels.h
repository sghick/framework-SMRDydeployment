//
//  SMRDyModels.h
//  SMRDydeploymentDemo
//
//  Created by Tinswin on 2019/11/20.
//  Copyright © 2019 Tinswin. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@protocol SMRDyModelDelegate <NSObject>

+ (instancetype)dyInstanceWithJson:(id)json;

@end

@interface SMRDyModels : NSObject<SMRDyModelDelegate>

+ (NSArray *)dyArrayWithJson:(id)json;
+ (instancetype)dyInstanceWithData:(NSData *)data;
+ (instancetype)dyInstanceWithContentOfFile:(NSString *)file;

@end

@interface SMRDyView : SMRDyModels<SMRDyModelDelegate>

@property (strong, nonatomic) NSString *identifier;
@property (strong, nonatomic) NSString *class_name;
@property (strong, nonatomic) NSString *frame;
@property (strong, nonatomic) NSString *backgroundColor;

@property (strong, nonatomic, nullable) NSArray<SMRDyView *> *sub_views;

@end

@interface SMRDyPage : SMRDyModels<SMRDyModelDelegate>

@property (strong, nonatomic) NSString *identifier;
@property (strong, nonatomic) NSString *class_name;
@property (strong, nonatomic) NSString *title;
@property (strong, nonatomic) NSString *backgroundColor;

@property (strong, nonatomic, nullable) NSArray<SMRDyView *> *sub_views;
@property (strong, nonatomic, nullable) NSArray<SMRDyPage *> *sub_pages;

#pragma mark - Test

+ (SMRDyPage *)rootPage;

@end

NS_ASSUME_NONNULL_END
