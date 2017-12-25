//
//  HgDataBaseManager.m
//  HgQmui
//
//  Created by RicardoM Lu on 2017/12/16.
//  Copyright © 2017年 RicardoM Lu. All rights reserved.
//

#import "HgDataBaseManager.h"
@interface HgDataBaseManager ()


@end

@implementation HgDataBaseManager
static NSString *const userTableName = @"USERTABLE";

+ (HgDataBaseManager *)shareInstance {
    static HgDataBaseManager *instance = nil;
    static dispatch_once_t predicate;
    dispatch_once(&predicate, ^{
        instance = [[[self class] alloc] init];

    });
    return instance;
}
/*
 *用户登录数据插入本地数据库，保证每一个用户都有一个数据表
 */
-(void)addUserModelWithWHC:(UserModel *)model{
    
    NSString * where = [NSString stringWithFormat:@"%@ = %@%@%@ %@ %@ = %@%@%@",@"hgMobile",@"'",model.hgMobile,@"'",@"AND",@"hgRegistTime",@"'",model.hgRegistTime,@"'"];
    NSArray*  personArray = [WHC_ModelSqlite query:[UserModel class]
                                       where:where];
    if (personArray.count>1) {
        [WHC_ModelSqlite update:model where:where];
    }else{
        [WHC_ModelSqlite insert:model];
    }

}
@end
