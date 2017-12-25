//
//  HgDrawALittleRedDotTableViewCell.m
//  HgDemoWithModular
//
//  Created by RicardoM Lu on 2017/11/28.
//  Copyright © 2017年 RicardoM Lu. All rights reserved.
//

#import "HgDrawALittleRedDotTableViewCell.h"
#import <UIKit/UIKit.h>
#import "HgBaseCustomObj.h"
#import "HgBesselCurveRedDotView.h"
@implementation HgDrawALittleRedDotTableViewCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    if (self = [super initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:reuseIdentifier]) {
        self.selectionStyle = UITableViewCellSelectionStyleNone;
        HgBesselCurveRedDotView* redDotView =[[HgBesselCurveRedDotView alloc] init];
        redDotView.backgroundColor= [UIColor clearColor];
        redDotView.size = CGSizeMake(6, 6);
        redDotView.centerY = self.contentView.centerY;
        redDotView.x =kMainScreenBoundwidth-30;
        [self.contentView addSubview:redDotView];
    }
    return self;
}
- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
