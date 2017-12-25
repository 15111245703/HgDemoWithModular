//
//  HgTwoViewController.m
//  HgDemoWithModular
//
//  Created by RicardoM Lu on 2017/11/22.
//  Copyright © 2017年 RicardoM Lu. All rights reserved.
//

#import "HgTwoViewController.h"
#import "HgTextFrameViewController.h"
#import "HgButtonFrameViewController.h"
#import "HgLabelWithCornerMarkAndRedDotViewController.h"
#import "HgBaseCustomObj.h"
#import "HgTipsForViewController.h"
#import "SYYNavgationViewController.h"
#import "HgFoldViewController.h"
#import "SYYSegmentViewController.h"
#import "SYYSegementController.h"
#import "SYYSwitchsViewController.h"
#import "SYYCXSliderViewController.h"
#import "SYYTimelLineViewController.h"
#import "SYYFTPopViewController.h"
#import "SYYACAlertViewController.h"
#import "SYYIFMShareViewController.h"
#import "SYYTSMenulabelViewController.h"
#import "SYYLBViewController.h"
@interface HgTwoViewController ()

@end

@implementation HgTwoViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.navigationView setTitle:@"模块化"];
    [self setupSections];

    // Do any additional setup after loading the view.
}
- (void)setupSections
{
    WS(weakSelf);
    //************************************section1
    HgBorrwwerBaseModel *item1 = [[HgBorrwwerBaseModel alloc]init];
    item1.funcName = @"文本";
    item1.executeCode = ^{
        HgTextFrameViewController * vc = [[HgTextFrameViewController alloc] init];
        [weakSelf.navigationController pushViewController:vc animated:YES];
    };
    item1.detailText = @"关于文本规范";
    item1.accessoryType = HgSettingAccessoryTypeDisclosureIndicator;

    HgBorrwwerBaseModel *item2 = [[HgBorrwwerBaseModel alloc]init];
    item2.funcName = @"按钮";
    item2.executeCode = ^{

        HgButtonFrameViewController * vc = [[HgButtonFrameViewController alloc] init];
        [weakSelf.navigationController pushViewController:vc animated:YES];

    };
    item2.detailText = @"常用按钮样式";
    item2.accessoryType = HgSettingAccessoryTypeDisclosureIndicator;
    item2.redDotStr =@"yes";

    
    HgBorrwwerBaseModel *item3 = [[HgBorrwwerBaseModel alloc]init];
    item3.funcName = @"标签、角标、红点";
    item3.executeCode = ^{
        HgLabelWithCornerMarkAndRedDotViewController * vc = [[HgLabelWithCornerMarkAndRedDotViewController alloc] init];
        [weakSelf.navigationController pushViewController:vc animated:YES];
    };
    item3.detailText = @"标签、角标、红点样式";
    item3.accessoryType = HgSettingAccessoryTypeDisclosureIndicator;

    HgBorrwwerBaseModel *item4 = [[HgBorrwwerBaseModel alloc]init];
    item4.funcName = @"顶部导航栏";
    item4.executeCode = ^{
        SYYNavgationViewController * vc = [[SYYNavgationViewController alloc] init];
        [weakSelf.navigationController pushViewController:vc animated:YES];
    };
    item4.detailText = @"手势滑动有bug";
    item4.accessoryType = HgSettingAccessoryTypeDisclosureIndicator;

    HgBorrwwerBaseModel *item5 = [[HgBorrwwerBaseModel alloc]init];
    item5.funcName = @"按钮组工具栏";
    item5.executeCode = ^{
        SYYSegmentViewController * vc = [[SYYSegmentViewController alloc] init];
        [weakSelf.navigationController pushViewController:vc animated:YES];
    };
    item5.detailText = @"segments";
    item5.accessoryType = HgSettingAccessoryTypeDisclosureIndicator;
    
    HgBorrwwerBaseModel *item6 = [[HgBorrwwerBaseModel alloc]init];
    item6.funcName = @"底部工具栏";
    item6.executeCode = ^{
        NSLog(@"点击事件");
    };
    item6.detailText = @"tabbar";
    item6.accessoryType = HgSettingAccessoryTypeDisclosureIndicator;
    
    HgBorrwwerBaseModel *item7 = [[HgBorrwwerBaseModel alloc]init];
    item7.funcName = @"底部工具栏扩展";
    item7.executeCode = ^{
        NSLog(@"点击事件");
    };
    item7.detailText = @"tabbar";
    item7.accessoryType = HgSettingAccessoryTypeDisclosureIndicator;

    HgBorrwwerBaseModel *item8 = [[HgBorrwwerBaseModel alloc]init];
    item8.funcName = @"tab切换栏";
    item8.executeCode = ^{
        SYYSegementController * vc = [[SYYSegementController alloc] init];
        [weakSelf.navigationController pushViewController:vc animated:YES];
    };
    item8.detailText = @"手势滑动有bug";
    item8.accessoryType = HgSettingAccessoryTypeDisclosureIndicator;

    HgBorrwwerBaseModel *item9 = [[HgBorrwwerBaseModel alloc]init];
    item9.funcName = @"信息条";
    item9.executeCode = ^{
        NSLog(@"点击事件");
        HgTipsForViewController * vc = [[HgTipsForViewController alloc] init];
        [weakSelf.navigationController pushViewController:vc animated:YES];

    };
    item9.detailText = @"";
    item9.accessoryType = HgSettingAccessoryTypeDisclosureIndicator;
    
    HgBorrwwerBaseModel *item10 = [[HgBorrwwerBaseModel alloc]init];
    item10.funcName = @"单选、多选、Switch";
    item10.executeCode = ^{
        NSLog(@"点击事件");
        
        SYYSwitchsViewController * vc = [[SYYSwitchsViewController alloc] init];
        [weakSelf.navigationController pushViewController:vc animated:YES];
    };
    item10.detailText = @"单选、多选、Switch";
    item10.accessoryType = HgSettingAccessoryTypeDisclosureIndicator;
    
    HgBorrwwerBaseModel *item11 = [[HgBorrwwerBaseModel alloc]init];
    item11.funcName = @"滑块";
    item11.executeCode = ^{
        NSLog(@"点击事件");
        SYYCXSliderViewController * vc = [[SYYCXSliderViewController alloc] init];
        [weakSelf.navigationController pushViewController:vc animated:YES];
    };
    item11.detailText = @"滑块";
    item11.accessoryType = HgSettingAccessoryTypeDisclosureIndicator;

    HgBorrwwerBaseModel *item12 = [[HgBorrwwerBaseModel alloc]init];
    item12.funcName = @"列表";
    item12.executeCode = ^{
        NSLog(@"点击事件");
    };
    item12.detailText = @"";
    item12.accessoryType = HgSettingAccessoryTypeDisclosureIndicator;
    
    HgBorrwwerBaseModel *item13 = [[HgBorrwwerBaseModel alloc]init];
    item13.funcName = @"卡片列表";
    item13.executeCode = ^{
        NSLog(@"点击事件");
    };
    item13.detailText = @"";
    item13.accessoryType = HgSettingAccessoryTypeDisclosureIndicator;

    HgBorrwwerBaseModel *item14 = [[HgBorrwwerBaseModel alloc]init];
    item14.funcName = @"表单";
    item14.executeCode = ^{
        NSLog(@"点击事件");
    };
    item14.detailText = @"";
    item14.accessoryType = HgSettingAccessoryTypeDisclosureIndicator;

    HgBorrwwerBaseModel *item15 = [[HgBorrwwerBaseModel alloc]init];
    item15.funcName = @"时间轴";
    item15.executeCode = ^{
        NSLog(@"点击事件");
        SYYTimelLineViewController * vc = [[SYYTimelLineViewController alloc] init];
        [weakSelf.navigationController pushViewController:vc animated:YES];
    };
    item15.detailText = @"SYYTimelLineViewController";
    item15.accessoryType = HgSettingAccessoryTypeDisclosureIndicator;
    
    HgBorrwwerBaseModel *item16 = [[HgBorrwwerBaseModel alloc]init];
    item16.funcName = @"弹出菜单";
    item16.executeCode = ^{
        NSLog(@"点击事件");
        
        SYYFTPopViewController * vc = [[SYYFTPopViewController alloc] init];
        [weakSelf.navigationController pushViewController:vc animated:YES];
    };
    item16.detailText = @"SYYFTPopViewController";
    item16.accessoryType = HgSettingAccessoryTypeDisclosureIndicator;

    HgBorrwwerBaseModel *item17 = [[HgBorrwwerBaseModel alloc]init];
    item17.funcName = @"底部弹出框";
    item17.executeCode = ^{
        NSLog(@"点击事件");
        SYYACAlertViewController * vc = [[SYYACAlertViewController alloc] init];
        [weakSelf.navigationController pushViewController:vc animated:YES];
    };
    item17.detailText = @"SYYACAlertViewController";
    item17.accessoryType = HgSettingAccessoryTypeDisclosureIndicator;

    HgBorrwwerBaseModel *item18 = [[HgBorrwwerBaseModel alloc]init];
    item18.funcName = @"底部分享盒子";
    item18.executeCode = ^{
        NSLog(@"点击事件");
        SYYIFMShareViewController * vc = [[SYYIFMShareViewController alloc] init];
        [weakSelf.navigationController pushViewController:vc animated:YES];
    };
    item18.detailText = @"IFMShare";
    item18.accessoryType = HgSettingAccessoryTypeDisclosureIndicator;
    
    HgBorrwwerBaseModel *item18_1 = [[HgBorrwwerBaseModel alloc]init];
    item18_1.funcName = @"复制view";
    item18_1.executeCode = ^{
        NSLog(@"点击事件");
        SYYTSMenulabelViewController * vc = [[SYYTSMenulabelViewController alloc] init];
        [weakSelf.navigationController pushViewController:vc animated:YES];
    };
    item18_1.detailText = @"TSMneuLabel";
    item18_1.accessoryType = HgSettingAccessoryTypeDisclosureIndicator;

    HgBorrwwerBaseModel *item19 = [[HgBorrwwerBaseModel alloc]init];
    item19.funcName = @"折叠面板";
    item19.executeCode = ^{
        NSLog(@"点击事件");
        HgFoldViewController * vc = [[HgFoldViewController alloc] init];
        [weakSelf.navigationController pushViewController:vc animated:YES];
    };
    item19.detailText = @"";
    item19.accessoryType = HgSettingAccessoryTypeDisclosureIndicator;
    
    HgBorrwwerBaseModel *item20 = [[HgBorrwwerBaseModel alloc]init];
    item20.funcName = @"图片懒加载";
    item20.executeCode = ^{
        NSLog(@"点击事件");
    };
    item20.detailText = @"";
    item20.accessoryType = HgSettingAccessoryTypeDisclosureIndicator;
    
    
    HgBorrwwerBaseModel *item21 = [[HgBorrwwerBaseModel alloc]init];
    item21.funcName = @"进度条";
    item21.executeCode = ^{
        NSLog(@"点击事件");
    };
    item21.detailText = @"";
    item21.accessoryType = HgSettingAccessoryTypeDisclosureIndicator;
    
    
    HgBorrwwerBaseModel *item22 = [[HgBorrwwerBaseModel alloc]init];
    item22.funcName = @"搜索条";
    item22.executeCode = ^{
        NSLog(@"点击事件");
    };
    item22.detailText = @"";
    item22.accessoryType = HgSettingAccessoryTypeDisclosureIndicator;
    
    HgBorrwwerBaseModel *item23 = [[HgBorrwwerBaseModel alloc]init];
    item23.funcName = @"提示条";
    item23.executeCode = ^{
        NSLog(@"点击事件");
    };
    item23.detailText = @"";
    item23.accessoryType = HgSettingAccessoryTypeDisclosureIndicator;

    HgBorrwwerBaseModel *item24 = [[HgBorrwwerBaseModel alloc]init];
    item24.funcName = @"宫格布局";
    item24.executeCode = ^{
        NSLog(@"点击事件");
    };
    item24.detailText = @"";
    item24.accessoryType = HgSettingAccessoryTypeDisclosureIndicator;

    HgBorrwwerBaseModel *item25 = [[HgBorrwwerBaseModel alloc]init];
    item25.funcName = @"菊花提示框";
    item25.executeCode = ^{
        NSLog(@"点击事件");
    };
    item25.detailText = @"";
    item25.accessoryType = HgSettingAccessoryTypeDisclosureIndicator;
    
    HgBorrwwerBaseModel *item26 = [[HgBorrwwerBaseModel alloc]init];
    item26.funcName = @"聊天气泡";
    item26.executeCode = ^{
        NSLog(@"点击事件");
    };
    item26.detailText = @"";
    item26.accessoryType = HgSettingAccessoryTypeDisclosureIndicator;

    HgBorrwwerBaseModel *item27 = [[HgBorrwwerBaseModel alloc]init];
    item27.funcName = @"轮播组件";
    item27.executeCode = ^{
        NSLog(@"点击事件");
        SYYLBViewController * vc = [[SYYLBViewController alloc] init];
        [weakSelf.navigationController pushViewController:vc animated:YES];
    };
    item27.detailText = @"";
    item27.accessoryType = HgSettingAccessoryTypeDisclosureIndicator;

    HgBorrwwerBaseModel *item28 = [[HgBorrwwerBaseModel alloc]init];
    item28.funcName = @"常用图标";
    item28.executeCode = ^{
        NSLog(@"点击事件");
    };
    item28.detailText = @"";
    item28.accessoryType = HgSettingAccessoryTypeDisclosureIndicator;

    
    
    HgBorrwwerSectionBaseModel *section1 = [[HgBorrwwerSectionBaseModel alloc]init];
    section1.sectionHeaderName =@"模块散件";
    section1.sectionHeaderHeight = 30;

    section1.itemArray = @[item1,item2,item3,item4,item5,item6,item7,item8,item9,item10,item11,item12,item13,item14,item15,item16,item17,item18,item18_1,item19,item20,item21,item22,item23,item24,item25,item26,item27,item28];
    
#pragma mark--------------section分节
    
    HgBorrwwerBaseModel *demo1 = [[HgBorrwwerBaseModel alloc]init];
    demo1.funcName = @"微信";
    demo1.executeCode = ^{
        NSLog(@"点击事件");
    };
    demo1.detailText = @"";
    demo1.accessoryType = HgSettingAccessoryTypeDisclosureIndicator;
    
    HgBorrwwerBaseModel *demo2 = [[HgBorrwwerBaseModel alloc]init];
    demo2.funcName = @"朋友圈";
    demo2.executeCode = ^{
        NSLog(@"点击事件");
    };
    demo2.detailText = @"";
    demo2.accessoryType = HgSettingAccessoryTypeDisclosureIndicator;
    
    HgBorrwwerBaseModel *demo3 = [[HgBorrwwerBaseModel alloc]init];
    demo3.funcName = @"今日头条";
    demo3.executeCode = ^{
        NSLog(@"点击事件");
    };
    demo3.detailText = @"";
    demo3.accessoryType = HgSettingAccessoryTypeDisclosureIndicator;

    HgBorrwwerBaseModel *demo4 = [[HgBorrwwerBaseModel alloc]init];
    demo4.funcName = @"知乎首页";
    demo4.executeCode = ^{
        NSLog(@"点击事件");
    };
    demo4.detailText = @"";
    demo4.accessoryType = HgSettingAccessoryTypeDisclosureIndicator;

    HgBorrwwerBaseModel *demo5 = [[HgBorrwwerBaseModel alloc]init];
    demo5.funcName = @"某宝首页";
    demo5.executeCode = ^{
        NSLog(@"点击事件");
    };
    demo5.detailText = @"";
    demo5.accessoryType = HgSettingAccessoryTypeDisclosureIndicator;
    
    HgBorrwwerBaseModel *demo6 = [[HgBorrwwerBaseModel alloc]init];
    demo6.funcName = @"会员中心首页";
    demo6.executeCode = ^{
        NSLog(@"点击事件");
    };
    demo6.detailText = @"";
    demo6.accessoryType = HgSettingAccessoryTypeDisclosureIndicator;

    HgBorrwwerBaseModel *demo7 = [[HgBorrwwerBaseModel alloc]init];
    demo7.funcName = @"订单列表首页";
    demo7.executeCode = ^{
        NSLog(@"点击事件");
    };
    demo7.detailText = @"";
    demo7.accessoryType = HgSettingAccessoryTypeDisclosureIndicator;


    HgBorrwwerSectionBaseModel *section2 = [[HgBorrwwerSectionBaseModel alloc]init];
    section2.sectionHeaderName =@"小demo";
    section2.sectionHeaderHeight = 30;
    
    section2.itemArray =@[demo1,demo2,demo3,demo4,demo5,demo6,demo7];

    

    self.sectionArray = @[section1,section2];
    
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
