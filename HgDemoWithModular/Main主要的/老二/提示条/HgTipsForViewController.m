//
//  HgTipsForViewController.m
//  HgDemoWithModular
//
//  Created by RicardoM Lu on 2017/11/29.
//  Copyright © 2017年 RicardoM Lu. All rights reserved.
//

#import "HgTipsForViewController.h"
#import "HgBaseCustomObj.h"
#import "MainViewController.h"
@interface HgTipsForViewController ()

@end

@implementation HgTipsForViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.navigationView setTitle:@"提示条"];
    [self initWithUI];

}
-(void)initWithUI{
    UIButton *btn1 = [UIButton new];
    [btn1 setTitle:@"显示" forState:UIControlStateNormal];
    [btn1 setTitleColor:HGColorWithRGB(153,153,153,1) forState:UIControlStateNormal];
    [btn1.titleLabel
     setFont:[UIFont fontWithName:PFR size:HgFuncLabelFont]];
    [btn1 addTarget:self
             action:@selector(btnAction:)
                  forControlEvents:UIControlEventTouchUpInside];
    btn1.contentHorizontalAlignment = UIControlContentHorizontalAlignmentLeft;
    btn1.tag =1001;
    [self.view addSubview:btn1];
    [btn1 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self.view.mas_top).offset(15+IPHONE_NAVIGATIONBAR_HEIGHT);
        make.left.mas_equalTo(self.view.mas_left).offset(20);
    }];
    [btn1 sizeToFit];
    
    UIButton *btn2 = [UIButton new];
    [btn2 setTitle:@"移除" forState:UIControlStateNormal];
    [btn2 setTitleColor:HGColorWithRGB(153,153,153,1) forState:UIControlStateNormal];
    [btn2.titleLabel
     setFont:[UIFont fontWithName:PFR size:HgFuncLabelFont]];
    [btn2 addTarget:self
             action:@selector(btnAction:)
                  forControlEvents:UIControlEventTouchUpInside];
    btn2.contentHorizontalAlignment = UIControlContentHorizontalAlignmentRight;
    btn2.tag =1002;

    [self.view addSubview:btn2];
    [btn2 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self.view.mas_top).offset(15+IPHONE_NAVIGATIONBAR_HEIGHT);
        make.right.mas_equalTo(self.view.mas_right).offset(-20);
    }];
    [btn2 sizeToFit];
    UIButton *btn3 = [UIButton new];
    [btn3 setTitle:@"详情" forState:UIControlStateNormal];
    [btn3 setTitleColor:HGColorWithRGB(153,153,153,1) forState:UIControlStateNormal];
    [btn3.titleLabel
     setFont:[UIFont fontWithName:PFR size:HgFuncLabelFont]];
    [btn3 addTarget:self
             action:@selector(btnAction:)
   forControlEvents:UIControlEventTouchUpInside];
    btn3.contentHorizontalAlignment = UIControlContentHorizontalAlignmentRight;
    btn3.tag =1003;
    
    [self.view addSubview:btn3];
    [btn3 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(btn2.mas_bottom).offset(15+IPHONE_NAVIGATIONBAR_HEIGHT);
        make.right.mas_equalTo(self.view.mas_right).offset(-20);
    }];
    [btn3 sizeToFit];

}
-(void)btnAction:(UIButton*)sender{
    if (sender.tag==1001) {
//        [[CRToastManager showNotificationWithOptions:[[HgBaseCustomObj shareInstance] optionsTitle:@"网络不是太特么给力啊"]
//                                      apperanceBlock:^(void) {
//                                          NSLog(@"Appeared");
//                                      }
//                                     completionBlock:^(void) {
//                                         NSLog(@"Completed");
//                                     }];
        [CRToastManager showNotificationWithOptions:@"网络不是太特么给力啊" completionBlock:^{
            
        }];
    }else if(sender.tag ==1002){
        [CRToastManager dismissNotification:YES];

    }else if (sender.tag==1003){
        MainViewController * vc =[[MainViewController alloc] init];
        [self.navigationController pushViewController:vc animated:YES];
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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
