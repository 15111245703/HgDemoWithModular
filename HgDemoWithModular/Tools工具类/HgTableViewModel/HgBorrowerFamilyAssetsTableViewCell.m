
//
//  HgBorrowerFamilyAssetsTableViewCell.m
//  HgDemo
//
//  Created by RicardoM Lu on 2017/3/3.
//  Copyright © 2017年 RicardoM Lu. All rights reserved.
//

#import "HgBorrowerFamilyAssetsTableViewCell.h"
#import "HgBorrwwerBaseModel.h"
#import "UIView+Extension.h"
#import "HgBaseCustomObj.h"
#import "DCSpeedy.h"
#import "HgBesselCurveRedDotView.h"
@interface HgBorrowerFamilyAssetsTableViewCell()
@property (strong, nonatomic) UILabel *funcNameLabel;
@property (nonatomic,strong) UIImageView *imgView;

@property (nonatomic,strong) UIImageView *indicator;

@property (nonatomic,strong) UISwitch *aswitch;

@property (nonatomic,strong) UILabel *detailLabel;

@property (nonatomic,strong) UILabel *detailLabel2;

@property (nonatomic,strong) UIImageView *detailImageView;
@property (nonatomic,strong) UITextField *detailTextField;


@property (nonatomic,strong) UIView *redDotView; /**< */


@end
@implementation HgBorrowerFamilyAssetsTableViewCell



- (void)setItem:(HgBorrwwerBaseModel *)item
{
    _item = item;
    
    [self updateUI];
    
}

-(void)setupRedDotView{
    HgBesselCurveRedDotView* redDotView =[[HgBesselCurveRedDotView alloc] init];
    redDotView.backgroundColor= [UIColor clearColor];
    redDotView.size = CGSizeMake(6, 6);
    redDotView.centerY = self.contentView.centerY;
    redDotView.x =kMainScreenBoundwidth-30;
    [self.contentView addSubview:redDotView];
    
}
- (void)updateUI
{
    [self.contentView.subviews makeObjectsPerformSelector:@selector(removeFromSuperview)];
    if ([self.item.redDotStr isEqualToString:@"yes"]) {
        [self setupRedDotView];
    }
    //如果有图片
    if (self.item.img) {
        [self setupImgView];
    }
    //功能名称
    if (self.item.funcName) {
        [self setupFuncLabel];
    }
    //accessoryType
    if (self.item.accessoryType) {
        [self setupAccessoryType];
    }
    //输入框
    if (self.item.detailTextField) {
        [self setupDetailTextField];
    }
    
    //detailView
    if (self.item.detailText) {
        [self setupDetailText];
    }
    if (self.item.detailImage) {
        [self setupDetailImage];
    }
    //syy
    if (self.item.detailLabel) {
        [self setupDetailText2];
    }
    //bottomLine
    //    UIView *line = [[UIView alloc]initWithFrame:CGRectMake(0, self.height - 1, kMainScreenBoundwidth, 1)];
    //    line.backgroundColor = HGColorWithRGB(234, 234, 234, 1);
    //    [self.contentView addSubview:line];
    
}

-(void)setupDetailImage
{
    self.detailImageView = [[UIImageView alloc]initWithImage:self.item.detailImage];
    self.detailImageView.centerY = self.contentView.centerY;
    switch (self.item.accessoryType) {
        case HgSettingAccessoryTypeNone:
            self.detailImageView.x = kMainScreenBoundwidth - self.detailImageView.width - HgDetailViewToIndicatorGap - 2;
            break;
        case HgSettingAccessoryTypeDisclosureIndicator:
            self.detailImageView.x = self.indicator.x - self.detailImageView.width - HgDetailViewToIndicatorGap;
            break;
        case HgSettingAccessoryTypeSwitch:
            self.detailImageView.x = self.aswitch.x - self.detailImageView.width - HgDetailViewToIndicatorGap;
            break;
        default:
            break;
    }
    [self.contentView addSubview:self.detailImageView];
}

