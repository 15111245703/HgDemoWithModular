//
//  SYYFTPopViewController.m
//  HgDemoWithModular
//
//  Created by Syy on 2017/12/14.
//  Copyright © 2017年 RicardoM Lu. All rights reserved.
//

#import "SYYFTPopViewController.h"
#import "FTPopOverMenu.h"
@interface SYYFTPopViewController (){
    UIButton *btn;
}
@property(nonatomic,retain)UIButton *btn;
@end

@implementation SYYFTPopViewController
@synthesize btn;
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    //初始化按钮，设置按钮类型
       self.btn = [UIButton buttonWithType:UIButtonTypeSystem];
     /*
            17      Type:
            18      UIButtonTypeCustom = 0, // 自定义类型
            19      UIButtonTypeSystem NS_ENUM_AVAILABLE_IOS(7_0),  // 系统类型
            20      UIButtonTypeDetailDisclosure,//详细描述样式，圆圈中间加个i
            21      UIButtonTypeInfoLight, //浅色的详细描述样式
            22      UIButtonTypeInfoDark,//深色的详细描述样式
            23      UIButtonTypeContactAdd,//加号样式
            24      UIButtonTypeRoundedRect = UIButtonTypeSystem,   // 圆角矩形
            25      */
   
     //设置按钮位置和尺寸
      self.btn.frame = CGRectMake(50, 150, 300, 50);

   //设置按钮文字标题
     [self.btn setTitle:@"我是一个按钮" forState:UIControlStateNormal];
    /*
            33      State:前三个较为常用
            34      UIControlStateNormal //正常状态下
            35      UIControlStateHighlighted //高亮状态下，按钮按下还未抬起的时候
            36      UIControlStateDisabled  //按钮禁用状态下，不能使用
            37      UIControlStateSelected  //选中状态下
            38      UIControlStateApplication //当应用程序标志时
            39      UIControlStateReserved  //为内部框架预留
            40      */

       //按钮响应点击事件，最常用的方法：第一个参数是目标对象，一般都是self； 第二个参数是一个SEL类型的方法；第三个参数是按钮点击事件
    [self.btn addTarget:self action:@selector(Method:) forControlEvents:UIControlEventTouchUpInside];

    //将控件添加到当前视图上
    [self.view addSubview:self.btn];
}

-(void)Method:(UIButton *)sender{
    NSString *icomImageURLString = @"https://avatars1.githubusercontent.com/u/4414522?v=3&s=40";
    
    NSURL *icomImageURL = [NSURL URLWithString:icomImageURLString];
    
    [FTPopOverMenu showForSender:sender
                   withMenuArray:@[@"MenuOne", @"MenuTwo", @"MenuThree", @"MenuFour",]
                           imageArray:@[icomImageURLString, icomImageURL, [UIImage imageNamed:@"Pokemon_Go_03"], @"Pokemon_Go_04"]
                       doneBlock:^(NSInteger selectedIndex) {
                           
                           NSLog(@"done block. do something. selectedIndex : %ld", (long)selectedIndex);
                           
                       } dismissBlock:^{
                           
                           NSLog(@"user canceled. do nothing.");
                           
                           //                           FTPopOverMenuConfiguration *configuration = [FTPopOverMenuConfiguration defaultConfiguration];
                           //                           configuration.allowRoundedArrow = !configuration.allowRoundedArrow;
                           
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
