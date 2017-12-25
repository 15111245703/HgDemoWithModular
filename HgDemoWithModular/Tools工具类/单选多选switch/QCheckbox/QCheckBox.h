//
//  EICheckBox.h
//  EInsure
//
//  Created by ivan on 13-7-9.
//  Copyright (c) 2013年 ivan. All rights reserved.
//

#import <UIKit/UIKit.h>
@protocol QCheckBoxDelegate;

@interface QCheckBox : UIButton {
    id<QCheckBoxDelegate> _delegate;
    BOOL _checked;
    id _userInfo;
    NSString                        *_groupId;//分组==》在表里这个功能就有用了：）
    int count;   //1个组最多数量
}

@property(nonatomic, assign)id<QCheckBoxDelegate> delegate;
@property(nonatomic, assign)BOOL checked;
@property(nonatomic, retain)id userInfo;
@property(nonatomic, copy, readonly)NSString            *groupId;

- (id)initWithDelegate:(id)delegate groupId:(NSString*)groupId count:(int)mcount;
- (void)initWithgroupId:(NSString*)groupId count:(int)mcount;
-(void)initDelegate:(id)delegate ;
@end

@protocol QCheckBoxDelegate <NSObject>

@optional

- (void)didSelectedCheckBox:(QCheckBox *)checkbox checked:(BOOL)checked groupId:(NSString *)groupId;

- (void)alerViewCount:(int)count;
@end
