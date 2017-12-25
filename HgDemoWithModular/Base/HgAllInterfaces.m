//
//  HgAllInterfaces.m
//  HGBasicFramework
//
//  Created by RicardoM Lu on 2017/8/18.
//  Copyright © 2017年 RicardoM Lu. All rights reserved.
//

#import "HgAllInterfaces.h"
#import "AFNetworking.h"
#import "BANetManager_OC.h"
#import "HgBaseCustomObj.h"
@implementation HgAllInterfaces
//https://github.com/BAHome/BANetManager
+(void)post:(BADataEntity *)baDataEntity success:(void (^)(id))success failure:(void (^)(NSError *))failure progresss:(void (^)(float))progresss{
    [SVProgressHUD show];
    // 如果打印数据不完整，是因为 Xcode 8 版本问题，请下断点打印数据
    [BANetManager ba_request_POSTWithEntity:baDataEntity successBlock:^(id response) {
        [SVProgressHUD dismiss];
        
        HgAllNetWorkModel *model = [HgAllNetWorkModel yy_modelWithJSON:response];
        if ([model.status isEqualToString:@"1"]) {
            success(model.data);
            hgLog(@"%@",model.message);
            
        }else if([model.status isEqualToString:@"2"]){
            //出错了，提示错误信息
            [SVProgressHUD showInfoWithStatus:model.message];
            [SVProgressHUD dismissWithDelay:kSVProgressHUSDismissTime];
            hgLog(@"%@",model.message);
        }else if([model.status isEqualToString:@"3"]){
            //登录失效
            [[HgBaseCustomObj shareInstance] isLogonFailure];
        }
    } failureBlock:^(NSError *error) {
        [SVProgressHUD dismiss];
        failure(error);
        hgLog(@"%@",[[NSString alloc] initWithFormat:@"%@", error]);
        [SVProgressHUD showErrorWithStatus:[[NSString alloc] initWithFormat:@"%@", error]];
        [SVProgressHUD dismissWithDelay:kSVProgressHUSDismissTime];

    } progressBlock:^(int64_t bytesProgress, int64_t totalBytesProgress) {
        /*! 封装方法里已经回到主线程，所有这里不用再调主线程了 */
        
    }];
}
+ (void)get:(BADataEntity *)baDataEntity success:(void (^)(id json))success failure:(void (^)(NSError *))failure progresss:(void (^)(float))progresss{
    
    [SVProgressHUD show];
    // 如果打印数据不完整，是因为 Xcode 8 版本问题，请下断点打印数据
    [BANetManager ba_request_POSTWithEntity:baDataEntity successBlock:^(id response) {
        [SVProgressHUD dismiss];
        
        HgAllNetWorkModel *model = [HgAllNetWorkModel yy_modelWithJSON:response];
        if ([model.status isEqualToString:@"1"]) {
            success(response);
            hgLog(@"%@",response);
            
        }else if([model.status isEqualToString:@"2"]){
            //出错了，提示错误信息
            [SVProgressHUD showInfoWithStatus:model.message];
            [SVProgressHUD dismissWithDelay:kSVProgressHUSDismissTime];
            hgLog(@"%@",model.message);
        }else if([model.status isEqualToString:@"3"]){
            //登录失效
            [[HgBaseCustomObj shareInstance] isLogonFailure];
        }
    } failureBlock:^(NSError *error) {
        [SVProgressHUD dismiss];
        failure(error);
        hgLog(@"%@",[[NSString alloc] initWithFormat:@"%@", error]);
        [SVProgressHUD showErrorWithStatus:[[NSString alloc] initWithFormat:@"%@", error]];
        [SVProgressHUD dismissWithDelay:kSVProgressHUSDismissTime];
    } progressBlock:^(int64_t bytesProgress, int64_t totalBytesProgress) {
        /*! 封装方法里已经回到主线程，所有这里不用再调主线程了 */
        
    }];
}
@end

