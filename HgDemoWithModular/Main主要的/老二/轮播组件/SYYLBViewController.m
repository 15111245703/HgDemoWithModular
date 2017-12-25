//
//  SYYLBViewController.m
//  HgDemoWithModular
//
//  Created by Syy on 2017/12/15.
//  Copyright © 2017年 RicardoM Lu. All rights reserved.
//https://github.com/cheenbee/TCRotatorImageView

#import "SYYLBViewController.h"
#import "SYYCDDViewController.h"
#import "SYYTCViewController.h"
@interface SYYLBViewController ()

@end

@implementation SYYLBViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self.navigationView setTitle:@"轮播"];
    [self setupSections];
}
- (void)setupSections
{
    WS(weakSelf);
    //************************************section1
    HgBorrwwerBaseModel *item1 = [[HgBorrwwerBaseModel alloc]init];
    item1.funcName = @"CDDTitle";
    item1.executeCode = ^{
        SYYCDDViewController * vc = [[SYYCDDViewController alloc] init];
        [weakSelf.navigationController pushViewController:vc animated:YES];
    };
    item1.detailText = @"广告";
    item1.accessoryType = HgSettingAccessoryTypeDisclosureIndicator;
    
    HgBorrwwerBaseModel *item2 = [[HgBorrwwerBaseModel alloc]init];
    item2.funcName = @"TCRotatorImage";
    item2.executeCode = ^{
        SYYTCViewController* vc = [[SYYTCViewController alloc] init];
        [weakSelf.navigationController pushViewController:vc animated:YES];

        
    };
    item2.detailText = @"";
    item2.accessoryType = HgSettingAccessoryTypeDisclosureIndicator;
    //    item2.redDotStr =@"yes";
    

    
    HgBorrwwerSectionBaseModel *section1 = [[HgBorrwwerSectionBaseModel alloc]init];
    section1.sectionHeaderName =@"模块散件";
    section1.sectionHeaderHeight = 30;
    
    section1.itemArray = @[item1,item2];
    
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

