//
//  HgLoginViewController.m
//  HGBasicFramework
//
//  Created by RicardoM Lu on 2017/8/17.
//  Copyright © 2017年 RicardoM Lu. All rights reserved.
//

#import "HgLoginViewController.h"
#import "RCUnderlineTextField.h"
#import "RCDTextFieldValidate.h"
#import "HgBaseCustomObj.h"
#import "UserModel.h"
#import "HgTabBarController.h"
#import "HgRegisterViewController.h"
#import "DCSpeedy.h"

@interface HgLoginViewController ()<UITextFieldDelegate,UIAlertViewDelegate>
@property(nonatomic, strong)  RCAnimatedImagesView *animatedImagesView;

//用来放除了背景图片之外的所有控件
@property(nonatomic, strong)  UIView * bgView;

@property(nonatomic, strong) UIImageView *rongLogo;


@end

@implementation HgLoginViewController
#define UserTextFieldTag 1000
#define PassWordFieldTag 1001

#define lineWithLeft 30
#define lineWithRight -30
#define textFileWithHigh 50
-(void)loadView
{
    self.view =[[UIScrollView alloc] initWithFrame:kMainScreenBounds];
}
- (void)viewWillDisappear:(BOOL)animated{
    [super viewWillDisappear:animated];

    [self.animatedImagesView startAnimating];
}
#pragma mark--------背景动态图片
- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    [self.animatedImagesView startAnimating];

}


