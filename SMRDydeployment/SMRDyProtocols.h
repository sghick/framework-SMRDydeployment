//
//  SMRDyProtocols.h
//  SMRDydeploymentDemo
//
//  Created by Tinswin on 2019/11/20.
//  Copyright © 2019 Tinswin. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@protocol SMRDyProtocols <NSObject>

@end

@class SMRDyView;
@protocol SMRDyViewProtocol <NSObject>

@property (strong, nonatomic) SMRDyView *dyView;

@end

@class SMRDyPage;
@protocol SMRDyPageProtocol <NSObject>

@property (strong, nonatomic) SMRDyPage *dyPage;

@end

NS_ASSUME_NONNULL_END
