//
//  SYYRFViewController.m
//  HgDemoWithModular
//
//  Created by Syy on 2017/11/30.
//  Copyright © 2017年 RicardoM Lu. All rights reserved.
//

#import "SYYRFViewController.h"
#import "RFSegmentView.h"

#define kScreenWidth [UIScreen mainScreen].bounds.size.width
#define kScreenHeight [UIScreen mainScreen].bounds.size.height
@interface SYYRFViewController ()<RFSegmentViewDelegate>

@end

@implementation SYYRFViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    float init_y = 0;
    for (int i=0; i<10; i++) {
        RFSegmentView* segmentView = [[RFSegmentView alloc] initWithFrame:CGRectMake(0, 84+init_y, kScreenWidth, 60) items:@[@"spring",@"summer",@"autumn",@"winnter"]];
        segmentView.tintColor = [self getRandomColor];
        segmentView.delegate = self;
        [self.view addSubview:segmentView];
        init_y +=60;
    }
    
    
    
    // Do any additional setup after loading the view.
}

- (UIColor *)getRandomColor
{
    UIColor *color = [UIColor colorWithRed:arc4random()%255/255.0 green:arc4random()%255/255.0 blue:arc4random()%255/255.0 alpha:1];
    return color;
}

- (void)segmentViewSelectIndex:(NSInteger)index
{
    NSLog(@"current index is %ld",(long)index);
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
 #pragma mark - Navigation
 
 // In a storyboard-based application, you will often want to do a little preparation before navigation
 - (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
 {
 // Get the new view controller using [segue destinationViewController].
 // Pass the selected object to the new view controller.
 }
 */

@end

// 版权属于原作者
// http://code4app.com (cn) http://code4app.net (en)
// 发布代码于最专业的源码分享网站: Code4App.com

