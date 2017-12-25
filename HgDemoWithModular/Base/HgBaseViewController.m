//
//  HgBaseViewController.m
//  HgDemo
//
//  Created by RicardoM Lu on 2017/2/28.
//  Copyright © 2017年 RicardoM Lu. All rights reserved.
//

#import "HgBaseViewController.h"

@interface HgBaseViewController ()
@end

@implementation HgBaseViewController
-(void)dealloc{
    //最后还设置回来,不要影响其他页面的效果
    [IQKeyboardManager sharedManager].enable = NO;
    hgLog(@"当前页面已经被销毁");
}


- (void)viewDidDisappear:(BOOL)animated{
    [super viewWillDisappear:animated];
    //取消所有的网络请求和HUD
    [BANetManager ba_cancelAllRequest];
    [SVProgressHUD dismiss];
    NSLog(@"%@",@"当前页面请求，已经强制终止");
}
//对象的视图即将加入窗口时调用
- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    //写入这个方法后,这个页面将没有这种效果
    [IQKeyboardManager sharedManager].enable = YES;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor= [UIColor whiteColor];
    self.disableSlidingBackGesture =YES;
    self.automaticallyAdjustsScrollViewInsets = NO ;
    
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
