//
//  SMRDyModels.m
//  SMRDydeploymentDemo
//
//  Created by Tinswin on 2019/11/20.
//  Copyright © 2019 Tinswin. All rights reserved.
//

#import "SMRDyModels.h"

@implementation SMRDyModels

+ (instancetype)dyInstanceWithJson:(id)json {
    return nil;
}

+ (NSArray *)dyArrayWithJson:(id)json {
    if (![json isKindOfClass:NSArray.class]) {
        return nil;
    }
    NSMutableArray *arr = [NSMutableArray array];
    for (id sj in json) {
        id obj = [self dyInstanceWithJson:sj];
        if (obj) {
            [arr addObject:obj];
        }
    }
    return [arr copy];
}

+ (instancetype)dyInstanceWithData:(NSData *)data {
    NSDictionary *json =
    [NSJSONSerialization JSONObjectWithData:data
                                    options:NSJSONReadingMutableContainers
                                      error:nil];
    return [self dyInstanceWithJson:json];
}

+ (instancetype)dyInstanceWithContentOfFile:(NSString *)file {
    NSData *data = [NSData dataWithContentsOfFile:file];
    return [self dyInstanceWithData:data];
}

@end

@implementation SMRDyView

+ (instancetype)dyInstanceWithJson:(id)json {
    if (![json isKindOfClass:NSDictionary.class]) {
        return nil;
    }
    SMRDyView *dyView = [[SMRDyView alloc] init];
    dyView.identifier = json[@"identifier"];
    dyView.class_name = json[@"class_name"];
    dyView.frame = json[@"frame"];
    dyView.backgroundColor = json[@"backgroundColor"];
    dyView.sub_views = [SMRDyView dyArrayWithJson:json[@"sub_views"]];
    return dyView;
}

@end

@implementation SMRDyPage

+ (instancetype)dyInstanceWithJson:(id)json {
    if (![json isKindOfClass:NSDictionary.class]) {
        return nil;
    }
    SMRDyPage *dyView = [[SMRDyPage alloc] init];
    dyView.identifier = json[@"identifier"];
    dyView.class_name = json[@"class_name"];
    dyView.title = json[@"title"];
    dyView.backgroundColor = json[@"backgroundColor"];
    dyView.sub_pages = [SMRDyPage dyArrayWithJson:json[@"sub_pages"]];
    dyView.sub_views = [SMRDyView dyArrayWithJson:json[@"sub_views"]];
    return dyView;
}

@end
