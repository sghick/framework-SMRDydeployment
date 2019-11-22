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
    SMRDyPropertyTypeBase   = 0,    // 基本类型,包括字符串,数字,结构体等
    
    SMRDyPropertyTypeColor  = 11,   // 颜色类型
    SMRDyPropertyTypeFont   = 12,   // 字体类型
};

#endif /* SMRDyEnums_h */
