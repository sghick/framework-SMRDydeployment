//
//  SMRDyModels.m
//  SMRDydeploymentDemo
//
//  Created by Tinswin on 2019/11/20.
//  Copyright © 2019 Tinswin. All rights reserved.
//

#import "SMRDyModels.h"
#import "SMRDyUtils.h"

@implementation SMRDyModels

+ (instancetype)dyInstanceWithJson:(id)json {
    NSAssert(nil, @"请在子类实现些方法:%@", NSStringFromClass([self class]));
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
    if (!data) {
        return nil;
    }
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

//@implementation SMRDyProperty
//
//+ (instancetype)dyInstanceWithJson:(id)json {
//    if (![json isKindOfClass:NSDictionary.class]) {
//        return nil;
//    }
//    SMRDyProperty *object = [[SMRDyProperty alloc] init];
//    object.type = ((NSString *)json[@"type"]).integerValue;
//    object.key = json[@"key"];
//    object.value = json[@"value"];
//    return object;
//}
//
//- (SEL)p_setter {
//    NSString *sel = self.key;
//    if(self.key.length) {
//        sel = [sel stringByReplacingCharactersInRange:NSMakeRange(0, 1)
//                                           withString:[sel substringToIndex:1].capitalizedString];
//    }
//    return NSSelectorFromString([NSString stringWithFormat:@"set%@:", sel]);
//}
//
//- (SEL)p_getter {
//    return NSSelectorFromString(self.key);
//}
//
//- (NSObject *)p_object {
//    switch (self.type) {
//        case SMRDyPropertyTypeFont:{return [SMRDyUtils toUIFont:self.value];} break;
//        case SMRDyPropertyTypeColor:{return [SMRDyUtils toUIColor:self.value];} break;
//        default:
//            return self.value;
//            break;
//    }
//}
//
//@end
//
//@implementation SMRDyMethod
//
//+ (instancetype)dyInstanceWithJson:(id)json {
//    if (![json isKindOfClass:NSDictionary.class]) {
//        return nil;
//    }
//    SMRDyMethod *object = [[SMRDyMethod alloc] init];
//    object.method = json[@"method"];
//    object.params = [SMRDyProperty dyArrayWithJson:json[@"params"]];
//    return object;
//}
//
//@end

@implementation SMRDyView

+ (instancetype)dyInstanceWithJson:(id)json {
    if (![json isKindOfClass:NSDictionary.class]) {
        return nil;
    }
    SMRDyView *object = [[SMRDyView alloc] init];
    object.identifier = json[@"identifier"];
    object.class_name = json[@"class_name"];
    object.frame = json[@"frame"];
    object.backgroundColor = json[@"backgroundColor"];
    
    object.properties = json[@"properties"];
    object.methods = json[@"methods"];
    
    object.sub_views = [SMRDyView dyArrayWithJson:json[@"sub_views"]];
    return object;
}

@end

@implementation SMRDyPage

+ (instancetype)dyInstanceWithJson:(id)json {
    if (![json isKindOfClass:NSDictionary.class]) {
        return nil;
    }
    SMRDyPage *object = [[SMRDyPage alloc] init];
    object.identifier = json[@"identifier"];
    object.class_name = json[@"class_name"];
    object.title = json[@"title"];
    object.backgroundColor = json[@"backgroundColor"];
    
    object.properties = json[@"properties"];
    object.methods = json[@"methods"];
    
    object.sub_views = [SMRDyView dyArrayWithJson:json[@"sub_views"]];
    object.sub_pages = [SMRDyPage dyArrayWithJson:json[@"sub_pages"]];
    return object;
}

@end
