//
//  SYYSwitchsViewController.m
//  HgDemoWithModular
//
//  Created by Syy on 2017/12/4.
//  Copyright © 2017年 RicardoM Lu. All rights reserved.
//

#import "SYYSwitchsViewController.h"
#import "SYYQRadioViewController.h"
#import "SYYQCheckBoxViewController.h"

#import "PPHomePageController.h"
#import "SYYLLSwichViewController.h"
#import "SYYSecenSwitchViewController.h"
@interface SYYSwitchsViewController ()

@end

@implementation SYYSwitchsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self.navigationView setTitle:@"单选多选switch"];
    [self setupSections];
}
- (void)setupSections
{
    WS(weakSelf);
    //************************************section1
    HgBorrwwerBaseModel *item1 = [[HgBorrwwerBaseModel alloc]init];
    item1.funcName = @"SYYQRadioViewController";
    item1.executeCode = ^{
        SYYQRadioViewController * vc = [[SYYQRadioViewController alloc] init];
        [weakSelf.navigationController pushViewController:vc animated:YES];
    };
    item1.detailText = @"单选";
    item1.accessoryType = HgSettingAccessoryTypeDisclosureIndicator;
    
    HgBorrwwerBaseModel *item2 = [[HgBorrwwerBaseModel alloc]init];
    item2.funcName = @"SYYQCheckBoxViewController";
    item2.executeCode = ^{
        
        SYYQCheckBoxViewController * vc = [[SYYQCheckBoxViewController alloc] init];
        [weakSelf.navigationController pushViewController:vc animated:YES];
        
    };
    item2.detailText = @"多选";
    item2.accessoryType = HgSettingAccessoryTypeDisclosureIndicator;
    //    item2.redDotStr =@"yes";

    //************************************section1
    HgBorrwwerBaseModel *item4 = [[HgBorrwwerBaseModel alloc]init];
    item4.funcName = @"PPHomePageController";
    item4.executeCode = ^{
        PPHomePageController * vc = [[PPHomePageController alloc] init];
        [weakSelf.navigationController pushViewController:vc animated:YES];
    };
    item4.detailText = @"+-控件在X上有问题";
    item4.accessoryType = HgSettingAccessoryTypeDisclosureIndicator;
    
    //************************************section1
    HgBorrwwerBaseModel *item5 = [[HgBorrwwerBaseModel alloc]init];
    item5.funcName = @"SYYLLSwichViewController";
    item5.executeCode = ^{
        SYYLLSwichViewController * vc = [[SYYLLSwichViewController alloc] init];
        [weakSelf.navigationController pushViewController:vc animated:YES];
    };
    item5.detailText = @"LLSwich";
    item5.accessoryType = HgSettingAccessoryTypeDisclosureIndicator;
    
    //************************************section1
    HgBorrwwerBaseModel *item6 = [[HgBorrwwerBaseModel alloc]init];
    item6.funcName = @"SYYSecenSwitchViewController";
    item6.executeCode = ^{
        SYYSecenSwitchViewController * vc = [[SYYSecenSwitchViewController alloc] init];
        [weakSelf.navigationController pushViewController:vc animated:YES];
    };
    item6.detailText = @"SecenSwitch";
    item6.accessoryType = HgSettingAccessoryTypeDisclosureIndicator;
    
    HgBorrwwerSectionBaseModel *section1 = [[HgBorrwwerSectionBaseModel alloc]init];
    section1.sectionHeaderName =@"模块散件";
    section1.sectionHeaderHeight = 30;
    
    section1.itemArray = @[item1,item2,item4,item5,item6];
    
#pragma mark--------------section分节
    
    
    self.sectionArray = @[section1];
    
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

