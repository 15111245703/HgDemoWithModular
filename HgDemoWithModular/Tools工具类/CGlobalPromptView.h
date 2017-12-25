//
//  CGlobaPromptView.h
//  CRM
//
//  Created by TianWang on 16/5/28.
//  Copyright © 2016年 com.shenlan. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CGlobalPromptView : UIView
//这个类的作用是用来解决当页面无数据的时候，展示一个404的页面，PromptText是指404图片下的文字
@property (nonatomic ,copy)  NSString * PromptText;

@end
