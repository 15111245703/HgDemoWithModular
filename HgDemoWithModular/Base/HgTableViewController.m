//
//  HgTableViewController.m
//  HgDemoWithModular
//
//  Created by RicardoM Lu on 2017/11/24.
//  Copyright © 2017年 RicardoM Lu. All rights reserved.
//

#import "HgTableViewController.h"

@interface HgTableViewController ()<UITableViewDelegate,UITableViewDataSource>

@end

@implementation HgTableViewController
#pragma mark - getter/setter
- (UITableView *)tableView
{
    if (nil == _tableView) {
        _tableView = [[UITableView alloc]initWithFrame:self.view.bounds style:UITableViewStylePlain];
        _tableView.autoresizingMask = UIViewAutoresizingFlexibleHeight | UIViewAutoresizingFlexibleWidth;
        _tableView.separatorStyle = UITableViewCellSeparatorStyleSingleLine;
        _tableView.contentInset = UIEdgeInsetsMake(self.navigationOrginalHeight, 0, IPHONE_TABBARHEIGHT, 0);
        _tableView.dataSource = self ;
        _tableView.delegate = self ;
        if (@available(iOS 11.0, *)) {
            _tableView.estimatedRowHeight = 0;
            _tableView.estimatedSectionHeaderHeight = 0;
            _tableView.estimatedSectionFooterHeight = 0;
            _tableView.contentInsetAdjustmentBehavior = UIScrollViewContentInsetAdjustmentNever;
        }
    }
    return _tableView ;
}

- (void)viewDidLoad {
    [super viewDidLoad];

    [self.view addSubview:self.tableView];
    self.disableSlidingBackGesture =YES;

    self.view.backgroundColor = [UIColor whiteColor];
    self.tableView.backgroundColor = [UIColor whiteColor];
    //这个地方设置tableFooterView是用来去除多余的列表的线
    self.tableView.tableFooterView =[UIView new];

}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    
    return self.sectionArray.count;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    HgBorrwwerSectionBaseModel *sectionModel = self.sectionArray[section];
    return sectionModel.itemArray.count;
    
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *identifier = @"setting";
    HgBorrwwerSectionBaseModel *sectionModel = self.sectionArray[indexPath.section];
    HgBorrwwerBaseModel *itemModel = sectionModel.itemArray[indexPath.row];
    
    HgBorrowerFamilyAssetsTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    if (!cell) {
        cell = [[HgBorrowerFamilyAssetsTableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier];
    }
    cell.item = itemModel;
    return cell;
}
- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    HgBorrwwerSectionBaseModel *sectionModel = self.sectionArray[section];

    return sectionModel.sectionHeaderHeight;

}

-(UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    HgBorrwwerSectionBaseModel *sectionModel = self.sectionArray[section];

    UIView * sectionView= [[UIView alloc] initWithFrame:CGRectMake(0, 0, kMainScreenBoundwidth, sectionModel.sectionHeaderHeight)];
    sectionView.backgroundColor =CellBG_Color;
    UILabel * nameLable =createLab(sectionView, [UIColor blackColor], HgFuncLabelFont, NSTextAlignmentLeft);
    nameLable.text = sectionModel.sectionHeaderName;
    [nameLable mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(sectionView.mas_left).offset(15);
        make.right.mas_equalTo(sectionView.mas_right).offset(-15);
        make.top.mas_equalTo(sectionView.top).offset(0);
        make.bottom.mas_equalTo(sectionView.bottom).offset(0);
    }];
    
    return sectionView;
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    HgBorrwwerSectionBaseModel *sectionModel = self.sectionArray[indexPath.section];
    HgBorrwwerBaseModel *itemModel = sectionModel.itemArray[indexPath.row];
    if (itemModel.executeCode) {
        itemModel.executeCode();
    }
}
@end
