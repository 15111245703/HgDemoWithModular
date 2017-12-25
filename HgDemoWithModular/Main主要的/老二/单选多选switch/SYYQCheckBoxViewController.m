//
//  SYYQCheckBoxViewController.m
//  HgDemoWithModular
//
//  Created by Syy on 2017/12/4.
//  Copyright © 2017年 RicardoM Lu. All rights reserved.
//

#import "SYYQCheckBoxViewController.h"
#import "QCheckBox.h"
@interface SYYQCheckBoxViewController ()<QCheckBoxDelegate>

@end

@implementation SYYQCheckBoxViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    // Do any additional setup after loading the view, typically from a nib.
    
    QCheckBox *_check1 = [[QCheckBox alloc] initWithDelegate:self groupId:@"g1" count:100];
    _check1.frame = CGRectMake(20, 120, 80, 40);
    [_check1 setTitle:@"苹果" forState:UIControlStateNormal];
    [_check1 setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
    [_check1.titleLabel setFont:[UIFont boldSystemFontOfSize:13.0f]];
    [self.view addSubview:_check1];
    [_check1 setChecked:YES];

    
    QCheckBox *_check2 = [[QCheckBox alloc] initWithDelegate:self groupId:@"g1" count:100];;
    _check2.frame = CGRectMake(20, 170, 80, 40);
    [_check2 setTitle:@"梨子" forState:UIControlStateNormal];
    [_check2 setTitleColor:[UIColor darkGrayColor] forState:UIControlStateNormal];
    [_check2.titleLabel setFont:[UIFont boldSystemFontOfSize:13.0f]];
    [self.view addSubview:_check2];

    
    QCheckBox *_check3 = [[QCheckBox alloc] initWithDelegate:self groupId:@"g1" count:100];
    _check3.frame = CGRectMake(20, 220, 80, 40);
    [_check3 setTitle:@"Apple" forState:UIControlStateNormal];
    [_check3 setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [_check3 setTitleColor:[UIColor greenColor] forState:UIControlStateHighlighted];
    [_check3 setTitleColor:[UIColor blueColor] forState:UIControlStateSelected];
    [_check3.titleLabel setFont:[UIFont boldSystemFontOfSize:13.0f]];
    [_check3 setImage:[UIImage imageNamed:@"uncheck_icon.png"] forState:UIControlStateNormal];
    [_check3 setImage:[UIImage imageNamed:@"check_icon.png"] forState:UIControlStateSelected];
    [self.view addSubview:_check3];
    [_check3 setChecked:YES];

    
    QCheckBox *_check4 = [[QCheckBox alloc] initWithDelegate:self groupId:@"g1" count:100];
    _check4.frame = CGRectMake(20, 270, 80, 40);
    [_check4 setTitle:@"Banana" forState:UIControlStateNormal];
    [_check4 setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [_check4 setTitleColor:[UIColor greenColor] forState:UIControlStateHighlighted];
    [_check4 setTitleColor:[UIColor blueColor] forState:UIControlStateSelected];
    [_check4.titleLabel setFont:[UIFont boldSystemFontOfSize:13.0f]];
    [_check4 setImage:[UIImage imageNamed:@"uncheck_icon.png"] forState:UIControlStateNormal];
    [_check4 setImage:[UIImage imageNamed:@"check_icon.png"] forState:UIControlStateSelected];
    [self.view addSubview:_check4];
    [_check4 setChecked:NO];

}

#pragma mark - QCheckBoxDelegate

- (void)didSelectedCheckBox:(QCheckBox *)checkbox checked:(BOOL)checked {
    NSLog(@"did tap on CheckBox:%@ checked:%d", checkbox.titleLabel.text, checked);
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end

