//
//  SYYPP1ViewController.m
//  HgDemoWithModular
//
//  Created by Syy on 2017/12/4.
//  Copyright © 2017年 RicardoM Lu. All rights reserved.
//  控件现在版本，不支持长按，要开启 numberButton.longPressSpaceTime = CGFLOAT_MAX; 不然会自动点；

#import "SYYPP1ViewController.h"
#import "PPNumberButton.h"
@interface SYYPP1ViewController ()<PPNumberButtonDelegate>

@end

@implementation SYYPP1ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor whiteColor];
    [self example1];
    [self example2];
    [self example3];
    [self example4];
}


/**
 自定义加减按钮文字标题
 */
- (void)example1
{
    PPNumberButton *numberButton = [PPNumberButton numberButtonWithFrame:CGRectMake(100, 100, 110, 30)];
    // 开启抖动动画
    numberButton.shakeAnimation = YES;
    // 设置最小值
    numberButton.minValue = 2;
    // 设置最大值
    numberButton.maxValue = 10;
    // 设置输入框中的字体大小
    numberButton.inputFieldFont = 23;
    numberButton.increaseTitle = @"＋";
    numberButton.decreaseTitle = @"－";
    numberButton.currentNumber = 7;
    numberButton.delegate = self;
    numberButton.longPressSpaceTime = CGFLOAT_MAX;//
    
    numberButton.resultBlock = ^(NSInteger num ,BOOL increaseStatus){
        NSLog(@"%ld",num);
    };
    [self.view addSubview:numberButton];
}

#pragma mark===PPNumberButtonDelegate
- (void)pp_numberButton:(__kindof UIView *)numberButton number:(NSInteger)number increaseStatus:(BOOL)increaseStatus
{
    NSLog(@"%@",increaseStatus ? @"加运算":@"减运算");
}


/**
 边框状态
 */
- (void)example2
{
    PPNumberButton *numberButton = [PPNumberButton numberButtonWithFrame:CGRectMake(100, 160, 150, 30)];
    //设置边框颜色
    numberButton.borderColor = [UIColor grayColor];
    numberButton.increaseTitle = @"＋";
    numberButton.decreaseTitle = @"－";
    numberButton.currentNumber = 777;
    numberButton.delegate = self;
//    numberButton.longPressSpaceTime = CGFLOAT_MAX;
    numberButton.resultBlock = ^(NSInteger num ,BOOL increaseStatus){
        NSLog(@"%ld",num);
    };
    
    [self.view addSubview:numberButton];
}

/**
 自定义加减按钮背景图片
 */
- (void)example3
{
    PPNumberButton *numberButton = [PPNumberButton numberButtonWithFrame:CGRectMake(100, 220, 100, 30)];
    numberButton.shakeAnimation = YES;
    numberButton.increaseImage = [UIImage imageNamed:@"increase_taobao"];
    numberButton.decreaseImage = [UIImage imageNamed:@"decrease_taobao"];
   numberButton.longPressSpaceTime = CGFLOAT_MAX;
    numberButton.resultBlock = ^(NSInteger num ,BOOL increaseStatus){
        NSLog(@"%ld",num);
    };
    
    [self.view addSubview:numberButton];
}

/**
 饿了么,美团外卖,百度外卖样式
 */
- (void)example4
{
    PPNumberButton *numberButton = [PPNumberButton numberButtonWithFrame:CGRectMake(100, 280, 100, 30)];
    // 初始化时隐藏减按钮
    numberButton.decreaseHide = YES;
    numberButton.increaseImage = [UIImage imageNamed:@"increase_meituan"];
    numberButton.decreaseImage = [UIImage imageNamed:@"decrease_meituan"];
    numberButton.currentNumber = -777;
     numberButton.longPressSpaceTime = CGFLOAT_MAX;
    numberButton.resultBlock = ^(NSInteger num ,BOOL increaseStatus){
        NSLog(@"%ld",num);
    };
    
    [self.view addSubview:numberButton];
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
