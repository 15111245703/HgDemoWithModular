//
//  HgWebViewController.m
//  HgDemoWithModular
//
//  Created by RicardoM Lu on 2017/12/7.
//  Copyright © 2017年 RicardoM Lu. All rights reserved.
//

#import "HgWebViewController.h"
#import "TGWebViewController.h"

@interface HgWebViewController ()

@end

@implementation HgWebViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    WS(weakSelf);
//    https://github.com/zhaoquntao/TGWebViewController
    [self.navigationView addRightButtonWithTitle:@"去web页面" clickCallBack:^(UIView *view) {
        TGWebViewController *web = [[TGWebViewController alloc] init];
        web.url = @"http://www.jianshu.com/u/9e396019b1ca";
        web.webTitle = @"web";
        web.progressColor = [UIColor blueColor];
        [weakSelf.navigationController pushViewController:web animated:YES];

    }];
    
    
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
