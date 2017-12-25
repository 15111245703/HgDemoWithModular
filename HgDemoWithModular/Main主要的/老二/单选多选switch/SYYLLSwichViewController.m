//
//  SYYLLSwichViewController.m
//  HgDemoWithModular
//
//  Created by Syy on 2017/12/6.
//  Copyright © 2017年 RicardoM Lu. All rights reserved.
//

#import "SYYLLSwichViewController.h"
#import "LLSwitch.h"
@interface SYYLLSwichViewController ()<LLSwitchDelegate>

@end

@implementation SYYLLSwichViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    LLSwitch *llSwitch = [[LLSwitch alloc] initWithFrame:CGRectMake(200, 100, 120, 60)];
    [self.view addSubview:llSwitch];
    llSwitch.delegate = self;
    [llSwitch setOn:YES animated:YES];
}

-(void)didTapLLSwitch:(LLSwitch *)llSwitch {
    NSLog(@"start");
}

- (void)animationDidStopForLLSwitch:(LLSwitch *)llSwitch {
    NSLog(@"stop");
}

- (void)valueDidChanged:(LLSwitch *)llSwitch on:(BOOL)on {
    NSLog(@"stop --- on:%hhd", on);
}

@end
