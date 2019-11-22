//
//  SMRDyEnums.h
//  SMRDydeploymentDemo
//
//  Created by Tinswin on 2019/11/20.
//  Copyright © 2019 Tinswin. All rights reserved.
//

#ifndef SMRDyEnums_h
#define SMRDyEnums_h

typedef NS_ENUM(NSInteger, SMRDyPropertyType) {
    SMRDyPropertyTypeString = 0,    // 基本类型
    SMRDyPropertyTypeInt64  = 1,    // 基本类型
    
    SMRDyPropertyTypeFrame  = 11,   // frame类型
    SMRDyPropertyTypeFont   = 12,   // 字体类型
    SMRDyPropertyTypeColor  = 13,   // 颜色类型
};

#endif /* SMRDyEnums_h */
