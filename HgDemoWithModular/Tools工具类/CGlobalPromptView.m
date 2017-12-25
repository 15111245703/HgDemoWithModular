//
//  CGlobaPromptView.m
//  CRM
//
//  Created by TianWang on 16/5/28.
//  Copyright © 2016年 com.shenlan. All rights reserved.
//

#import "CGlobalPromptView.h"
@interface CGlobalPromptView ()
{
    UIImageView   *  m_PromptImgView;
    UILabel       *  m_PromptLab;
}

@end

@implementation CGlobalPromptView


- (instancetype)init
{
    if (self = [super init])
    {
        
        self.userInteractionEnabled = NO;
        
        [self createUI];
        
        
    }
    return self;
}

- (void)setPromptText:(NSString *)PromptText
{
    _PromptText =PromptText;
    m_PromptLab.text = PromptText;
}

- (void)createUI
{
//    globa_prompt_img
    self.backgroundColor = CellBG_Color;
    m_PromptImgView = [[UIImageView alloc ] initWithImage:[UIImage imageNamed:@"404"]];
    [self addSubview:m_PromptImgView ];
    
    m_PromptLab = createLab(self, HGColorWithRGB(180, 180, 180, 1.0), 15.5, NSTextAlignmentCenter);
    m_PromptLab.font= [UIFont boldSystemFontOfSize:15.5];
    [m_PromptImgView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(self);
        make.bottom.equalTo(self.mas_centerY).offset(-m_PromptImgView.image.size.height / 2);
        make.width.mas_equalTo(m_PromptImgView.image.size.width);
        make.height.mas_equalTo(m_PromptImgView.image.size.height);
    }];
    
    [m_PromptLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(m_PromptImgView.mas_bottom).offset(15);
        make.centerX.equalTo(self);
    }];
    
    [m_PromptLab sizeToFit];
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
