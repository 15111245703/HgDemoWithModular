//
//  HgAllParametersAndURL.m
//  HGBasicFramework
//
//  Created by RicardoM Lu on 2017/8/18.
//  Copyright © 2017年 RicardoM Lu. All rights reserved.
//

#import "HgAllParametersAndURL.h"
#import "BANetManager_OC.h"
@implementation HgAllParametersAndURL


/**
 *  登陆
 */
+(void) hg_PostUserLogin:(NSString *)userPhone pswd:(NSString *)userPswd onSuc:(AFNetResponse)onSuc onError:(AFNetError)onError onProgress:(AFNetProgress)onProgress{
    NSDictionary *dicParams = [NSDictionary dictionaryWithObjectsAndKeys:
                               userPhone,@"mobile"
                               , userPswd,@"pwd"
                               ,nil];
    
    BADataEntity *entity = [BADataEntity new];
    entity.urlString = [HgBaseURL stringByAppendingString:@"/member/login"];
    entity.needCache = NO;
    entity.parameters = dicParams;
    [HgAllInterfaces post:entity success:onSuc failure:onError progresss:onProgress];
    
    hgLog(@"参数-----：%@,路径-----：%@",dicParams,entity.urlString);
}
/**
 *  注册发送短信验证码
 */
+(void)hg_PostVerficationCode:(NSString*)phoneNumber onSuc:(AFNetResponse)onSuc onError:(AFNetError)onError onProgress:(AFNetProgress)onProgress{
    NSDictionary *dicParams = [NSDictionary dictionaryWithObjectsAndKeys:
                               phoneNumber,@"mobile"
                               , @"REG",@"action"
                               ,nil];
    
    
    BADataEntity *entity = [BADataEntity new];
    entity.urlString = [HgBaseURL stringByAppendingString:@"/member/getSMSCode"];
    entity.needCache = NO;
    entity.parameters = dicParams;
    [HgAllInterfaces post:entity success:onSuc failure:onError progresss:onProgress];
    hgLog(@"参数-----：%@,路径-----：%@",dicParams,entity.urlString);
    
}
/**
 *  修改密码发送短信验证码
 */
+(void)hg_PostChangePasswordVerficationCode:(NSString*)phoneNumber onSuc:(AFNetResponse)onSuc onError:(AFNetError)onError onProgress:(AFNetProgress)onProgress{
    NSDictionary *dicParams = [NSDictionary dictionaryWithObjectsAndKeys:
                               phoneNumber,@"mobile"
                               ,@"FIN",@"action"
                               ,nil];
    
    
    BADataEntity *entity = [BADataEntity new];
    entity.urlString = [HgBaseURL stringByAppendingString:@"/member/getSMSCode"];
    entity.needCache = NO;
    entity.parameters = dicParams;
    [HgAllInterfaces post:entity success:onSuc failure:onError progresss:onProgress];
    hgLog(@"参数-----：%@,路径-----：%@",dicParams,entity.urlString);
    
}
/**
 *  修改密码->验证短信验证接口
 */
+(void)hg_PostVerifyTheVerficationCode:(NSString*)phoneNumber smsCode:(NSString *)smsCode onSuc:(AFNetResponse)onSuc onError:(AFNetError)onError onProgress:(AFNetProgress)onProgress{
    
    NSDictionary *dicParams = [NSDictionary dictionaryWithObjectsAndKeys:
                               phoneNumber,@"mobile"
                               ,smsCode,@"smsCode"
                               ,nil];
    
    BADataEntity *entity = [BADataEntity new];
    entity.urlString = [HgBaseURL stringByAppendingString:@"/member/validateSMSCode"];
    entity.needCache = NO;
    entity.parameters = dicParams;
    [HgAllInterfaces post:entity success:onSuc failure:onError progresss:onProgress];
    hgLog(@"参数-----：%@,路径-----：%@",dicParams,entity.urlString);
    
}
/**
 *  修改密码->验证短信验证接口->修改密码
 */
+(void)hg_PostModification:(NSString*)pwd appKey:(NSString *)appKey onSuc:(AFNetResponse)onSuc onError:(AFNetError)onError onProgress:(AFNetProgress)onProgress{
    NSDictionary *dicParams = [NSDictionary dictionaryWithObjectsAndKeys:
                               pwd,@"newPwd"
                               ,appKey,@"appKey"
                               ,nil];
    
    BADataEntity *entity = [BADataEntity new];
    entity.urlString = [HgBaseURL stringByAppendingString:@"/member/findPwd"];
    entity.needCache = NO;
    entity.parameters = dicParams;
    [HgAllInterfaces post:entity success:onSuc failure:onError progresss:onProgress];
    hgLog(@"参数-----：%@,路径-----：%@",dicParams,entity.urlString);
    
}

/**
 *  注册
 */
+(void)hg_PostRegisterPhoneNumber:(NSString *)phoneNumber userPwd:(NSString *)userPwd verificationCode:(NSString *)verificationCode  onSuc:(AFNetResponse)onSuc onError:(AFNetError)onError onProgress:(AFNetProgress)onProgress{
    NSDictionary *dicParams = [NSDictionary dictionaryWithObjectsAndKeys:
                               phoneNumber,@"mobile"
                               ,userPwd,@"pwd"
                               , verificationCode,@"smsCode"
                               ,nil];
    
    BADataEntity *entity = [BADataEntity new];
    entity.urlString = [HgBaseURL stringByAppendingString:@"/member/registMember"];
    entity.needCache = NO;
    entity.parameters = dicParams;
    [HgAllInterfaces post:entity success:onSuc failure:onError progresss:onProgress];
    hgLog(@"参数-----：%@,路径-----：%@",dicParams,entity.urlString);
    
}





@end

