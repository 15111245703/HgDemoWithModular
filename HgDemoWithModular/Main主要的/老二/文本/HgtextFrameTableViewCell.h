//
//  HgtextFrameTableViewCell.h
//  HgDemoWithModular
//
//  Created by RicardoM Lu on 2017/11/27.
//  Copyright © 2017年 RicardoM Lu. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "HgTextFrameModel.h"
@interface HgtextFrameTableViewCell : UITableViewCell
- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier;

@property(strong,nonatomic)HgTextFrameModel * myModel;

@end
@interface HgCCustomerContentVeiw : UIView

@property (nonatomic, copy)UILabel     * m_TitleLab;
@property (nonatomic, copy)UILabel     * m_InfoLab;
- (instancetype)initWithTitle:(NSString*)title titleFont:(NSString *)titleFont ParentV:(UIView *)parentV;


@property (nonatomic, copy) NSString * contentInfoStr;

@end
