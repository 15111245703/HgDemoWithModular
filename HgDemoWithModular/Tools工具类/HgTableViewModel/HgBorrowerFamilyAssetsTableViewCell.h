//
//  HgBorrowerFamilyAssetsTableViewCell.h
//  PersonalFinanceRoom
//
//  Created by RicardoM Lu on 2017/6/12.
//  Copyright © 2017年 火炬信息. All rights reserved.
//

#import <UIKit/UIKit.h>

@class HgBorrwwerBaseModel;


@protocol MycellDelegate <NSObject>

@optional
-(void)TextFiledControlEventEditingChanged:(UITextField *)mytextField;

@end


@interface HgBorrowerFamilyAssetsTableViewCell : UITableViewCell



@property(nonatomic,weak) id<MycellDelegate> delegate;



@property (nonatomic,strong) HgBorrwwerBaseModel  *item; /**< item data*/



@end
