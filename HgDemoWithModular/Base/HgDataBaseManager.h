//
//  HgDataBaseManager.h
//  HgQmui
//
//  Created by RicardoM Lu on 2017/12/16.
//  Copyright © 2017年 RicardoM Lu. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "UserModel.h"

@interface HgDataBaseManager : NSObject

+ (HgDataBaseManager *)shareInstance;

/*
 *用户登录数据插入本地数据库，保证每一个用户都有一个数据表
 */
-(void)addUserModelWithWHC:(UserModel *)model;

@end
