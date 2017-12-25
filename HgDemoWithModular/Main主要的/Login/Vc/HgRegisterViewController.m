//
//  HgRegisterViewController.m
//  HGBasicFramework
//
//  Created by RicardoM Lu on 2017/8/21.
//  Copyright © 2017年 RicardoM Lu. All rights reserved.
//

#import "HgRegisterViewController.h"
#import "RCUnderlineTextField.h"
#import "HgLoginViewController.h"
#import "RCDTextFieldValidate.h"
#import "HgBaseCustomObj.h"
@interface HgRegisterViewController ()<UITextFieldDelegate,UIAlertViewDelegate>
@property(nonatomic, strong)  RCAnimatedImagesView *animatedImagesView;

//用来放除了背景图片之外的所有控件
@property(nonatomic, strong)  UIView * bgView;
//logo
@property(nonatomic, strong)  UIImageView *rongLogo;


@property(nonatomic, strong)  UILabel *countDownLable;
@property(nonatomic, strong)  UIButton *getVerificationCodeBt;


@end

@implementation HgRegisterViewController
#define PhoneNumberFieldTag 233
#define PassWordFieldTag 234
#define NickNameFieldTag 235
#define VerificationCodeFieldTag 236


#define lineWithLeft 30
#define lineWithRight -30
#define textFileWithHigh 50
-(void)loadView
{
    self.view =[[UIScrollView alloc] initWithFrame:kMainScreenBounds];
}

- (instancetype)init {
    self = [super init];

    return self;
}


- (void)viewDidLoad {
    [super viewDidLoad];
//    [self.navigationView setTitle:@"注册"];

    [self initWithUI];
}
#pragma mark--------背景动态图片
- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    [self.animatedImagesView startAnimating];
    //写入这个方法后,这个页面将没有这种效果
}
- (void)viewDidDisappear:(BOOL)animated {
    [super viewDidDisappear:animated];
    [self.animatedImagesView stopAnimating];
}

- (NSUInteger)animatedImagesNumberOfImages:
(RCAnimatedImagesView *)animatedImagesView {
    return 2;
}
- (void)viewDidUnload {
    [self setAnimatedImagesView:nil];
    

    [super viewDidUnload];
}
- (UIImage *)animatedImagesView:(RCAnimatedImagesView *)animatedImagesView
                   imageAtIndex:(NSUInteger)index {
    return [UIImage imageNamed:@"login_background.png"];
}
#pragma mark--------初始化其他UI

-(void)initWithUI{
//    [self.navigationController setNavigationBarHidden:YES animated:YES];
    [self.navigationView setHidden:YES];
    //    self.view.translatesAutoresizingMaskIntoConstraints = YES;
    //添加动态图
    self.animatedImagesView = [[RCAnimatedImagesView alloc]
                               initWithFrame:CGRectMake(0, 0, self.view.bounds.size.width,
                                                        self.view.bounds.size.height)];
    [self.view addSubview:self.animatedImagesView];
    self.animatedImagesView.delegate = self;
    
    _bgView =[[UIView alloc] initWithFrame:CGRectMake(0, 0, kMainScreenBoundwidth, kMainScreenBoundheight)];
    _bgView.userInteractionEnabled = YES;
    
    _bgView.backgroundColor =[UIColor clearColor];
    [self.view addSubview:_bgView];
    
    
    //logo
    UIImage *rongLogoImage = [UIImage imageNamed:@"login_logo"];
    _rongLogo = [[UIImageView alloc] initWithImage:rongLogoImage];
    _rongLogo.contentMode = UIViewContentModeScaleAspectFit;

    [_bgView addSubview:_rongLogo];
    
    [_rongLogo mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.mas_equalTo(_bgView);
        make.width.offset(kMainScreenBoundwidth/3);
        make.height.offset(kMainScreenBoundwidth/3);
        make.top.mas_equalTo(_bgView.mas_top).offset(kMainScreenBoundheight/6);
    }];
    [DCSpeedy dc_chageControlCircularWith:_rongLogo AndSetCornerRadius:_rongLogo.width/2 SetBorderWidth:0 SetBorderColor:0 canMasksToBounds:YES];

    UIColor *color = [UIColor whiteColor];
    //昵称
    RCUnderlineTextField *nicknameTextField =
    [[RCUnderlineTextField alloc] initWithFrame:CGRectZero];
    nicknameTextField.tag = NickNameFieldTag;
    nicknameTextField.delegate = self;
    nicknameTextField.textColor = [UIColor whiteColor];
    nicknameTextField.returnKeyType = UIReturnKeyDone;
    // nicknameTextField.secureTextEntry = YES;
    // passwordTextField.delegate = self;
    nicknameTextField.adjustsFontSizeToFitWidth = YES;
    nicknameTextField.clearButtonMode = UITextFieldViewModeWhileEditing;
    nicknameTextField.attributedPlaceholder = [[NSAttributedString alloc]
                                                 initWithString:@"昵 称"
                                                 attributes:@{NSForegroundColorAttributeName : color}];
    nicknameTextField.translatesAutoresizingMaskIntoConstraints = NO;
    // passwordTextField.text = [self getDefaultUserPwd];
    if (nicknameTextField.text.length > 0) {
        [nicknameTextField setFont:[UIFont fontWithName:PFR size:25.0]];
    }
    
    [_bgView addSubview:nicknameTextField];
