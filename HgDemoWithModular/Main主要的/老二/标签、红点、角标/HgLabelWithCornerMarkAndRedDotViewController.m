//
//  HgLabelWithCornerMarkAndRedDotViewController.m
//  HgDemoWithModular
//
//  Created by RicardoM Lu on 2017/11/28.
//  Copyright © 2017年 RicardoM Lu. All rights reserved.
//

#import "HgLabelWithCornerMarkAndRedDotViewController.h"
#import "HXViewController.h"
#import "HXTagsCell.h"
#import "HXTagCollectionViewFlowLayout.h"
#import "TestTableViewCell.h"
#import "HgDrawALittleRedDotTableViewCell.h"
@interface HgLabelWithCornerMarkAndRedDotViewController ()<UITableViewDelegate,UITableViewDataSource>
//标签
@property (nonatomic,strong) HXTagCollectionViewFlowLayout *layout;//布局layout
@property (nonatomic,strong) NSArray *selectTags;
@property (nonatomic,strong)UITableView *hgTableView;
//红点

//角标
@end

@implementation HgLabelWithCornerMarkAndRedDotViewController

- (UITableView *)hgTableView
{
    if (nil == _hgTableView) {
        _hgTableView = [[UITableView alloc]initWithFrame:self.view.bounds style:UITableViewStylePlain];
        _hgTableView.autoresizingMask = UIViewAutoresizingFlexibleHeight | UIViewAutoresizingFlexibleWidth;
        _hgTableView.separatorStyle = UITableViewCellSeparatorStyleSingleLine;
        _hgTableView.contentInset = UIEdgeInsetsMake(self.navigationOrginalHeight, 0, IPHONE_TABBARHEIGHT, 0);
        _hgTableView.dataSource = self ;
        _hgTableView.delegate = self ;
        if (@available(iOS 11.0, *)) {
            _hgTableView.estimatedRowHeight = 0;
            _hgTableView.estimatedSectionHeaderHeight = 0;
            _hgTableView.estimatedSectionFooterHeight = 0;
            _hgTableView.contentInsetAdjustmentBehavior = UIScrollViewContentInsetAdjustmentNever;
        }
    }
    return _hgTableView ;
}
- (HXTagCollectionViewFlowLayout *)layout {
    if (!_layout) {
        _layout = [HXTagCollectionViewFlowLayout new];
        _layout.scrollDirection = UICollectionViewScrollDirectionVertical;
    }
    return _layout;
}

- (NSArray *)tags {
    return @[@"查看关于标签详情",@"问游戏道",@"天游戏龙游戏八游戏部",@"枪神纪游戏",@"英魂之游戏刃",@"勇者游戏大冒险",@"nba 游戏2k",@"上古世纪游戏",@"游戏跑跑卡游戏丁车",@"传奇世界游戏",@"劲舞游戏团",@"激游戏战2",@"蜀山ol",@"天下3",@"大话西游2",@"热血江湖",@"游戏人生",@"梦三国",@"流星蝴蝶剑",@"九阴真经",@"斗战神",@"奇迹mu",@"最终幻想14",@"宠物小精灵"];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.navigationView setTitle:@"标签、红点、角标"];
    self.hgTableView.tableFooterView = [UIView new];
    self.automaticallyAdjustsScrollViewInsets = NO ;
    [self.hgTableView registerClass:HXTagsCell.class forCellReuseIdentifier:@"cellId"];
    [self.view addSubview:self.hgTableView];
}

#pragma mark UITableViewDataSource/UITableViewDelegate
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 3;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    if (section==0) {
        return 1;
    }else if(section==1){
        return 2;
    }else{
        return 1;
    }
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    if(indexPath.section==0){
        HXTagsCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cellId"];
        if (!cell) {
            cell = [[HXTagsCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cellId"];
        }
        
        cell.tags = self.tags;
        cell.selectedTags = [NSMutableArray arrayWithArray:_selectTags];
        cell.layout = self.layout;
        cell.completion = ^(NSArray *selectTags,NSInteger currentIndex) {
            NSLog(@"selectTags:%@ currentIndex:%ld",selectTags, (long)currentIndex);
            _selectTags = selectTags;
            if (currentIndex ==0) {
                HXViewController* vc = [[HXViewController alloc] init];
                [self.navigationController pushViewController:vc animated:YES];
                
            }
        };
        [cell reloadData];
        
        return cell;

    }
    else if (indexPath.section==1) {
        TestTableViewCell * cell = (TestTableViewCell*) GetCell(@"TestTableViewCell", tableView, @"TestTableViewCell");
        cell.textLabel.text = [NSString stringWithFormat:@"测试%ld", (long)[indexPath row]];
        NSString * tags = @"9999";
        if ([tags integerValue]>=99) {
            cell.contentLabel.text = @"99+";
        }

        return cell;
    }else{
        HgDrawALittleRedDotTableViewCell * cell = (HgDrawALittleRedDotTableViewCell*) GetCell(@"HgDrawALittleRedDotTableViewCell", tableView, @"HgDrawALittleRedDotTableViewCell");
        cell.textLabel.text =@"该红点由贝塞尔曲线绘制而成";
        return cell;


    }
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    if(indexPath.section==0){
        float height = [HXTagsCell getCellHeightWithTags:self.tags layout:self.layout tagAttribute:nil width:tableView.frame.size.width];
        return height;
    }else if(indexPath.section==1){
        return 60;
    }else{
        return 60;
    }
}
//节头标题
-(NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section{
    if (section==0) {
        return @"标签";
    }else if(section==1){
        return @"拖动角标爆炸效果消失";
    }else{
        return @"小红点";
    }
}
//节头高度
- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return HgHeightForHeaderInSection;
}

@end