- (void)viewDidLoad {
    [super viewDidLoad];


//    self.title =@"登录";、

    [self initWithUI];
    
    self.navigationView.hidden = YES ;
    
    
}
#pragma mark--------背景动态图片
//- (void)viewWillAppear:(BOOL)animated {
//    [super viewWillAppear:animated];
//    [self.animatedImagesView startAnimating];
//}
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
    _rongLogo.translatesAutoresizingMaskIntoConstraints = NO;
    [_bgView addSubview:_rongLogo];
    
    [_rongLogo mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.mas_equalTo(self.view);
        make.width.offset(kMainScreenBoundwidth/3);
        make.height.offset(kMainScreenBoundwidth/3);
        make.top.mas_equalTo(self.view).offset(kMainScreenBoundheight/6);
    }];
    [DCSpeedy dc_chageControlCircularWith:_rongLogo AndSetCornerRadius:_rongLogo.width/2 SetBorderWidth:0 SetBorderColor:0 canMasksToBounds:YES];


    //用户名
    RCUnderlineTextField *userNameTextField =
    [[RCUnderlineTextField alloc] initWithFrame:CGRectZero];
    userNameTextField.backgroundColor = [UIColor clearColor];
    userNameTextField.tag = UserTextFieldTag;
    userNameTextField.delegate = self;
    //_account.placeholder=[NSString stringWithFormat:@"Email"];
    UIColor *color = [UIColor whiteColor];
    userNameTextField.attributedPlaceholder = [[NSAttributedString alloc]
                                               initWithString:@"手机号"
                                               attributes:@{NSForegroundColorAttributeName : color}];
    userNameTextField.textColor = [UIColor whiteColor];
    userNameTextField.clearButtonMode = UITextFieldViewModeWhileEditing;
    userNameTextField.adjustsFontSizeToFitWidth = YES;
    userNameTextField.keyboardType = UIKeyboardTypeNumberPad;
    
    [_bgView addSubview:userNameTextField];
    userNameTextField.text= [[UserDefaultsObj shareInstance] getDefaultMobile];
    [userNameTextField mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.mas_equalTo(self.view);
        make.height.mas_equalTo(textFileWithHigh);
        make.top.mas_equalTo(_rongLogo.mas_bottom).offset(30);
        make.left.mas_equalTo(self.view.mas_left).offset(lineWithLeft);
        make.right.mas_equalTo(self.view.mas_right).offset(lineWithRight);

    }];
    //密码
    RCUnderlineTextField *passwordTextField =
    [[RCUnderlineTextField alloc] initWithFrame:CGRectZero];
    passwordTextField.tag = PassWordFieldTag;
    passwordTextField.textColor = [UIColor whiteColor];
    passwordTextField.returnKeyType = UIReturnKeyDone;
    passwordTextField.secureTextEntry = YES;
    passwordTextField.delegate = self;
    passwordTextField.clearButtonMode = UITextFieldViewModeWhileEditing;
    passwordTextField.attributedPlaceholder = [[NSAttributedString alloc]
                                               initWithString:@"密码"
                                               attributes:@{NSForegroundColorAttributeName : color}];
    [_bgView addSubview:passwordTextField];
    passwordTextField.text = [[UserDefaultsObj shareInstance] getDefaultUserPwd];

    [passwordTextField mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.mas_equalTo(self.view);
        make.height.mas_equalTo(textFileWithHigh);
        make.top.mas_equalTo(userNameTextField.mas_bottom).offset(0);
        make.left.mas_equalTo(self.view.mas_left).offset(lineWithLeft);
        make.right.mas_equalTo(self.view.mas_right).offset(lineWithRight);
    }];
    
    
    //登录按钮
    UIButton * loginBtn = [[UIButton alloc] init];
    [loginBtn addTarget:self action:@selector(actionLogin:) forControlEvents: UIControlEventTouchUpInside];
    [loginBtn setTitle:@"登录" forState:UIControlStateNormal];
    [DCSpeedy dc_chageControlCircularWith:loginBtn AndSetCornerRadius:5 SetBorderWidth:0 SetBorderColor:0 canMasksToBounds:YES];
    

    loginBtn.backgroundColor =  HGColorWithRGB(240, 250, 250, 0.5);
    [_bgView addSubview:loginBtn];
    [loginBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.mas_equalTo(self.view);
        make.height.mas_equalTo(textFileWithHigh-10);
        make.top.mas_equalTo(passwordTextField.mas_bottom).offset(20);
        make.left.mas_equalTo(self.view.mas_left).offset(lineWithLeft);
        make.right.mas_equalTo(self.view.mas_right).offset(lineWithRight);
    }];
    UIView * protocolView =[[UIView alloc] init];
    protocolView.backgroundColor =[UIColor clearColor];
    [_bgView addSubview:protocolView];
    [protocolView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.mas_equalTo(self.view);
        make.height.mas_equalTo(21);
        make.top.mas_equalTo(loginBtn.mas_bottom).offset(15);
        make.left.mas_equalTo(self.view.mas_left).offset(lineWithLeft);
        make.right.mas_equalTo(self.view.mas_right).offset(lineWithRight);
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

    UIButton *protocolbtn  =createBtn(protocolView, self, @selector(protocolAction:), [UIColor clearColor], [UIColor clearColor]);
   
    
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




    
    
    

    //底部
    UIButton *forgetPswHeadButton = [[UIButton alloc] initWithFrame:CGRectMake(10, kMainScreenBoundheight-50, 80, 50)];
    [forgetPswHeadButton setTitle:@"找回密码" forState:UIControlStateNormal];
    [forgetPswHeadButton setTitleColor:HGColorWithRGB(153,153,153,1) forState:UIControlStateNormal];
    [forgetPswHeadButton.titleLabel
     setFont:[UIFont fontWithName:PFR size:HgFuncLabelFont]];
    [forgetPswHeadButton addTarget:self
                            action:@selector(forgetPswEvent)
                  forControlEvents:UIControlEventTouchUpInside];
//    forgetPswHeadButton.iwe_textAlignment=NSTextAlignmentRight;
    forgetPswHeadButton.contentHorizontalAlignment = UIControlContentHorizontalAlignmentRight;
    [_bgView addSubview:forgetPswHeadButton];
    
    
    //底部按钮区
    UIButton *registerButton =[[UIButton alloc] initWithFrame:CGRectMake(kMainScreenBoundwidth-80, kMainScreenBoundheight-50, 80, 50)];

    [registerButton setTitle:@"新用户" forState:UIControlStateNormal];
    [registerButton setTitleColor:HGColorWithRGB(153,153,153,1)
                         forState:UIControlStateNormal];
    [registerButton.titleLabel
     setFont:[UIFont fontWithName:PFR size:HgFuncLabelFont]];
    [registerButton addTarget:self
                       action:@selector(registerEvent)
             forControlEvents:UIControlEventTouchUpInside];
    
    registerButton.contentHorizontalAlignment = UIControlContentHorizontalAlignmentLeft;
    [_bgView addSubview:registerButton];
    
}
-(void)protocolAction:(UIButton*)sender{
    hgLog(@"这里跳到协议web页面，建议采用模态跳转");
}
//- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
//    [self.view endEditing:YES];
//}
//- (BOOL)textFieldShouldReturn:(UITextField *)textField {
//    iWLog(@"textFieldShouldReturn");
//    [textField resignFirstResponder];
//    return YES;
//}
//输入框右边删除小按钮的触发时间
- (BOOL)textFieldShouldClear:(UITextField *)textField {
    switch (textField.tag) {
        case UserTextFieldTag:
            [DEFAULTS removeObjectForKey:@"userName"];

        case PassWordFieldTag:
            [DEFAULTS removeObjectForKey:@"userPwd"];
            break;
        default:
            break;
    }
    return YES;
}
//登录
- (void)actionLogin:(UIButton *)sender {
    NSString *userName =
    [(UITextField *)[self.view viewWithTag:UserTextFieldTag] text];
    NSString *userPwd =
    [(UITextField *)[self.view viewWithTag:PassWordFieldTag] text];
    
    if([self validateUserName:userName userPwd:userPwd]){
        [self login:userName password:userPwd];
    }
}
//验证用户信息格式
- (BOOL)validateUserName:(NSString *)userName userPwd:(NSString *)userPwd {

    if ([RCDTextFieldValidate validateMobile:userName] == NO) {

        return NO;
    }
    if ([RCDTextFieldValidate validatePassword:userPwd] == NO) {
        return NO;
    }
    return YES;
}
/**
 *  登录
 */
