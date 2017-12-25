//
//  UserModel.h
//  HGBasicFramework
//
//  Created by RicardoM Lu on 2017/8/18.
//  Copyright © 2017年 RicardoM Lu. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "WHC_ModelSqlite.h"
#import "NSObject+WHC_Model.h"
@interface HgTmCustomer : NSObject
@property (strong, nonatomic) NSString *hgMobile;
@property (strong, nonatomic) NSString *hgUpdateDate;
@property (strong, nonatomic) NSString *hgId;
@property (strong, nonatomic) NSString *hgCreateDate;
@property (strong, nonatomic) NSString *hgMemberId;
@property (strong, nonatomic) NSString *hgCertifiedFlag;
@property (strong, nonatomic) NSString *hgIsNewRecord;
@property (strong, nonatomic) NSString *hgSex;
@property (strong, nonatomic) NSString *hgResidence;
@property (strong, nonatomic) NSString *hgMaritalStatus;
@property (strong, nonatomic) NSString *hgBirthday;
@property (strong, nonatomic) NSString *hgIdCardType;
@property (strong, nonatomic) NSString *hgAddress;
@property (strong, nonatomic) NSString *hgIdPhoto;
@property (strong, nonatomic) NSString *hgIdPhotoName;
@property (strong, nonatomic) NSString *hgIdCardNo;


+ (NSString *)whc_SqliteVersion;

@end

@interface UserModel : NSObject<WHC_SqliteInfo>
//登录获取的数据
@property (strong, nonatomic) NSString *hgMobile;
@property (strong, nonatomic) NSString *hgLoginFlag;
@property (strong, nonatomic) NSString *hgUserName;
@property (strong, nonatomic) NSString *hgId;
@property (strong, nonatomic) NSString *hgTid;
@property (strong, nonatomic) NSString *hgAppKey;
@property (strong, nonatomic) NSString *hgRegistTime;
@property (strong, nonatomic) NSString *hgPwd;
@property (strong, nonatomic) NSString *hgIsNewRecord;
@property (strong, nonatomic) HgTmCustomer *hgTmCustomer;
+ (NSString *)whc_SqliteVersion;


@end



