//
//  RCDTextFieldValidate.m
//  RongCloud
//
//  Created by Liv on 14/11/7.
//  Copyright (c) 2014年 RongCloud. All rights reserved.
//
#import "RCDTextFieldValidate.h"
#import <UIKit/UIKit.h>

@implementation RCDTextFieldValidate

//验证手机号码
+ (BOOL)validateMobile:(NSString *)mobile {
  if (mobile.length == 0) {
    [SVProgressHUD showInfoWithStatus:hgInfokey_MobileNumberWithDontEmpty];
    [SVProgressHUD dismissWithDelay:kSVProgressHUSDismissTime];

    return NO;
  }
//  //手机号以13， 15，18开头，八个 \d 数字字符
//  NSString *phoneRegex = @"^((13[0-9])|(15[^4,\\D])|(18[0,0-9]))\\d{8}$";
//  NSPredicate *phoneTest =
//      [NSPredicate predicateWithFormat:@"SELF MATCHES %@", phoneRegex];
//  if (![phoneTest evaluateWithObject:mobile]) {
//    NSString *message = @"手机号码格式不正确！";
//      [SVProgressHUD showInfoWithStatus:message];
//       [SVProgressHUD dismissWithDelay:kSVProgressHUSDismissTime];
//    return NO;
//  }
  return YES;
}

//验证电子邮箱
+ (BOOL)validateEmail:(NSString *)email {
  if (email.length == 0) {
    [SVProgressHUD showInfoWithStatus:hgInfokey_CannotContainSpaces];
     [SVProgressHUD dismissWithDelay:kSVProgressHUSDismissTime];
    return NO;
  }

  NSString *expression = [NSString
      stringWithFormat:@"^\\w+([-+.]\\w+)*@\\w+([-.]\\w+)*\\.\\w+([-.]\\w+)*$"];
  NSError *error = NULL;
  NSRegularExpression *regex = [[NSRegularExpression alloc]
      initWithPattern:expression
              options:NSRegularExpressionCaseInsensitive
                error:&error];
  NSTextCheckingResult *match =
      [regex firstMatchInString:email
                        options:0
                          range:NSMakeRange(0, [email length])];
  if (!match) {
      NSString *message = @"邮箱格式错误！";
      [SVProgressHUD showInfoWithStatus:message];
       [SVProgressHUD dismissWithDelay:kSVProgressHUSDismissTime];
    return NO;
  }
  return YES;
}

//验证密码
+ (BOOL)validatePassword:(NSString *)password {
  if (password.length == 0) {
    [SVProgressHUD showInfoWithStatus:hgInfokey_PasswordWithDontEmpty];
     [SVProgressHUD dismissWithDelay:kSVProgressHUSDismissTime];
    return NO;
  }
    
    if (password.length < 6 || password.length>16) {
    [SVProgressHUD showInfoWithStatus:hgInfokey_PasswordWithFormat];
     [SVProgressHUD dismissWithDelay:kSVProgressHUSDismissTime];
    return NO;
  }
  NSRange _range = [password rangeOfString:@" "];
  if (_range.location != NSNotFound) {
     [SVProgressHUD showInfoWithStatus:hgInfokey_CannotContainSpaces];
     [SVProgressHUD dismissWithDelay:kSVProgressHUSDismissTime];
      
    return NO;
  }
  return YES;
}
@end
