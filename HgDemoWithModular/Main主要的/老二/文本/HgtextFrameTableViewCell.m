//
//  HgtextFrameTableViewCell.m
//  HgDemoWithModular
//
//  Created by RicardoM Lu on 2017/11/27.
//  Copyright © 2017年 RicardoM Lu. All rights reserved.
//

#import "HgtextFrameTableViewCell.h"
@interface HgtextFrameTableViewCell ()
{
    HgCCustomerContentVeiw  * m_font24;
    HgCCustomerContentVeiw  * m_font18;
    HgCCustomerContentVeiw  * m_font16;
    HgCCustomerContentVeiw *  m_font14;
    HgCCustomerContentVeiw *  m_font12;

    UIView * m_BgView;
}
@end
@implementation HgtextFrameTableViewCell
- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        [self createUI];

    }
    return self;
}
- (void)createUI
{
    m_BgView = [[UIView alloc] init];
    m_BgView.backgroundColor =[UIColor whiteColor];
    [self addSubview:m_BgView];

    m_font24 =[[HgCCustomerContentVeiw alloc] initWithTitle:@"标题一Font24" titleFont:@"24" ParentV:self];
    m_font18 =[[HgCCustomerContentVeiw alloc] initWithTitle:@"标题二Font18" titleFont:@"18" ParentV:self];
    m_font16 =[[HgCCustomerContentVeiw alloc] initWithTitle:@"标题三Font16" titleFont:@"16" ParentV:self];
    m_font14 =[[HgCCustomerContentVeiw alloc] initWithTitle:@"常用默认文字大小Font14" titleFont:@"14" ParentV:self];
    m_font12 =[[HgCCustomerContentVeiw alloc] initWithTitle:@"常用subTitle文字大小Font12" titleFont:@"12" ParentV:self];

    [self masonryUI];

}
- (void)setMyModel:(HgTextFrameModel *)myModel
{
    _myModel =myModel;

}
- (void)masonryUI
{
    CGFloat spacing = 10;
    
    [m_BgView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(self).insets(UIEdgeInsetsMake(0, spacing, 0, spacing));
    }];
    
    [m_font24 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(m_BgView.mas_left).with.offset(spacing);
        make.top.equalTo(m_BgView.mas_top).with.offset(2 * spacing);
        make.right.equalTo(m_BgView.mas_right).with.offset(0);
    }];
    [m_font24 sizeToFit];
    
    [m_font18 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(m_BgView.mas_left).with.offset(spacing);
        make.top.equalTo(m_font24.mas_bottom).with.offset(2 * spacing);
        make.right.equalTo(m_BgView.mas_right).with.offset(0);
    }];
    [m_font18 sizeToFit];
    
    [m_font16 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(m_BgView.mas_left).with.offset(spacing);
        make.top.equalTo(m_font18.mas_bottom).with.offset(2 * spacing);
        make.right.equalTo(m_BgView.mas_right).with.offset(0);
    }];
    [m_font16 sizeToFit];

    [m_font14 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(m_BgView.mas_left).with.offset(spacing);
        make.top.equalTo(m_font16.mas_bottom).with.offset(2 * spacing);
        make.right.equalTo(m_BgView.mas_right).with.offset(0);
    }];
    [m_font14 sizeToFit];
    
    [m_font12 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(m_BgView.mas_left).with.offset(spacing);
        make.top.equalTo(m_font14.mas_bottom).with.offset(2 * spacing);
        make.right.equalTo(m_BgView.mas_right).with.offset(0);
    }];
    [m_font12 sizeToFit];

    
}

@end

@interface HgCCustomerContentVeiw ()
{
    
}

@end


@implementation HgCCustomerContentVeiw
@synthesize m_TitleLab,m_InfoLab;
- (instancetype)initWithTitle:(NSString*)title titleFont:(NSString *)titleFont ParentV:(UIView *)parentV
{
    if (self = [super init]) {
        m_TitleLab = createLab(self, CreateUIColor(181, 181, 181, 1.0), [titleFont floatValue], NSTextAlignmentLeft) ;
        m_TitleLab.numberOfLines = 2;
//        m_InfoLab = createLab(self, CreateUIColor(122, 122, 122, 1.0), [titleFont floatValue], NSTextAlignmentLeft) ;
//        m_InfoLab.lineBreakMode = NSLineBreakByTruncatingTail;
//        m_InfoLab.numberOfLines = 2;
        

        [self createUI];
        
        [parentV addSubview:self];
        m_TitleLab.text = title;
    }
    return self;
}

- (void)createUI
{
    [m_TitleLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self);
        make.top.bottom.equalTo(self);
        make.width.mas_equalTo(self).with.offset(-2*10);
    }];
    
//    [m_InfoLab mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.left.equalTo(m_TitleLab.mas_right).with.offset(20);
//        make.centerY.equalTo(self);
//        make.right.equalTo(self).with.offset(0);
//
//    }];
}
- (void)setContentInfoStr:(NSString *)contentInfoStr
{
    _contentInfoStr = contentInfoStr;
    
    m_InfoLab.text = contentInfoStr;
}

@end

