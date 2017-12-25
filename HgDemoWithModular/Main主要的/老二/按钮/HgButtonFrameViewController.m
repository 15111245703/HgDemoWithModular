//
//  HgButtonFrameViewController.m
//  HgDemoWithModular
//
//  Created by RicardoM Lu on 2017/11/28.
//  Copyright © 2017年 RicardoM Lu. All rights reserved.
//
#define lineWithLeft 30
#define lineWithRight -30

#import "HgButtonFrameViewController.h"
#import "HgBaseCustomObj.h"
@interface HgButtonFrameViewController ()
@property(nonatomic, strong)  UIView * bgView;

@end

@implementation HgButtonFrameViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.navigationView setTitle:@"UIButton按钮"];
    _bgView =[[UIView alloc] initWithFrame:CGRectMake(0, IPHONE_NAVIGATIONBAR_HEIGHT, kMainScreenBoundwidth, kMainScreenBoundheight)];
    _bgView.userInteractionEnabled = YES;
    
    _bgView.backgroundColor =hg_BG_Color;
    [self.view addSubview:_bgView];
 
    
    //登录按钮
    UIButton * loginBtn = [[UIButton alloc] init];
    [loginBtn addTarget:self action:@selector(btnAction) forControlEvents: UIControlEventTouchUpInside];
    [loginBtn setTitle:@"登录" forState:UIControlStateNormal];
    [DCSpeedy dc_chageControlCircularWith:loginBtn AndSetCornerRadius:5 SetBorderWidth:0 SetBorderColor:0 canMasksToBounds:YES];
    

    [_bgView addSubview:loginBtn];
    [loginBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.mas_equalTo(self.view);
        make.height.mas_equalTo(40);
        make.top.mas_equalTo(_bgView.mas_top).offset(20);
        make.left.mas_equalTo(_bgView.mas_left).offset(lineWithLeft);
        make.right.mas_equalTo(_bgView.mas_right).offset(lineWithRight);
    }];
    
    
    
    UIView * protocolView =[[UIView alloc] init];
    protocolView.backgroundColor =[UIColor clearColor];
    [_bgView addSubview:protocolView];
    [protocolView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.mas_equalTo(_bgView);
        make.height.mas_equalTo(21);
        make.top.mas_equalTo(loginBtn.mas_bottom).offset(15);
        make.left.mas_equalTo(_bgView.mas_left).offset(lineWithLeft);
        make.right.mas_equalTo(_bgView.mas_right).offset(lineWithRight);
    }];
    
    
    UILabel * infoLable = [[UILabel alloc] init];
    infoLable.text=@"登录即表示同意";
    infoLable.textColor = [UIColor lightGrayColor];
    infoLable.font = [UIFont systemFontOfSize:HgDetailLabelFont];
    infoLable.textAlignment = NSTextAlignmentRight;
    [protocolView addSubview:infoLable];
    
    [infoLable mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.mas_equalTo(protocolView.mas_centerX).offset(0);
        make.top.mas_equalTo(protocolView.mas_top).offset(0);
        make.height.offset(21);
    }];
    
    
    
    
    UIButton *protocolbtn  =createBtn(protocolView, self, @selector(btnAction), [UIColor clearColor], [UIColor clearColor]);
    NSMutableAttributedString *title = [[NSMutableAttributedString alloc] initWithString:@"HgAPP协议"];
    NSRange titleRange = {0,[title length]};
    [title addAttributes:@{NSUnderlineStyleAttributeName:[NSNumber numberWithInteger:NSUnderlineStyleSingle],NSUnderlineColorAttributeName:[UIColor redColor],NSForegroundColorAttributeName:[UIColor redColor]} range:titleRange];
    [protocolbtn setAttributedTitle:title
                           forState:UIControlStateNormal];
    [protocolbtn.titleLabel setFont:[UIFont systemFontOfSize:HgDetailLabelFont]];
    protocolbtn.titleLabel.textAlignment = NSTextAlignmentRight;
    [protocolbtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(protocolView.mas_centerX).offset(0);
        make.top.mas_equalTo(protocolView.mas_top).offset(0);
        make.height.offset(21);
    }];
    
    
    
    UIButton *forgetPswHeadButton = [UIButton new];
    [forgetPswHeadButton setTitle:@"找回密码" forState:UIControlStateNormal];
    [forgetPswHeadButton setTitleColor:HGColorWithRGB(153,153,153,1) forState:UIControlStateNormal];
    [forgetPswHeadButton.titleLabel
     setFont:[UIFont fontWithName:PFR size:HgFuncLabelFont]];
    [forgetPswHeadButton addTarget:self
                            action:@selector(btnAction)
                  forControlEvents:UIControlEventTouchUpInside];
    forgetPswHeadButton.contentHorizontalAlignment = UIControlContentHorizontalAlignmentRight;
    [_bgView addSubview:forgetPswHeadButton];
    [forgetPswHeadButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(protocolbtn.mas_bottom).offset(15);
        make.left.mas_equalTo(_bgView.mas_left).offset(20);
    }];
    [forgetPswHeadButton sizeToFit];

    
    UIButton *registerButton = createBtn(_bgView, self, @selector(btnAction), HGColorWithRGB(153,153,153,1), HGColorWithRGB(153,153,153,1));
    [registerButton setTitle:@"新用户" forState:UIControlStateNormal];
    [registerButton.titleLabel
     setFont:[UIFont fontWithName:PFR size:HgFuncLabelFont]];

    registerButton.contentHorizontalAlignment = UIControlContentHorizontalAlignmentCenter;
    [_bgView addSubview:registerButton];
    [registerButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(protocolbtn.mas_bottom).offset(15);
        make.right.mas_equalTo(_bgView.mas_right).offset(-10);
        make.height.offset(30);
        make.width.offset(50);
    }];
    
    
    UIButton*forwardBtn = [[BottomButton alloc] init];
    [forwardBtn addTarget:self action:@selector(btnAction) forControlEvents:UIControlEventTouchUpInside];
    [forwardBtn setImage:[UIImage imageNamed:@"left"] forState:UIControlStateNormal];
    [forwardBtn setImage:[UIImage imageNamed:@"left_"] forState:UIControlStateHighlighted];
    [forwardBtn setTitleColor:[UIColor lightGrayColor] forState:UIControlStateNormal];
    [forwardBtn setTitleColor:HGColorWithRGB(255, 160, 311,1) forState:UIControlStateHighlighted];
    [forwardBtn setTitle:@"图片按钮" forState:UIControlStateNormal ];
    [forwardBtn.titleLabel setFont: [UIFont systemFontOfSize: HgFuncLabelFont]];
    [_bgView addSubview:forwardBtn];
    
    [forwardBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(registerButton.mas_bottom).offset(15);
        make.centerX.mas_equalTo(_bgView.centerX).offset(0);
        make.height.offset(30);
        make.width.offset(200);
    }];

}
-(void)btnAction{
    hgLog(@"按钮点击事件");
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end


@interface BottomButton ()
{
    
}

@end



@implementation BottomButton

- (CGRect)imageRectForContentRect:(CGRect)contentRect
{
    return CGRectMake(0, 0, 24, 24);//图片的位置大小
}

-(CGRect)titleRectForContentRect:(CGRect)contentRect
{
    return CGRectMake(30, 0, 100, 30);//文本的位置大小
//    CGRectMake(<#CGFloat x#>, <#CGFloat y#>, <#CGFloat width#>, <#CGFloat height#>)
}

@end