//    phoneNumberTextField.text = [[UserDefaultsObj shareInstance] getDefaultUserName];
    [nicknameTextField mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.mas_equalTo(self.view);
        make.height.mas_equalTo(textFileWithHigh);
        make.top.mas_equalTo(_rongLogo.mas_bottom).offset(30);
        make.left.mas_equalTo(_bgView.mas_left).offset(lineWithLeft);
        make.right.mas_equalTo(_bgView.mas_right).offset(lineWithRight);
    }];
    
    
    //手机号码
    RCUnderlineTextField *phoneNumberTextField =
    [[RCUnderlineTextField alloc] initWithFrame:CGRectZero];
    
    phoneNumberTextField.backgroundColor = [UIColor clearColor];
    phoneNumberTextField.tag = PhoneNumberFieldTag;
    //_account.placeholder=[NSString stringWithFormat:@"Email"];
    phoneNumberTextField.attributedPlaceholder = [[NSAttributedString alloc]
                                               initWithString:@"手机号"
                                               attributes:@{NSForegroundColorAttributeName : color}];
    phoneNumberTextField.textColor = [UIColor whiteColor];
    self.view.translatesAutoresizingMaskIntoConstraints = YES;
    phoneNumberTextField.translatesAutoresizingMaskIntoConstraints = NO;
    phoneNumberTextField.adjustsFontSizeToFitWidth = YES;
    phoneNumberTextField.clearButtonMode = UITextFieldViewModeWhileEditing;
    phoneNumberTextField.delegate = self;
    [_bgView addSubview:phoneNumberTextField];
    phoneNumberTextField.keyboardType = UIKeyboardTypeNumberPad;
    if (phoneNumberTextField.text.length > 0) {
        [phoneNumberTextField setFont:[UIFont fontWithName:PFR size:25.0]];
    }
    [phoneNumberTextField mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.mas_equalTo(self.view);
        make.height.mas_equalTo(textFileWithHigh);
        make.top.mas_equalTo(nicknameTextField.mas_bottom).offset(0);
        make.left.mas_equalTo(_bgView.mas_left).offset(lineWithLeft);
        make.right.mas_equalTo(_bgView.mas_right).offset(lineWithRight);
    }];

    //手机号码提示框
    UILabel *phoneNumberMsgLb = [[UILabel alloc] initWithFrame:CGRectZero];
    phoneNumberMsgLb.text = @"手机号码";
    phoneNumberMsgLb.font = [UIFont fontWithName:PFR size:10.0];
    phoneNumberMsgLb.translatesAutoresizingMaskIntoConstraints = NO;
    phoneNumberMsgLb.textColor =HGColorWithRGB(153,153,153,0.5);
    [_bgView addSubview:phoneNumberMsgLb];
//    _PhoneNumber = phoneNumberTextField.text;
//        phoneNumberTextField.text = [[UserDefaultsObj shareInstance] getDefaultUserName];
    
    
    [phoneNumberMsgLb mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(phoneNumberTextField.mas_bottom).offset(-5);
        make.right.mas_equalTo(phoneNumberTextField.mas_right).offset(0);
    }];
