//
//  SYYSegmentViewController.m
//  HgDemoWithModular
//
//  Created by Syy on 2017/11/29.
//  Copyright © 2017年 RicardoM Lu. All rights reserved.
//

#import "SYYSegmentViewController.h"
#import "YQYPiecewiseDemoVC.h"
#import "SYYYUSegmentViewController.h"
#import "SYYXFSegmentViewDemo.h"
#import "SYYRFViewController.h"
@interface SYYSegmentViewController ()

@end

@implementation SYYSegmentViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self.navigationView setTitle:@"按钮组工具栏"];
    [self setupSections];
}
- (void)setupSections
{
    WS(weakSelf);
    //************************************section1
    HgBorrwwerBaseModel *item1 = [[HgBorrwwerBaseModel alloc]init];
    item1.funcName = @"YQYPiecewise";
    item1.executeCode = ^{
        YQYPiecewiseDemoVC * vc = [[YQYPiecewiseDemoVC alloc] init];
        [weakSelf.navigationController pushViewController:vc animated:YES];
    };
    item1.detailText = @"没有设置默认选中";
    item1.accessoryType = HgSettingAccessoryTypeDisclosureIndicator;
    
    HgBorrwwerBaseModel *item2 = [[HgBorrwwerBaseModel alloc]init];
    item2.funcName = @"YUSegment";
    item2.executeCode = ^{
        
        SYYYUSegmentViewController * vc = [[SYYYUSegmentViewController alloc] init];
        [weakSelf.navigationController pushViewController:vc animated:YES];
        
    };
    item2.detailText = @"指示器指的不对";
    item2.accessoryType = HgSettingAccessoryTypeDisclosureIndicator;
//    item2.redDotStr =@"yes";
    //************************************section1
    HgBorrwwerBaseModel *item3 = [[HgBorrwwerBaseModel alloc]init];
    item3.funcName = @"XFSegmentView";
    item3.executeCode = ^{
        SYYXFSegmentViewDemo * vc = [[SYYXFSegmentViewDemo alloc] init];
        [weakSelf.navigationController pushViewController:vc animated:YES];
    };
    item3.detailText = @"没有设置默认选中";
    item3.accessoryType = HgSettingAccessoryTypeDisclosureIndicator;
    //************************************section1
    HgBorrwwerBaseModel *item4 = [[HgBorrwwerBaseModel alloc]init];
    item4.funcName = @"SYYRFViewController";
    item4.executeCode = ^{
        SYYRFViewController * vc = [[SYYRFViewController alloc] init];
        [weakSelf.navigationController pushViewController:vc animated:YES];
    };
    item4.detailText = @"没有设置默认选中";
    item4.accessoryType = HgSettingAccessoryTypeDisclosureIndicator;
    
    
    HgBorrwwerSectionBaseModel *section1 = [[HgBorrwwerSectionBaseModel alloc]init];
    section1.sectionHeaderName =@"模块散件";
    section1.sectionHeaderHeight = 30;
    
    section1.itemArray = @[item1,item2,item3,item4];
    
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
