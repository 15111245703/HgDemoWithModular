//
//  HgBaseCustomObj.h
//  HGBasicFramework
//
//  Created by RicardoM Lu on 2017/8/17.
//  Copyright © 2017年 RicardoM Lu. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface HgBaseCustomObj : NSObject
+(HgBaseCustomObj *)shareInstance;
/**
 * 该方法是因为存在登录失效的情况，需提示后用自动登录，更新本地信息
 */
-(void)isLogonFailure;
/**
 * 当前本地存在账号和密码的情况下直接进入首页，再进行自动登录，更新本地信息
 */
-(void)loginWithMain;


/**
 * 验证按钮读秒
 */
-(void)verificationStartTime:(UIButton *)btn;

@end

@interface UserDefaultsObj : NSObject

+(UserDefaultsObj *)shareInstance;
/**
 *  获取默认用户
 *
 *  @return 是否获取到数据
 */
- (BOOL)getDefaultUser;
/*获取用户账号*/
- (NSString *)getDefaultMobile;
/*获取用户密码*/
- (NSString *)getDefaultUserPwd;
@end


