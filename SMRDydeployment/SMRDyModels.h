//
//  SMRDyModels.h
//  SMRDydeploymentDemo
//
//  Created by Tinswin on 2019/11/20.
//  Copyright © 2019 Tinswin. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "SMRDyEnums.h"

NS_ASSUME_NONNULL_BEGIN

@protocol SMRDyModelDelegate <NSObject>

+ (instancetype)dyInstanceWithJson:(id)json;

@end

@interface SMRDyModels : NSObject<SMRDyModelDelegate>

+ (NSArray *)dyArrayWithJson:(id)json;
+ (instancetype)dyInstanceWithData:(NSData *)data;
+ (instancetype)dyInstanceWithContentOfFile:(NSString *)file;

@end

@interface SMRDyProperty : SMRDyModels

@property (assign, nonatomic) SMRDyPropertyType type;
@property (strong, nonatomic) NSString *key;
@property (strong, nonatomic) NSString *value;

- (SEL)p_setter;
- (SEL)p_getter;
- (NSObject *)p_object;

@end

@interface SMRDyView : SMRDyModels

@property (strong, nonatomic) NSString *identifier;
@property (strong, nonatomic) NSString *class_name;
@property (strong, nonatomic) NSString *frame;
@property (strong, nonatomic) NSString *backgroundColor;

@property (strong, nonatomic) NSArray<SMRDyProperty *> *properties;

@property (strong, nonatomic, nullable) NSArray<SMRDyView *> *sub_views;

@end

@interface SMRDyPage : SMRDyModels

@property (strong, nonatomic) NSString *identifier;
@property (strong, nonatomic) NSString *class_name;
@property (strong, nonatomic) NSString *title;
@property (strong, nonatomic) NSString *backgroundColor;

@property (strong, nonatomic) NSArray<SMRDyProperty *> *properties;

@property (strong, nonatomic, nullable) NSArray<SMRDyView *> *sub_views;
@property (strong, nonatomic, nullable) NSArray<SMRDyPage *> *sub_pages;


@end

NS_ASSUME_NONNULL_END
