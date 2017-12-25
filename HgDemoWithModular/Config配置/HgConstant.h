//
//  HgConstant.h
//  HgDemo
//
//  Created by RicardoM Lu on 2017/3/1.
//  Copyright © 2017年 RicardoM Lu. All rights reserved.
//

#ifndef HgConstant_h
#define HgConstant_h
//定义返回请求数据的block类型
typedef void (^ReturnValueBlock) (id returnValue);
typedef void (^ErrorCodeBlock) (id errorCode);
typedef void (^FailureBlock)(void);
typedef void (^NetWorkBlock)(BOOL netConnetState);


//这些参数是用于网络请求的
#define SOURCE @"source"
#define TOKEN @"access_token"
#define COUNT @"count"
#define ACCESSTOKEN @"2.00NofgBD0L1k4pc584f79cc48SKGdD"

#define STATUSES @"statuses"
#define CREATETIME @"created_at"
#define WEIBOID @"id"
#define WEIBOTEXT @"text"
#define USER @"user"
#define UID @"id"
#define HEADIMAGEURL @"profile_image_url"
#define USERNAME @"screen_name"
//------------常量
#define kMainScreenBoundheight [UIScreen mainScreen].bounds.size.height

#define kMainScreenBoundwidth [UIScreen mainScreen].bounds.size.width

#define kSCREEN_WIDTH          ([UIScreen mainScreen].bounds.size.width)
#define kSCREEN_HEIGHT         ([UIScreen mainScreen].bounds.size.height)

//获取屏幕尺寸
#define kMainScreenBounds  [UIScreen mainScreen].bounds

#define DEFAULTS [NSUserDefaults standardUserDefaults]

#define ShareApplicationDelegate [[UIApplication sharedApplication] delegate]


/** 控制台 */
#ifdef DEBUG
#define hgLog( s, ... ) NSLog(@"\n堆栈: [HexAdress: %p] [%@]->[%@]:(第%d行)\n提示: %@\n", self, [[NSString stringWithUTF8String:__FILE__] lastPathComponent], NSStringFromSelector(_cmd), __LINE__, [NSString stringWithFormat:(s), ##__VA_ARGS__])
#else
#define hgLog( s, ... )
#endif


/** 纯内容 */
#ifdef DEBUG
#define hgPrint( s, ... ) NSLog(@"\n[%@ -> %@:(第%d行)] \n%@\n",[[NSString stringWithUTF8String:__FILE__] lastPathComponent], NSStringFromSelector(_cmd), __LINE__, [NSString stringWithFormat:(s), ##__VA_ARGS__])
#else
#define hgPrint( s, ... )
#endif

/** 直接打印对象 */
#ifdef DEBUG
#define hgPrintObj( obj ) NSLog(@"%@", obj)
#else
#define hgPrintObj( obj )
#endif

#define WS(weakSelf)  __weak __typeof(&*self)weakSelf = self;

#define HGColorWithRGB(_R,_G,_B,_A) \
[UIColor colorWithRed:((_R) / 255.0) green:((_G) / 255.0) blue:((_B) / 255.0) alpha:_A]


//////////////////////////////////////////////////////////////////////////////////////////////
#define kMakeColorWithRGB(R,G,B,A) [UIColor colorWithRed:R/255.0 green:G/255.0 blue:B/255.0 alpha:A]

#define kmainBlueColor [UIColor colorWithRed:0.23 green:0.71 blue:0.96 alpha:1.00]

#define CreateUIColor(_R,_G,_B,_A) \
[UIColor colorWithRed:((_R) / 255.0) green:((_G) / 255.0) blue:((_B) / 255.0) alpha:_A]
//全局cell节的背景色
#define CellBG_Color  CreateUIColor(239,239,244,1.0)

#define hg_BG_Color     CreateUIColor(231, 230, 235, 1.0)

//导航条颜色
//#define NavBG_Color CreateUIColor (22, 154, 193, 1.0)
//#define NavBG_Color CreateUIColor (65, 190, 232, 1.0)
#define NavBG_Color CreateUIColor (41, 57, 80, 1.0)
//分割线颜色
#define GlobalLine_Color CreateUIColor(247,246,248,1.0)

