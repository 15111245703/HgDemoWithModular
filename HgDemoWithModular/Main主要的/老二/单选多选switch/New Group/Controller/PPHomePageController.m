//
//  PPHomePageController.m
//  PPNumberButton
//
//  Created by YiAi on 2017/7/5.
//  Copyright © 2017年 AndyPang. All rights reserved.
//

#import "PPHomePageController.h"
#import "SYYPP1ViewController.h"
#import "PPViewController2.h"

@interface PPHomePageController ()

@end

@implementation PPHomePageController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.navigationView setTitle:@"+-]"];
    [self setupSections];
}
     - (void)setupSections
    {
        WS(weakSelf);
        //************************************section1
        HgBorrwwerBaseModel *item1 = [[HgBorrwwerBaseModel alloc]init];
        item1.funcName = @"SYYPP1ViewController";
        item1.executeCode = ^{
            SYYPP1ViewController * vc = [[SYYPP1ViewController alloc] init];
            [weakSelf.navigationController pushViewController:vc animated:YES];
        };
        item1.detailText = @"普通view形式";
        item1.accessoryType = HgSettingAccessoryTypeDisclosureIndicator;
        
        HgBorrwwerBaseModel *item2 = [[HgBorrwwerBaseModel alloc]init];
        item2.funcName = @"PPViewController2";
        item2.executeCode = ^{
            
            PPViewController2 * vc = [[PPViewController2 alloc] init];
            [weakSelf.navigationController pushViewController:vc animated:YES];
            
        };
        item2.detailText = @"列表形式 - table style";
        item2.accessoryType = HgSettingAccessoryTypeDisclosureIndicator;
        //    item2.redDotStr =@"yes";
        //************************************section1
      
        
        HgBorrwwerSectionBaseModel *section1 = [[HgBorrwwerSectionBaseModel alloc]init];
        section1.sectionHeaderName =@"模块散件";
        section1.sectionHeaderHeight = 30;
        
        section1.itemArray = @[item1,item2];
        
#pragma mark--------------section分节
        
        
        self.sectionArray = @[section1];
        
    }

@end