- (void)setupDetailText
{
    self.detailLabel = [[UILabel alloc]init];
    self.detailLabel.text = self.item.detailText;
    self.detailLabel.textColor = HGColorWithRGB(142, 142, 142, 1);
    self.detailLabel.font = [UIFont systemFontOfSize:HgDetailLabelFont];
//    self.detailLabel.size = [self sizeForTitle:self.item.detailText withFont:self.detailLabel.font];
    self.detailLabel.size = CGSizeMake(kMainScreenBoundwidth/2, 21);
    self.detailLabel.textAlignment = NSTextAlignmentRight;
    self.detailLabel.centerY = self.contentView.centerY;
    
    switch (self.item.accessoryType) {
        case HgSettingAccessoryTypeNone:
            self.detailLabel.x = kMainScreenBoundwidth - self.detailLabel.width - HgDetailViewToIndicatorGap -2-self.item.detailImage.size.width;
            break;
        case HgSettingAccessoryTypeDisclosureIndicator:
            self.detailLabel.x = self.indicator.x - self.detailLabel.width - HgDetailViewToIndicatorGap-self.item.detailImage.size.width;
            break;
        case HgSettingAccessoryTypeSwitch:
            self.detailLabel.x = self.aswitch.x - self.detailLabel.width - HgDetailViewToIndicatorGap-self.item.detailImage.size.width;
            break;
        default:
            break;
    }
    
    [self.contentView addSubview:self.detailLabel];
}

- (void)setupDetailText2
{
    self.detailLabel2 = self.item.detailLabel;
    self.detailLabel2.textColor = HGColorWithRGB(142, 142, 142, 1);
    self.detailLabel2.font = [UIFont systemFontOfSize:HgDetailLabelFont];


    self.detailLabel2.size = CGSizeMake(kMainScreenBoundwidth/2, 50);
//    self.detailLabel2.backgroundColor = [UIColor redColor];
    self.detailLabel2.textAlignment = NSTextAlignmentRight;
    self.detailLabel2.centerY = self.contentView.centerY;
    self.detailLabel2.numberOfLines = 2;

 

    switch (self.item.accessoryType) {
        case HgSettingAccessoryTypeNone:
        {
            self.detailLabel2.x = kMainScreenBoundwidth - self.detailLabel2.width - HgDetailViewToIndicatorGap -2-self.item.detailImage.size.width-10.0;
            

 
        }
            break;
        case HgSettingAccessoryTypeDisclosureIndicator:
        {
            self.detailLabel2.x = kMainScreenBoundwidth - self.detailLabel2.width - HgDetailViewToIndicatorGap -2-self.item.detailImage.size.width;
            
            
            
        }
            break;
        case HgSettingAccessoryTypeSwitch:
        {
            self.detailLabel2.x = kMainScreenBoundwidth - self.detailLabel2.width - HgDetailViewToIndicatorGap -2-self.item.detailImage.size.width;
            
         
            
        }
            break;
        default:
            break;
    }
    
    [self.contentView addSubview:self.detailLabel2];
}

-(void)setupDetailTextField{
    self.detailTextField =self.item.detailTextField;
    [self.detailTextField addTarget:self action:@selector(TextFiledControlEventEditingChanged:) forControlEvents:(UIControlEventEditingChanged)];
    self.detailTextField.text = self.item.detailTextField.text;
    self.detailTextField.tag = self.item.detailTextField.tag;
    
    self.detailTextField.placeholder = self.item.detailTextField.placeholder;
    
    self.detailTextField.font = [UIFont systemFontOfSize:HgDetailLabelFont];
    //设置文本对齐方式
    self.detailTextField.textAlignment = NSTextAlignmentRight;
    
    self.detailTextField.size =CGSizeMake(kMainScreenBoundwidth/2, 25);
    //    self.detailTextField.size = [self sizeForTitle:self.item.detailTextField withFont:self.detailTextField.font];
    self.detailTextField.centerY = self.contentView.centerY;
    
    switch (self.item.accessoryType) {
        case HgSettingAccessoryTypeNone:
            self.detailTextField.x = kMainScreenBoundwidth - self.detailTextField.width-15-[self calculateRowWidth:self.item.detailText];
            break;
        case HgSettingAccessoryTypeDisclosureIndicator:
                self.detailTextField.x = kMainScreenBoundwidth - self.detailTextField.width-15-[self calculateRowWidth:self.item.detailText];
            break;
        case HgSettingAccessoryTypeSwitch:
            self.detailTextField.x = kMainScreenBoundwidth - self.detailTextField.width-15-[self calculateRowWidth:self.item.detailText];;
            break;
        default:
            break;
    }
    
    [self.contentView addSubview:self.detailTextField];
    
}
//计算宽度
- (CGFloat)calculateRowWidth:(NSString *)string {
    NSDictionary *dic = @{NSFontAttributeName:[UIFont systemFontOfSize:HgDetailLabelFont]};  //指定字号
    CGRect rect = [string boundingRectWithSize:CGSizeMake(0, 21)/*计算宽度时要确定高度*/ options:NSStringDrawingUsesLineFragmentOrigin |
                   NSStringDrawingUsesFontLeading attributes:dic context:nil];
    return rect.size.width+5;
}

