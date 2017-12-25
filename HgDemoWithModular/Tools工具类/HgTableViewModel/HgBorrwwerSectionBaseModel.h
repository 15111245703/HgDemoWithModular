//
//  HgBorrwwerSectionBaseModel.h
//  PersonalFinanceRoom
//
//  Created by RicardoM Lu on 2017/6/12.
//  Copyright © 2017年 火炬信息. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface HgBorrwwerSectionBaseModel : NSObject
@property (nonatomic,copy) NSString  *sectionHeaderName; /**< 传空表示分组无名称*/

@property (nonatomic,assign) CGFloat  sectionHeaderHeight; /**<      分组header高度*/

@property (nonatomic,strong) NSArray  *itemArray; /**< item模型数组*/

@property (nonatomic,strong) UIColor  *sectionHeaderBgColor; /**< 背景色*/

@end
