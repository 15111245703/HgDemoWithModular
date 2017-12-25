//
//  HgThreeViewController.m
//  HgDemoWithModular
//
//  Created by RicardoM Lu on 2017/11/22.
//  Copyright © 2017年 RicardoM Lu. All rights reserved.
//

#import "HgThreeViewController.h"
#import "HgLoginViewController.h"

@interface HgThreeViewController ()<UIAlertViewDelegate>

@end

@implementation HgThreeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.navigationView setTitle:@"老三啊"];


    [self setupSections];

}

- (void)setupSections
{
    
    //************************************section1
    HgBorrwwerBaseModel *item1 = [[HgBorrwwerBaseModel alloc]init];
    item1.funcName = @"我的余额";
    item1.executeCode = ^{
        NSLog(@"我的余额");
        [self showAlert:@"我的余额"];
    };
    item1.detailText = @"做任务赢大奖";
    item1.accessoryType = HgSettingAccessoryTypeDisclosureIndicator;
    
//    HgBorrwwerBaseModel *item2 = [[HgBorrwwerBaseModel alloc]init];
//    item2.funcName = @"修改密码";
//    item2.accessoryType = HgSettingAccessoryTypeDisclosureIndicator;
    
    HgBorrwwerSectionBaseModel *section1 = [[HgBorrwwerSectionBaseModel alloc]init];
    section1.sectionHeaderHeight = 30;
    section1.sectionHeaderName =@"section1";
    section1.itemArray = @[item1];
    
    //************************************section2
    
    HgBorrwwerBaseModel *item4 = [[HgBorrwwerBaseModel alloc]init];
    item4.funcName = @"给我们打分";
    item4.detailImage = [UIImage imageNamed:@"icon-new"];
    item4.accessoryType = HgSettingAccessoryTypeDisclosureIndicator;
    
    
    HgBorrwwerSectionBaseModel *section2 = [[HgBorrwwerSectionBaseModel alloc]init];
    section2.sectionHeaderName =@"section2";
    section2.sectionHeaderHeight = 30;
    section2.itemArray = @[item4];
    
    
    //************************************section3
    HgBorrwwerBaseModel *item6 = [[HgBorrwwerBaseModel alloc]init];
    item6.funcName = @"关于我们";
    item6.accessoryType = HgSettingAccessoryTypeDisclosureIndicator;
    
    HgBorrwwerBaseModel *item7 = [[HgBorrwwerBaseModel alloc]init];
    item7.funcName = @"帮助中心";
    item7.accessoryType = HgSettingAccessoryTypeDisclosureIndicator;
    
    HgBorrwwerBaseModel *item8 = [[HgBorrwwerBaseModel alloc]init];
    item8.funcName = @"清除缓存";
    item8.accessoryType = HgSettingAccessoryTypeDisclosureIndicator;
    
    HgBorrwwerBaseModel *item9 = [[HgBorrwwerBaseModel alloc]init];
    item9.funcName = @"退出登录";
    item9.accessoryType = HgSettingAccessoryTypeDisclosureIndicator;
    item9.executeCode = ^{
        //退出登录
        UIAlertView *alertView =
        [[UIAlertView alloc] initWithTitle:nil
                                   message:@"是否退出登录？"
                                  delegate:self
                         cancelButtonTitle:@"取消"
                         otherButtonTitles:@"确定", nil];
        alertView.tag = 1010;
        [alertView show];
        
    };
    
    
    HgBorrwwerSectionBaseModel *section3 = [[HgBorrwwerSectionBaseModel alloc]init];
    section3.sectionHeaderHeight = 30;
    section3.sectionHeaderName =@"section3";
    section3.itemArray = @[item6,item7,item8,item9];
    self.sectionArray = @[section1,section2,section3];
    NSLog(@"%@,%@,%@",section1,section2,section3);
    
}


- (void)alertView:(UIAlertView *)alertView
clickedButtonAtIndex:(NSInteger)buttonIndex {
    if (buttonIndex == 1 && alertView.tag == 1010) {
        //设置消息角标
        [UIApplication sharedApplication].applicationIconBadgeNumber = 0;
        //清除默认保存数据，也可以选择不清除
        /*
         #define DEFAULTS [NSUserDefaults standardUserDefaults]
         */
        //        退出登录
//        [DEFAULTS removeObjectForKey:@"userName"];
//        [DEFAULTS removeObjectForKey:@"userPwd"];
//        [DEFAULTS removeObjectForKey:@"userId"];
//        [DEFAULTS synchronize];

        
        dispatch_async(dispatch_get_main_queue(), ^{
            EasyNavigationController * nav = [[EasyNavigationController alloc] initWithRootViewController:[[HgLoginViewController alloc] init]];
            self.view.window.rootViewController = nav;
        });

    }
    
}

- (void)showAlert:(NSString *)title
{
    UIAlertView *alert = [[UIAlertView alloc]initWithTitle:@"点击了" message:title delegate:nil cancelButtonTitle:@"确定" otherButtonTitles: nil];
    [alert show];
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
