//
//  HgAllParametersAndURL.h
//  HGBasicFramework
//
//  Created by RicardoM Lu on 2017/8/18.
//  Copyright © 2017年 RicardoM Lu. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "HgAllInterfaces.h"

typedef void(^AFNetResponse)(id json);
typedef void(^AFNetError)(NSError * error);
typedef void(^AFNetProgress)(float progress);


@interface HgAllParametersAndURL : NSObject
/**
 *  登陆
 */
+(void) hg_PostUserLogin:(NSString *)userPhone pswd:(NSString *)userPswd onSuc:(AFNetResponse)onSuc onError:(AFNetError)onError onProgress:(AFNetProgress)onProgress;

/**
 *  注册发送短信验证码
 */
+(void) hg_PostVerficationCode:(NSString*)phoneNumber onSuc:(AFNetResponse)onSuc onError:(AFNetError)onError onProgress:(AFNetProgress)onProgress;
/**
 *  修改密码发送短信验证码
 */
+(void)hg_PostChangePasswordVerficationCode:(NSString*)phoneNumber onSuc:(AFNetResponse)onSuc onError:(AFNetError)onError onProgress:(AFNetProgress)onProgress;
/**
 *  修改密码->验证短信验证接口
 */
+(void)hg_PostVerifyTheVerficationCode:(NSString*)phoneNumber smsCode:(NSString *)smsCode onSuc:(AFNetResponse)onSuc onError:(AFNetError)onError onProgress:(AFNetProgress)onProgress;

/**
 *  修改密码->验证短信验证接口->修改密码
 */
+(void)hg_PostModification:(NSString*)pwd appKey:(NSString *)appKey onSuc:(AFNetResponse)onSuc onError:(AFNetError)onError onProgress:(AFNetProgress)onProgress;



/**
 * 注册
 */
+(void)hg_PostRegisterPhoneNumber:(NSString *)phoneNumber userPwd:(NSString *)userPwd verificationCode:(NSString *)verificationCode  onSuc:(AFNetResponse)onSuc onError:(AFNetError)onError onProgress:(AFNetProgress)onProgress;


@end

