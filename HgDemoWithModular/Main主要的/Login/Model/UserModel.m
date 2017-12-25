//
//  UserModel.m
//  HGBasicFramework
//
//  Created by RicardoM Lu on 2017/8/18.
//  Copyright © 2017年 RicardoM Lu. All rights reserved.
//

#import "UserModel.h"

@implementation UserModel

+ (NSDictionary *)modelCustomPropertyMapper {
    return @{
               @"hgMobile" : @"mobile"
              ,@"hgLoginFlag" : @"loginFlag"
              ,@"hgUserName" : @"userName"
              ,@"hgId" : @"id"
              ,@"hgTid" : @"tid"
              ,@"hgAppKey" : @"appKey"
              ,@"hgRegistTime" : @"registTime"
              ,@"hgPwd" : @"pwd"
              ,@"hgIsNewRecord" : @"isNewRecord"
              ,@"hgTmCustomer" : @"tmCustomer"

             };
}
+ (NSString *)whc_SqliteVersion {
    return @"1.0";
}

+ (NSString *)whc_OtherSqlitePath {
    return [NSString stringWithFormat:@"%@/Library/UserTableModel.db",NSHomeDirectory()];
}

@end
@implementation HgTmCustomer
+ (NSDictionary *)modelCustomPropertyMapper {
    return @{
               @"hgMobile" : @"mobile"
              ,@"hgUpdateDate" : @"updateDate"
              ,@"hgId" : @"id"
              ,@"hgCreateDate" : @"createDate"
              ,@"hgMemberId" : @"memberId"
              ,@"hgCertifiedFlag" : @"certifiedFlag"
              ,@"hgIsNewRecord" : @"isNewRecord"
              ,@"hgSex":@"sex"
              ,@"hgResidence":@"residence"
              ,@"hgMaritalStatus":@"maritalStatus"
              ,@"hgBirthday":@"birthday"
              ,@"hgIdCardType":@"idCardType"
              ,@"hgAddress":@"address"
              ,@"hgIdPhoto":@"idPhoto"
              ,@"hgIdPhotoName":@"idPhotoName"
              ,@"hgName":@"name"
              ,@"hgIdCardNo":@"idCardNo"

             };
}
+ (NSString *)whc_SqliteVersion {
    return @"1.0";
}

@end
/*
{
    mobile = 15200423510;
    loginFlag = 1;
    userName = 15200423510;
    id = 3e425f45f1634f53a610c880169b4f1e;
    tid = 3e425f45f1634f53a610c880169b4f1e;
    appKey = b33ec776820f4aa8bbb0253ab70729a2;
    tmCustomer = {
        id = 8cf53f4ba6974860af5d977ca72927ad;
        certifiedFlag = 1;
        sex = 1;
        mobile = 15200423510;
        createDate = 2017-03-02 10:03:20;
        residence = 湖南省/株洲市/天元区;
        maritalStatus = 0;
        isNewRecord = 0;
        memberId = 3e425f45f1634f53a610c880169b4f1e;
        updateDate = 2017-03-02 10:04:40;
        birthday = 1982-02-04;
        idCardType = 1;
        address = rrrr;
        idPhoto = /pf_bpm/upload/images/20170302/20170302100438_202.png;
        idPhotoName = image.png;
        name = 张阳;
        idCardNo = 430204198202042018;
    }
    ;
    registTime = 2017-03-02 10:03:20;
    pwd = e10adc3949ba59abbe56e057f20f883e;
    isNewRecord = 0;
}
*/
