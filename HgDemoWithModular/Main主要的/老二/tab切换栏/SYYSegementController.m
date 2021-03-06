//
//  SYYSegementController.m
//  HgDemoWithModular
//
//  Created by Syy on 2017/12/1.
//  Copyright © 2017年 RicardoM Lu. All rights reserved.
//

#import "SYYSegementController.h"
#import "FirstController.h"
#import "SecondController.h"
#import "ThirdController.h"
#import "MainView.h"
@interface SYYSegementController ()<UIScrollViewDelegate>
@property (nonatomic,retain) NSArray               *viewControllers;
@end
@implementation SYYSegementController

- (void)viewDidLoad {
    self.title = @"不知道1";
    [super viewDidLoad];
    //    self.automaticallyAdjustsScrollViewInsets = NO;
    self.view.backgroundColor = [UIColor clearColor];
    [self createVc];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    
}

- (void)createVc {
    FirstController   *firstVc  = [[FirstController alloc] init];
    SecondController  *secondVc = [[SecondController alloc] init];
    ThirdController   *ThirdVc  = [[ThirdController alloc] init];
    [self addChildViewController:firstVc];
    [self addChildViewController:secondVc];
    [self addChildViewController:ThirdVc];
    self.viewControllers        = [NSArray arrayWithObjects:firstVc,secondVc,ThirdVc,nil];
    
    MainView *main = [[MainView alloc] init];
    [self.view addSubview:main];
    main.frame = CGRectMake(0, STATUSBAR_HEIGHT+kNavNormalHeight,self.view.frame.size.width, self.view.frame.size.height-64);
    //设置菜单view 的高度
    main.btnViewHeight = 40;
    //设置按钮下划线高度
    main.btnLineHeight = 2;
    //设置按钮字体大小
    main.btnFont       = 17;
    main.viewControllers = self.viewControllers;
    NSArray *array  = @[@"第一页",@"第二页",@"第三页"];
    main.titleArray = array;
}




@end

