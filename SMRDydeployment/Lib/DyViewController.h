//
//  DyViewController.h
//  SMRDydeploymentDemo
//
//  Created by Tinswin on 2019/11/20.
//  Copyright © 2019 Tinswin. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SMRDyProtocols.h"

NS_ASSUME_NONNULL_BEGIN

@interface DyViewController : UIViewController<SMRDyPageProtocol>

@property (strong, nonatomic) SMRDyPage *dyPage;

@end

NS_ASSUME_NONNULL_END
