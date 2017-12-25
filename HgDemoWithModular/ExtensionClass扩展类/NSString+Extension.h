//
//  NSString+Extension.h
//  AI_QIA_MGR
//
//  Created by TianWang on 16/1/7.
//  Copyright © 2016年 TianWang. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
@interface NSString (Extension)

/**
 *  日期转年
 */
+ (NSString *)YstringWithDate:(NSDate *)date;


/**
 *  日期转年月日字符串
 */
+(NSString *) YMDstringWithDate:(NSDate *)date;

/**
*  日期转年月日时分字符串
*/
+ (NSString *)YMDHMstringWithDate:(NSDate *)date;

/**
 *  日期转年月日时分秒字符串
 */
+ (NSString *)YMDHMSstringWithDate:(NSDate *)date;

/**
 *  日期转（xxxx-xx）字符串
 */
+(NSString *) YMstringWithDate:(NSDate *)date;

/**
 *  日期转（某日）字符串
 */
+(NSString *) DaystringWithDate:(NSDate *)date;

/**
 *  日期转（小时：分）字符串
 */
+(NSString *) HMstringWithDate:(NSDate *)date;

/**
 *  日期转（小时：分:秒）字符串
 */
+(NSString *) HMSstringWithDate:(NSDate *)date;

/**
 *  日期转（几月几日）字符串
 */
+(NSString *)MDChineseStringWithDate:(NSDate *)date;

- (CGSize)sizeWithFont:(UIFont *)font maxW:(CGFloat)maxW;
- (CGSize)sizeWithFont:(UIFont *)font;




/**
 *  日期转（星期X）字符串
 */
+ (NSString*)WeekdayStringFromDate:(NSDate*)inputDate;


+(NSString*)ChangeNumberFormat:(NSString*)string;


/**
 *  清除数字字符串的多余小数位
 */
+ (NSString *)ClearAmountZeroWithAmountStr:(NSString *)Amount;

/**
 *  元转万
 */
+ (NSString *)YuanAmountToThousandYuan:(NSString *)YuanAmount;


+ (BOOL)validateEmail:(NSString *)email;

+ (BOOL)validatePhone:(NSString *)phone;

@end