#pragma mark - 按钮点击事件，通过代理模式响应
-(void)TextFiledControlEventEditingChanged:(UITextField *)textField
{
    [self.delegate TextFiledControlEventEditingChanged:textField];
}
- (void)setupAccessoryType
{
    switch (self.item.accessoryType) {
        case HgSettingAccessoryTypeNone:
            break;
        case HgSettingAccessoryTypeDisclosureIndicator:
            [self setupIndicator];
            break;
        case HgSettingAccessoryTypeSwitch:
            [self setupSwitch];
            break;
        default:
            break;
    }
}

- (void)setupSwitch
{
    [self.contentView addSubview:self.aswitch];
}

- (void)setupIndicator
{
    if (self.item.detailTextField) {
    }else{
        [self.contentView addSubview:self.indicator];
        
    }
    
    
}

- (void)setupImgView
{
    self.imgView = [[UIImageView alloc]initWithImage:self.item.img];
    self.imgView.x = HgFuncImgToLeftGap;
    self.imgView.centerY = self.contentView.centerY;
//    self.imgView.centerY = self.contentView.centerY;
    [self.contentView addSubview:self.imgView];
}

- (void)setupFuncLabel
{
    self.funcNameLabel = [[UILabel alloc]init];
    self.funcNameLabel.text = self.item.funcName;
    self.funcNameLabel.textColor = HGColorWithRGB(51, 51, 51, 1);
    self.funcNameLabel.font = [UIFont systemFontOfSize:HgFuncLabelFont];
    self.funcNameLabel.size = [self sizeForTitle:self.item.funcName withFont:self.funcNameLabel.font];
    self.funcNameLabel.centerY = self.contentView.centerY;
    self.funcNameLabel.x = CGRectGetMaxX(self.imgView.frame) + HgFuncLabelToFuncImgGap;
    [self.contentView addSubview:self.funcNameLabel];
}

- (CGSize)sizeForTitle:(NSString *)title withFont:(UIFont *)font
{
    CGRect titleRect = [title boundingRectWithSize:CGSizeMake(FLT_MAX, FLT_MAX)
                                           options:NSStringDrawingUsesLineFragmentOrigin
                                        attributes:@{NSFontAttributeName : font}
                                           context:nil];
    
    return CGSizeMake(titleRect.size.width,
                      titleRect.size.height);
}

- (UIImageView *)indicator
{
    if (!_indicator) {
        _indicator = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"icon-arrow1"]];
        _indicator.centerY = self.contentView.centerY;
        _indicator.x = kMainScreenBoundwidth - _indicator.width - HgIndicatorToRightGap;
    }
    return _indicator;
}

- (UISwitch *)aswitch
{
    if (!_aswitch) {
        _aswitch = [[UISwitch alloc]init];
        _aswitch.centerY = self.contentView.centerY;
        _aswitch.x = kMainScreenBoundwidth - _aswitch.width - HgIndicatorToRightGap;
        [_aswitch addTarget:self action:@selector(switchTouched:) forControlEvents:UIControlEventValueChanged];
    }
    return _aswitch;
}

- (void)switchTouched:(UISwitch *)sw
{
    __weak typeof(self) weakSelf = self;
    self.item.switchValueChanged(weakSelf.aswitch.isOn);
}


@end