- (void)login:(NSString *)userName password:(NSString *)password {
 

    [HgAllParametersAndURL hg_PostUserLogin:userName pswd:password onSuc:^(id json) {
        hgLog(@"%@",json);
        UserModel *model = [UserModel yy_modelWithJSON:json];
        HgTmCustomer * tmCustomermodel =model.hgTmCustomer;
        [[HgDataBaseManager shareInstance] addUserModelWithWHC:model];
        //WHC_ModelSqlite用户模型存入本地，第二个用户登录会存入第二个用户模型
        //保存默认用户的信息，第二个用户登录，会替换第一个人的用户信息
        [DEFAULTS setObject:model.hgMobile forKey:kuserHgMobile];
        [DEFAULTS setObject:password forKey:kuserHgPassword];
        [DEFAULTS setObject:model.hgAppKey forKey:kuserHgAppKey];
        [DEFAULTS setObject:tmCustomermodel.hgUpdateDate forKey:kuserHgUpdateDate];
        [DEFAULTS setObject:model.hgId forKey:kuserHgId];
        [DEFAULTS setObject:tmCustomermodel.hgCreateDate forKey:kuserHgCreateDate];
        [DEFAULTS setObject:tmCustomermodel.hgMemberId forKey:kuserHgMemberId];
        [DEFAULTS setObject:tmCustomermodel.hgCertifiedFlag forKey:kuserHgCertifiedFlag];
        [DEFAULTS setObject:tmCustomermodel.hgIsNewRecord forKey:kuserHgIsNewRecord];
        [DEFAULTS synchronize];
        dispatch_async(dispatch_get_main_queue(), ^{
            [UIApplication sharedApplication].delegate.window.rootViewController = [[HgTabBarController alloc] init];

        });
        
    } onError:^(NSError *error) {
        
    } onProgress:^(float progress) {
        
    }];
}

/*注册*/
- (void)registerEvent {
    HgRegisterViewController * Vc =[[HgRegisterViewController alloc] init];
    [self.navigationController pushViewController:Vc animated:YES];
}

/*找回密码*/
- (void)forgetPswEvent {
    
    
}

@end
