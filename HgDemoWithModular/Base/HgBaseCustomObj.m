//
//  HgBaseCustomObj.m
//  HGBasicFramework
//
//  Created by RicardoM Lu on 2017/8/17.
//  Copyright © 2017年 RicardoM Lu. All rights reserved.
//

#import "HgBaseCustomObj.h"
#import "UserModel.h"
#import <sys/utsname.h>

@implementation HgBaseCustomObj
+ (HgBaseCustomObj *)shareInstance {
    static HgBaseCustomObj *instance = nil;
    static dispatch_once_t predicate;
    dispatch_once(&predicate, ^{
        instance = [[[self class] alloc] init];
    });
    return instance;
}

/**
 * 验证按钮读秒
 */
-(void)verificationStartTime:(UIButton *)btn{
    
    __block int timeout= 60; //倒计时时间
    dispatch_queue_t queue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0);
    dispatch_source_t _timer = dispatch_source_create(DISPATCH_SOURCE_TYPE_TIMER, 0, 0,queue);
    dispatch_source_set_timer(_timer,dispatch_walltime(NULL, 0),1.0*NSEC_PER_SEC, 0); //每秒执行
    dispatch_source_set_event_handler(_timer, ^{
        if(timeout<=0){ //倒计时结束，关闭
            dispatch_source_cancel(_timer);
            dispatch_async(dispatch_get_main_queue(), ^{
                [btn setTitle:@"重新发送" forState:UIControlStateNormal];
                btn.enabled = YES;
            });
        }else{
            dispatch_async(dispatch_get_main_queue(), ^{
                
                [UIView beginAnimations:nil context:nil];
                [UIView setAnimationDuration:1];
                [btn setTitle:[NSString stringWithFormat:@"重新发送(%zd)",timeout] forState:UIControlStateNormal];
                [UIView commitAnimations];
                btn.enabled = NO;
            });
            timeout--;
        }
    });
    dispatch_resume(_timer);
    
}
//该方法是因为存在登录失效的情况，需提示后用自动登录，更新本地信息
-(void)isLogonFailure{
    NSString * mobile = [[UserDefaultsObj shareInstance] getDefaultMobile];
    NSString * pwd =[[UserDefaultsObj shareInstance] getDefaultUserPwd];
    
    
    [HgAllParametersAndURL hg_PostUserLogin:mobile pswd:pwd onSuc:^(id json) {
        hgLog(@"%@",json);
        UserModel *model = [UserModel yy_modelWithJSON:json];
        HgTmCustomer * tmCustomermodel =model.hgTmCustomer;
        [[HgDataBaseManager shareInstance] addUserModelWithWHC:model];
        //WHC_ModelSqlite用户模型存入本地，第二个用户登录会存入第二个用户模型
        //保存默认用户的信息，第二个用户登录，会替换第一个人的用户信息
        [DEFAULTS setObject:model.hgMobile forKey:kuserHgMobile];
        [DEFAULTS setObject:pwd forKey:kuserHgPassword];
        [DEFAULTS setObject:model.hgAppKey forKey:kuserHgAppKey];
        [DEFAULTS setObject:tmCustomermodel.hgUpdateDate forKey:kuserHgUpdateDate];
        [DEFAULTS setObject:model.hgId forKey:kuserHgId];
        [DEFAULTS setObject:tmCustomermodel.hgCreateDate forKey:kuserHgCreateDate];
        [DEFAULTS setObject:tmCustomermodel.hgMemberId forKey:kuserHgMemberId];
        [DEFAULTS setObject:tmCustomermodel.hgCertifiedFlag forKey:kuserHgCertifiedFlag];
        [DEFAULTS setObject:tmCustomermodel.hgIsNewRecord forKey:kuserHgIsNewRecord];
        [DEFAULTS synchronize];
        [SVProgressHUD showSuccessWithStatus:@"自动登录成功，请继续操作!"];
        [SVProgressHUD dismissWithDelay:kSVProgressHUSDismissTime];
    } onError:^(NSError *error) {
        
    } onProgress:^(float progress) {
        
    }];
}
-(void)loginWithMain{
    NSString * mobile = [[UserDefaultsObj shareInstance] getDefaultMobile];
    NSString * pwd =[[UserDefaultsObj shareInstance] getDefaultUserPwd];
    
    
    [HgAllParametersAndURL hg_PostUserLogin:mobile pswd:pwd onSuc:^(id json) {
        hgLog(@"%@",json);
        UserModel *model = [UserModel yy_modelWithJSON:json];
        HgTmCustomer * tmCustomermodel =model.hgTmCustomer;
        [[HgDataBaseManager shareInstance] addUserModelWithWHC:model];
        //WHC_ModelSqlite用户模型存入本地，第二个用户登录会存入第二个用户模型
        //保存默认用户的信息，第二个用户登录，会替换第一个人的用户信息
        [DEFAULTS setObject:model.hgMobile forKey:kuserHgMobile];
        [DEFAULTS setObject:pwd forKey:kuserHgPassword];
        [DEFAULTS setObject:model.hgAppKey forKey:kuserHgAppKey];
        [DEFAULTS setObject:tmCustomermodel.hgUpdateDate forKey:kuserHgUpdateDate];
        [DEFAULTS setObject:model.hgId forKey:kuserHgId];
        [DEFAULTS setObject:tmCustomermodel.hgCreateDate forKey:kuserHgCreateDate];
        [DEFAULTS setObject:tmCustomermodel.hgMemberId forKey:kuserHgMemberId];
        [DEFAULTS setObject:tmCustomermodel.hgCertifiedFlag forKey:kuserHgCertifiedFlag];
        [DEFAULTS setObject:tmCustomermodel.hgIsNewRecord forKey:kuserHgIsNewRecord];
        [DEFAULTS synchronize];
        [SVProgressHUD showSuccessWithStatus:@"自动登录成功，请继续操作!"];
        [SVProgressHUD dismissWithDelay:kSVProgressHUSDismissTime];
    } onError:^(NSError *error) {
        
    } onProgress:^(float progress) {
        
    }];
    
}

@end

@implementation UserDefaultsObj
+ (UserDefaultsObj *)shareInstance {
    static UserDefaultsObj *instance = nil;
    static dispatch_once_t predicate;
    dispatch_once(&predicate, ^{
        instance = [[[self class] alloc] init];
    });
    return instance;
}


/**
 *  获取默认用户
 *
 *  @return 是否获取到数据
 */
- (BOOL)getDefaultUser {
    NSString *mobile =
    [[NSUserDefaults standardUserDefaults] objectForKey:kuserHgMobile];
    NSString *userPwd =
    [[NSUserDefaults standardUserDefaults] objectForKey:kuserHgPassword];
    return mobile && userPwd;
}
/*获取用户账号*/
- (NSString *)getDefaultMobile {
    NSString *defaultUser =
    [[NSUserDefaults standardUserDefaults] objectForKey:kuserHgMobile];
    return defaultUser;
}

/*获取用户密码*/
- (NSString *)getDefaultUserPwd {
    NSString *defaultUserPwd =
    [[NSUserDefaults standardUserDefaults] objectForKey:kuserHgPassword];
    return defaultUserPwd;
}


@end