//验证码文本框
    RCUnderlineTextField *verificationCodeField =
    [[RCUnderlineTextField alloc] initWithFrame:CGRectZero];
    
    verificationCodeField.backgroundColor = [UIColor clearColor];
    verificationCodeField.tag = VerificationCodeFieldTag;
    verificationCodeField.attributedPlaceholder = [[NSAttributedString alloc]
                                                   initWithString:@"短信验证码"
                                                   attributes:@{NSForegroundColorAttributeName : color}];
    verificationCodeField.textColor = [UIColor whiteColor];
    self.view.translatesAutoresizingMaskIntoConstraints = YES;
    verificationCodeField.translatesAutoresizingMaskIntoConstraints = NO;
    verificationCodeField.adjustsFontSizeToFitWidth = YES;
    verificationCodeField.clearButtonMode = UITextFieldViewModeWhileEditing;
    verificationCodeField.keyboardType = UIKeyboardTypeNumberPad;
    [_bgView addSubview:verificationCodeField];
    if (verificationCodeField.text.length > 0) {
        [verificationCodeField setFont:[UIFont fontWithName:PFR size:25.0]];
    }
    
    UILabel *verificationCodeLb = [[UILabel alloc] initWithFrame:CGRectZero];
    verificationCodeLb.text = @"验证码";
    verificationCodeLb.hidden = YES;
    
    verificationCodeLb.font = [UIFont fontWithName:PFR size:10.0];
    verificationCodeLb.translatesAutoresizingMaskIntoConstraints = NO;
    verificationCodeLb.textColor = [UIColor whiteColor];
    [_bgView addSubview:verificationCodeLb];
    verificationCodeField.delegate = self;
    
    
    [verificationCodeField mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.centerX.mas_equalTo(self.view);
        make.height.mas_equalTo(textFileWithHigh);
        make.width.mas_offset((self.view.frame.size.width-lineWithLeft+lineWithRight)/3*2-10);
        make.top.mas_equalTo(phoneNumberTextField.mas_bottom).offset(0);
        make.left.mas_equalTo(_bgView.mas_left).offset(lineWithLeft);
//        make.right.mas_equalTo(_bgView.mas_right).offset(-40);
    }];
    
    //验证码按钮
    _getVerificationCodeBt = [[UIButton alloc] init];
    [_getVerificationCodeBt
     setBackgroundColor:HGColorWithRGB(133, 133, 133, 1)];
    [_getVerificationCodeBt setTitle:@"发送验证码" forState:UIControlStateNormal];
    [_getVerificationCodeBt setTitleColor:[UIColor whiteColor]
                                 forState:UIControlStateNormal];
    [_getVerificationCodeBt addTarget:self
                               action:@selector(getVerficationCode:)
                     forControlEvents:UIControlEventTouchUpInside];
    _getVerificationCodeBt.translatesAutoresizingMaskIntoConstraints = NO;
    [_getVerificationCodeBt.titleLabel
     setFont:[UIFont fontWithName:PFR size:13.0]];
    _getVerificationCodeBt.enabled = YES;
    _getVerificationCodeBt.layer.masksToBounds = YES;
    _getVerificationCodeBt.layer.cornerRadius = 6.f;
    [_bgView addSubview:_getVerificationCodeBt];
    
    [_getVerificationCodeBt mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.mas_equalTo(verificationCodeField);
        make.width.mas_offset((self.view.frame.size.width-lineWithLeft+lineWithRight)/3);
        make.left.mas_equalTo(verificationCodeField.mas_right).offset(10);
    }];
