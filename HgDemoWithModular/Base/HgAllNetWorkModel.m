//
//  HgAllNetWorkModel.m
//  HgQmui
//
//  Created by RicardoM Lu on 2017/12/15.
//  Copyright © 2017年 RicardoM Lu. All rights reserved.
//

#import "HgAllNetWorkModel.h"

@implementation HgAllNetWorkModel
+ (NSDictionary *)modelCustomPropertyMapper {
    return @{
             @"message" : @"message"
             ,@"status" : @"status"
             ,@"data":@"data"
             };
}
@end
