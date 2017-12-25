//
//  YQYPiecewiseDemoVC.m
//  HgDemoWithModular
//
//  Created by Syy on 2017/11/29.
//  Copyright © 2017年 RicardoM Lu. All rights reserved.
//  问题：没有默认选中

#import "YQYPiecewiseDemoVC.h"
#import "YQYPiecewiseView.h"
@interface YQYPiecewiseDemoVC ()<YQYPiecewiseViewDelegate>

@end

@implementation YQYPiecewiseDemoVC

- (void)viewDidLoad {
    [super viewDidLoad];
    NSArray *arrar = [NSArray arrayWithObjects:@"标题一",@"标题二",@"标题三", nil];
    YQYPiecewiseView *piecew = [[YQYPiecewiseView alloc]initWithFrame:CGRectMake(10, 80, 300, 60)];
    piecew.backgroundColor = [UIColor yellowColor];
    piecew.type = PiecewiseInterfaceTypeBackgroundChange;
    piecew.tag = 21;
    piecew.textNormalColor = [UIColor greenColor];
    piecew.delegate = self;
    piecew.backgroundNormalColor = [UIColor grayColor];
    piecew.backgroundSeletedColor = [UIColor redColor];
    [piecew loadTitleArray:arrar];
    [self.view addSubview:piecew];
    
    YQYPiecewiseView *piecew2 = [[YQYPiecewiseView alloc]initWithFrame:CGRectMake(10, 240, 300, 50)];
    piecew2.backgroundColor = [UIColor yellowColor];
    piecew2.type = PiecewiseInterfaceTypeMobileLin;
    piecew2.tag = 22;
    piecew2.delegate = self;
    piecew2.textFont = [UIFont systemFontOfSize:14];
    piecew2.textNormalColor = [UIColor grayColor];
    piecew2.textSeletedColor = [UIColor  redColor];
    piecew2.linColor = [UIColor redColor];
    [piecew2 loadTitleArray:arrar];
    [self.view addSubview:piecew2];
    
    NSArray *normalImage = [NSArray arrayWithObjects:@"button_seleted",@"button_seleted",nil];
    NSArray *seletedImage = [NSArray arrayWithObjects:@"button_normal2",@"button_normal2", nil];
    YQYPiecewiseView *piecew3 = [[YQYPiecewiseView alloc]initWithFrame:CGRectMake(10, 340, 300, 60)];
    piecew3.type = PiecewiseInterfaceTypeCustomImage;
    piecew3.tag = 23;
    piecew3.delegate = self;
    [piecew3 loadNormalImage:normalImage seletedImage:seletedImage];
    [self.view addSubview:piecew3];
    
}

-(void)piecewiseView:(YQYPiecewiseView *)piecewiseView index:(NSInteger)index
{
    
    if (piecewiseView.tag == 21) {
        switch (index) {
            case 0:
            {
                NSLog(@"下划线类型，按钮1");
            }
                break;
            case 1:
            {
                NSLog(@"下划线类型，按钮2");
            }
                break;
            case 2:
            {
                NSLog(@"下划线类型，按钮3");
            }
                break;
                
            default:
                break;
        }
    }else if (piecewiseView.tag == 22){
        switch (index) {
            case 0:
            {
                NSLog(@"背景变换类型，按钮1");
            }
                break;
            case 1:
            {
                NSLog(@"背景变换类型，按钮2");
            }
                break;
            case 2:
            {
                NSLog(@"背景变换类型，按钮3");
            }
                break;
                
            default:
                break;
        }
        
        
    }else{
        
        switch (index) {
            case 0:
            {
                NSLog(@"自定义类型，按钮1");
            }
                break;
            case 1:
            {
                NSLog(@"自定义类型，按钮2");
            }
                break;
                
            default:
                break;
        }
        
    }
    
}

@end
// 版权属于原作者
// http://code4app.com (cn) http://code4app.net (en)
// 发布代码于最专业的源码分享网站: Code4App.com
