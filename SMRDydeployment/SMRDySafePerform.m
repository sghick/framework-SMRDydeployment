//
//  SMRDySafePerform.m
//  SMRDydeploymentDemo
//
//  Created by Tinswin on 2019/11/22.
//  Copyright © 2019 Tinswin. All rights reserved.
//

#import "SMRDySafePerform.h"
#import "SMRDyUtils.h"

@implementation SMRDySafePerform

+ (instancetype)sharedInstance {
    static dispatch_once_t onceToken;
    static SMRDySafePerform *_perform = nil;
    dispatch_once(&onceToken, ^{
        _perform = [[SMRDySafePerform alloc] init];
    });
    return _perform;
}

- (id)safe_getReturnValueAtInvocation:(NSInvocation *)invocation {
    const char* retType = [invocation.methodSignature methodReturnType];
    if (strcmp(retType, @encode(void)) == 0) {
        return nil;
    }
    
    if (strcmp(retType, @encode(NSInteger)) == 0) {
        NSInteger result = 0;
        [invocation getReturnValue:&result];
        return @(result);
    }
    
    if (strcmp(retType, @encode(BOOL)) == 0) {
        BOOL result = 0;
        [invocation getReturnValue:&result];
        return @(result);
    }
    
    if (strcmp(retType, @encode(CGFloat)) == 0) {
        CGFloat result = 0;
        [invocation getReturnValue:&result];
        return @(result);
    }
    
    if (strcmp(retType, @encode(NSUInteger)) == 0) {
        NSUInteger result = 0;
        [invocation getReturnValue:&result];
        return @(result);
    }
    
    if (strcmp(retType, @encode(CGRect)) == 0) {
        CGRect result = CGRectZero;
        [invocation getReturnValue:&result];
        return NSStringFromCGRect(result);
    }
    
    id result = nil;
    [invocation getReturnValue:&result];
    return result;
}

- (void)safe_setArgument:(id)object atIndex:(NSInteger)idx invocation:(NSInvocation *)invocation {
    if (idx >= invocation.methodSignature.numberOfArguments) {
        return;
    }
    
    const char* argumentType = [invocation.methodSignature getArgumentTypeAtIndex:idx];
    if (strcmp(argumentType, @encode(void)) == 0) {
        [invocation setArgument:&object atIndex:idx];
        return;
    }
    
    if (strcmp(argumentType, @encode(NSInteger)) == 0) {
        NSInteger value = [SMRDyUtils toNSInteger:object];
        [invocation setArgument:&value atIndex:idx];
        return;
    }
    
    if (strcmp(argumentType, @encode(BOOL)) == 0) {
        BOOL value = [SMRDyUtils toBool:object];
        [invocation setArgument:&value atIndex:idx];
        return;
    }
    
    if (strcmp(argumentType, @encode(CGFloat)) == 0) {
        CGFloat value = [SMRDyUtils toCGFloat:object];
        [invocation setArgument:&value atIndex:idx];
        return;
    }
    
    if (strcmp(argumentType, @encode(NSUInteger)) == 0) {
        NSUInteger value = [SMRDyUtils toNSUInteger:object];
        [invocation setArgument:&value atIndex:idx];
        return;
    }
    
    if (strcmp(argumentType, @encode(CGRect)) == 0) {
        CGRect value = [SMRDyUtils toCGRect:object];
        [invocation setArgument:&value atIndex:idx];
        return;
    }
    
    id ovalue = [self safe_toObject:object];
    [invocation setArgument:&ovalue atIndex:idx];
}

- (id)safe_toObject:(NSString *)object {
    if (![object isKindOfClass:NSString.class]) {
        return object;
    }
    id ovalue = nil;
    if (!ovalue) {
        ovalue = [SMRDyUtils toUIColor:object];
    }
    if (!ovalue) {
        ovalue = [SMRDyUtils toUIFont:object];
    }
    return ovalue ?: object;
}

#pragma mark - Public

+ (id)safe_performAction:(SEL)action object:(id)object target:(NSObject *)target {
    return [self safe_performAction:action objects:@[object] target:target];
}

+ (id)safe_performAction:(SEL)action objects:(NSArray *)objects target:(NSObject *)target {
    NSMethodSignature *methodSig = [target methodSignatureForSelector:action];
    if(methodSig == nil) {
        return nil;
    }

    NSInvocation *invocation = [NSInvocation invocationWithMethodSignature:methodSig];
    for (NSInteger i = 0; i < objects.count; i++) {
        id object = objects[i];
        [[self sharedInstance] safe_setArgument:object atIndex:(i + 2) invocation:invocation];
    }
    [invocation setSelector:action];
    [invocation setTarget:target];
    [invocation invoke];
    return [[self sharedInstance] safe_getReturnValueAtInvocation:invocation];
}

@end
