//
//  HgBorrwwerBaseModel.h
//  PersonalFinanceRoom
//
//  Created by RicardoM Lu on 2017/6/12.
//  Copyright © 2017年 火炬信息. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface HgBorrwwerBaseModel : NSObject
typedef NS_ENUM(NSInteger, HgSettingAccessoryType) {
    HgSettingAccessoryTypeNone,                   // 不显示任何附属视图
    HgSettingAccessoryTypeDisclosureIndicator,    //与系统DisclosureIndicator相同
    HgSettingAccessoryTypeSwitch,                 //  swithch
};

@property (nonatomic,copy) NSString  *funcName;     /**<      功能名称*/
@property (nonatomic,strong) UIImage *img;          /**< 功能图片  */
@property (nonatomic,copy) NSString *detailText;    /**< 更多信息-提示文字  */

@property (nonatomic,strong) UIImage *detailImage;  /**< 更多信息-提示图片  */
@property (nonatomic,strong) UITextField *detailTextField; /**< 输入框*/
@property (nonatomic,strong) UILabel *detailLabel; /**< 文本框*/
@property (nonatomic,strong) NSString *redDotStr; /**< */

@property (nonatomic,assign) HgSettingAccessoryType  accessoryType;    /**< accessory */
@property (nonatomic,copy) void (^executeCode)(); /**<      点击item要执行的代码*/
@property (nonatomic,copy) void (^switchValueChanged)(BOOL isOn); /**<  XBSettingAccessoryTypeSwitch下开关变化 */

@end