//密码
    RCUnderlineTextField *passwordTextField =
    [[RCUnderlineTextField alloc] initWithFrame:CGRectZero];
    passwordTextField.tag = PassWordFieldTag;
    passwordTextField.textColor = [UIColor whiteColor];
    passwordTextField.returnKeyType = UIReturnKeyDone;
    passwordTextField.clearButtonMode = UITextFieldViewModeWhileEditing;
    passwordTextField.secureTextEntry = YES;
    passwordTextField.delegate = self;
    passwordTextField.attributedPlaceholder = [[NSAttributedString alloc]
                                               initWithString:@"密码"
                                               attributes:@{NSForegroundColorAttributeName : color}];
    passwordTextField.translatesAutoresizingMaskIntoConstraints = NO;
    // passwordTextField.text = [self getDefaultUserPwd];
    [_bgView addSubview:passwordTextField];
    [passwordTextField mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.mas_equalTo(self.view);
        make.height.mas_equalTo(textFileWithHigh);
        make.top.mas_equalTo(verificationCodeField.mas_bottom).offset(0);
        make.left.mas_equalTo(_bgView.mas_left).offset(lineWithLeft);
        make.right.mas_equalTo(_bgView.mas_right).offset(lineWithRight);
    }];

    UILabel *pswMsgLb = [[UILabel alloc] initWithFrame:CGRectZero];
    pswMsgLb.text = @"6-16位字符区分大小写";
    pswMsgLb.font = [UIFont fontWithName:PFR size:10.0];
    pswMsgLb.translatesAutoresizingMaskIntoConstraints = NO;
    pswMsgLb.textColor =HGColorWithRGB(153,153,153,0.5);
    [_bgView addSubview:pswMsgLb];
    [pswMsgLb mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(passwordTextField.mas_bottom).offset(-5);
        make.right.mas_equalTo(passwordTextField.mas_right).offset(0);
    }];
    
    //注册按钮
    UIButton * registerBtn = [[UIButton alloc] init];
    [registerBtn addTarget:self action:@selector(registerAction:) forControlEvents: UIControlEventTouchUpInside];
    [registerBtn setTitle:@"注册" forState:UIControlStateNormal];
    registerBtn.layer.cornerRadius = 5;
    registerBtn.layer.borderWidth =0;
    registerBtn.layer.borderColor = 0;
    [registerBtn.layer setMasksToBounds:YES];

    registerBtn.backgroundColor =  HGColorWithRGB(240, 250, 250, 0.5);
    [_bgView addSubview:registerBtn];
    [registerBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.mas_equalTo(self.view);
        make.height.mas_equalTo(textFileWithHigh-10);
        make.top.mas_equalTo(passwordTextField.mas_bottom).offset(20);
        make.left.mas_equalTo(self.view.mas_left).offset(lineWithLeft);
        make.right.mas_equalTo(self.view.mas_right).offset(lineWithRight);
    }];

    

    //底部
    UIButton *loginBtn = [[UIButton alloc] initWithFrame:CGRectMake(0, kMainScreenBoundheight-50, 80, 50)];
    [loginBtn setTitle:@"登录" forState:UIControlStateNormal];
    [loginBtn setTitleColor:HGColorWithRGB(153,153,153,1) forState:UIControlStateNormal];
    [loginBtn.titleLabel
     setFont:[UIFont fontWithName:PFR size:HgFuncLabelFont]];
    [loginBtn addTarget:self
                            action:@selector(loginActionButton)
                  forControlEvents:UIControlEventTouchUpInside];
    loginBtn.contentHorizontalAlignment = UIControlContentHorizontalAlignmentRight;
    [_bgView addSubview:loginBtn];
//    [loginButton mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.bottom.mas_equalTo(self.view.mas_bottom).mas_offset(0);
//        make.right.mas_equalTo(self.view.mas_right).mas_offset(0);
//        make.height.mas_offset(50);
//        make.width.mas_offset(80);
//    }];
    
    //底部按钮区
    UIButton *forgetPswHeadButton =[[UIButton alloc] initWithFrame:CGRectMake(kMainScreenBoundwidth-80, kMainScreenBoundheight-50, 80, 50)];
    
    [forgetPswHeadButton setTitle:@"找回密码" forState:UIControlStateNormal];
    [forgetPswHeadButton setTitleColor:HGColorWithRGB(153,153,153,1)
                         forState:UIControlStateNormal];
    [forgetPswHeadButton.titleLabel
     setFont:[UIFont fontWithName:PFR size:HgFuncLabelFont]];
    [forgetPswHeadButton addTarget:self
                            action:@selector(forgetPswEvent:)
             forControlEvents:UIControlEventTouchUpInside];
    
    
    forgetPswHeadButton.contentHorizontalAlignment = UIControlContentHorizontalAlignmentLeft;
    [_bgView addSubview:forgetPswHeadButton];
    
