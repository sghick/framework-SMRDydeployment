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

- (void)dyViewDidLoad:(SMRDyView *)dyView;

@end

@class SMRDyPage;
@protocol SMRDyPageProtocol <NSObject>

- (void)dyPageDidLoad:(SMRDyPage *)dyPage;
- (void)dyPageViewDidLoad:(SMRDyPage *)dyPage;

@end

NS_ASSUME_NONNULL_END