//通用Cell文字颜色
#define GlobalCell_Text_Color CreateUIColor(53, 64, 86, 1.0)

//通用Header文字颜色
#define GlobalHeader_Text_Color CreateUIColor(216, 218, 226, 1.0)

//通用Header背景颜色
#define GlobalHeader_BG_Color CreateUIColor(43,64,85,1.0)

//////////////////////////////////////////////////////////////////////////////////////////////
//功能图片到左边界的距离
#define HgFuncImgToLeftGap 15.0

//功能名称字体
#define HgFuncLabelFont 14.0

//功能名称到功能图片的距离,当功能图片funcImg不存在时,等于到左边界的距离
#define HgFuncLabelToFuncImgGap 15.0

//指示箭头或开关到右边界的距离
#define HgIndicatorToRightGap 15.0

//详情文字字体
#define HgDetailLabelFont 12.0

//详情到指示箭头或开关的距离
#define HgDetailViewToIndicatorGap 13.0

#define HgHeightForHeaderInSection  40.0
/**
 * 随机数据
 */
#define MJRandomData [NSString stringWithFormat:@"随机数据-%d", arc4random_uniform(1000000)]
#define WS(weakSelf)  __weak __typeof(&*self)weakSelf = self;
//------------常用提示
/*
 *判断系统版本号
 */
#define kVersionNumber [UIDevice currentDevice].systemVersion.floatValue
/*
 *判断设备是不是苹果X
 */
#define kSCREEN_WIDTH     ([UIScreen mainScreen].bounds.size.width)
#define kSCREEN_HEIGHT    ([UIScreen mainScreen].bounds.size.height)
#define IS_IPHONE_X     (kSCREEN_WIDTH == 375.f && kSCREEN_HEIGHT == 812.f)
#define IPHONE_NAVIGATIONBAR_HEIGHT  (IS_IPHONE_X ? 88 : 64)
#define IPHONE_STATUSBAR_HEIGHT      (IS_IPHONE_X ? 44 : 20)
#define IPHONE_SAFEBOTTOMAREA_HEIGHT (IS_IPHONE_X ? 34 : 0)
#define IPHONE_TOPSENSOR_HEIGHT      (IS_IPHONE_X ? 32 : 0)
#define IPHONE_TABBARHEIGHT  (IS_IPHONE_X ? 84 : 49)


//if (IS_IPHONE_X) {
//    hgLog(@"yes");
//}else{
//    hgLog(@"NO");
//}


#define kSVProgressHUSDismissTime 1.5

#define kConnectToTheServerFailed @"连接服务器失败，请尝试重试访问!"
#define kConnectToTheServer @"连接服务器成功！"
#define kNoConnectionNetwork @"没有连接网络！"

#define hgInfokey_nikeNameWithDontEmpty @"昵称不能为空！"
#define hgInfokey_CannotContainSpaces @"不能含有空格！"
#define hgInfokey_MobileNumberWithDontEmpty @"手机号码不能为空！"
#define hgInfokey_PasswordWithDontEmpty @"密码不能为空！"
#define hgInfokey_PasswordWithFormat @"请输入6-16位的密码！"
#define hgInfokey_VerificationCodeError @"验证码错误！"

/**国内天气预报融合版－－－－－apikey*/

#define apikey  @"82428a4618b6aa313be6914d727cb9b7"


#define hgSilentLoginCondition @"HgMain"

#define kuserHgMobile @"userHgMobile"
#define kuserHgPassword @"userHgPassword"
#define kuserHgAppKey @"userHgAppKey"
#define kuserHgUpdateDate @"userHgUpdateDate"
#define kuserHgId @"userHgId"
#define kuserHgCreateDate @"userHgCreateDate"
#define kuserHgMemberId @"userHgMemberId"
#define kuserHgCertifiedFlag @"userHgCertifiedFlag"
#define kuserHgIsNewRecord @"userHgIsNewRecord"
#define kuserHgMobile @"userHgMobile"

#endif /* HgConstant_h */