//    [forgetPswHeadButton mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.bottom.mas_equalTo(self.view.mas_bottom).mas_offset(0);
//        make.left.mas_equalTo(self.view.mas_left).mas_offset(10);
//        make.height.mas_offset(50);
//        make.width.mas_offset(80);
//    }];

}
//短信验证码
- (void)getVerficationCode:(UIButton *)sender{
    NSString *phoneNumber =
    [(UITextField *)[self.view viewWithTag:PhoneNumberFieldTag] text];

    if ([RCDTextFieldValidate validateMobile:phoneNumber] == NO) {
        return;
    }else{
        [self postVerficationCode:phoneNumber btn:sender];

    }
}
-(void)postVerficationCode:(NSString*)phoneNumber btn:(UIButton *)btn{

    [HgAllParametersAndURL hg_PostVerficationCode:phoneNumber onSuc:^(id json) {
        //短信倒计时
        [[HgBaseCustomObj shareInstance] verificationStartTime:btn];
        
    } onError:^(NSError *error) {
        //            NSLog(@"%@",error.code);
        //            如果error.code=-1001那么就是网络请求超时
    } onProgress:^(float progress) {
        
    }];
}
//注册
- (void)registerAction:(UIButton *)sender {
    
    NSString *phoneNumber =
    [(UITextField *)[self.view viewWithTag:PhoneNumberFieldTag] text];
    NSString *userPwd =
    [(UITextField *)[self.view viewWithTag:PassWordFieldTag] text];
    NSString *nickName =
    [(UITextField *)[self.view viewWithTag:NickNameFieldTag] text];
    NSString *verificationCode =
    [(UITextField *)[self.view viewWithTag:VerificationCodeFieldTag] text];

    if([self validatePhoneNumber:phoneNumber userPwd:userPwd nickName:nickName verificationCode:verificationCode]){
        [self registerPhoneNumber:phoneNumber userPwd:userPwd nickName:nickName verificationCode:verificationCode];
    }
}
-(BOOL)validatePhoneNumber:(NSString *)phoneNumber userPwd:(NSString *)userPwd nickName:(NSString *)nickName verificationCode:(NSString *)verificationCode{
    if (nickName.length>0) {
        [SVProgressHUD showInfoWithStatus:hgInfokey_nikeNameWithDontEmpty];
         [SVProgressHUD dismissWithDelay:kSVProgressHUSDismissTime];
        return NO;
    }
    NSRange _range = [nickName rangeOfString:@" "];
    if (_range.location != NSNotFound) {
        [SVProgressHUD showInfoWithStatus:hgInfokey_CannotContainSpaces];
         [SVProgressHUD dismissWithDelay:kSVProgressHUSDismissTime];
        return NO;
    }

    if ([RCDTextFieldValidate validateMobile:phoneNumber] == NO) {
        return NO;
    }
    if ((verificationCode.length>0)&&(verificationCode.length<6)) {
        [SVProgressHUD showInfoWithStatus:hgInfokey_VerificationCodeError];
         [SVProgressHUD dismissWithDelay:kSVProgressHUSDismissTime];
        return NO;
    }
    if ([RCDTextFieldValidate validatePassword:userPwd] == NO) {
        return NO;
    }

    return YES;
}
-(void)registerPhoneNumber:(NSString *)phoneNumber userPwd:(NSString *)userPwd nickName:(NSString *)nickName verificationCode:(NSString *)verificationCode{
    [HgAllParametersAndURL hg_PostRegisterPhoneNumber:phoneNumber userPwd:userPwd  verificationCode:verificationCode onSuc:^(id json) {
        
    } onError:^(NSError *error) {
    } onProgress:^(float progress) {
        
    }];
}
//登录
-(void)loginActionButton{
    HgLoginViewController *temp = [[HgLoginViewController alloc] init];
    CATransition *transition = [CATransition animation];
    transition.type = kCATransitionPush;        //可更改为其他方式
    transition.subtype = kCATransitionFromLeft; //可更改为其他方式
    [self.navigationController.view.layer addAnimation:transition
                                                forKey:kCATransition];
    [self.navigationController pushViewController:temp animated:NO];
    
}

//找回密码
-(void)forgetPswEvent:(UIButton *)sender{
    
}
/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
