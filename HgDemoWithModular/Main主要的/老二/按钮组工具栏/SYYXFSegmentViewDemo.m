//
//  SYYXFSegmentViewDemo.m
//  HgDemoWithModular
//
//  Created by Syy on 2017/11/30.
//  Copyright © 2017年 RicardoM Lu. All rights reserved.
//

#import "SYYXFSegmentViewDemo.h"
#import "XFSegmentView.h"
@interface SYYXFSegmentViewDemo ()<XFSegmentViewDelegate>{
    UIImageView *imgView;
    NSArray *names;
    
}

@end

@implementation SYYXFSegmentViewDemo

- (void)viewDidLoad {
    [super viewDidLoad];
    names = @[@"1",@"2",@"3",@"4"];
    self.view.backgroundColor=ContentBackGroundColor;
    
    XFSegmentView *segView=[[XFSegmentView alloc]initWithFrame:Frame(0, STATUSBAR_HEIGHT+kNavNormalHeight, SCREEN_WIDTH, WH(40))];
    [self.view addSubview:segView];
    segView.delegate = self;
    segView.titles = @[@"阳叔子",@"姬如雪",@"女帝",@"岐王"];
    segView.titleFont = Font(16);
    
    imgView = [[UIImageView alloc]initWithFrame:Frame(0, STATUSBAR_HEIGHT+kNavNormalHeight+WH(40), SCREEN_WIDTH, WH(248))];
    imgView.image=ImageName(names[segView.selectIndex]);
    [self.view addSubview:imgView];
    
    
    
}


-(void)segmentView:(XFSegmentView *)segmentView didSelectIndex:(NSInteger)index{
    imgView.image=ImageName(names[index]);
}

@end
