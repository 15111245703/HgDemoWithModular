//
//  HgOneViewController.m
//  HgDemoWithModular
//
//  Created by RicardoM Lu on 2017/11/22.
//  Copyright © 2017年 RicardoM Lu. All rights reserved.
//

#import "HgOneViewController.h"
#import "CGlobalPromptView.h"
#import "HgWebViewController.h"
static const CGFloat MJDuration = 2.0;


@interface HgOneViewController () <UITableViewDataSource,UITableViewDelegate>{
    CGlobalPromptView           *  m_PromptView;
    
}
/* 滚回顶部按钮 */
@property (strong , nonatomic)UIButton *backTopButton;

@property (strong,nonatomic)UITableView * tableView;
/** 用来显示的假数据 */
@property (strong, nonatomic) NSMutableArray *data;

@end

@implementation HgOneViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.navigationView setTitle:@"上拉下拉回到顶部"];


    WS(weakSelf);
    [self.navigationView addRightButtonWithImage:[UIImage imageNamed:@"right_"] clickCallBack:^(UIView *view) {
        HgWebViewController *vc = [[HgWebViewController alloc] init];
        [weakSelf.navigationController pushViewController:vc animated:YES];
    }];
    [self.navigationView navigationSmoothScroll:self.tableView start:self.navigationOrginalHeight speed:0.5 stopToStatusBar:YES];

    [self.view addSubview:self.tableView];
    self.data =[NSMutableArray new];
    //这个地方设置tableFooterView是用来去除多余的列表的线
    self.tableView.tableFooterView =[UIView new];

    [self createPromptView];
    
    
    [self initWithMj];
    [self setUpSuspendView];
    
}
#pragma mark - 悬浮按钮
- (void)setUpSuspendView
{
    _backTopButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [self.view addSubview:_backTopButton];
    [_backTopButton addTarget:self action:@selector(ScrollToTop) forControlEvents:UIControlEventTouchUpInside];
    [_backTopButton setImage:[UIImage imageNamed:@"btn_UpToTop"] forState:UIControlStateNormal];
    _backTopButton.hidden = YES;
    _backTopButton.frame = CGRectMake(kMainScreenBoundwidth - 60, kMainScreenBoundheight -IPHONE_TABBARHEIGHT- 60, 40, 40);
}
-(void)ScrollToTop{
    //iOS中的列表视图自带回滚到顶部的功能，就是设置scrollsToTop属性为YES即可，但是当控制其中有多个视图的时候，就不灵了，我也看过网上给过的解决方案，需要设置其他UIScrollView视图的scrollsToTop属性为NO才奏效。
    [self.tableView scrollRectToVisible:CGRectMake(0, 0, 1, 1) animated:YES];
    
}

- (void)viewDidDisappear:(BOOL)animated
{
    [super viewDidDisappear:animated];
}
- (NSMutableArray *)data
{
    if (_data == nil) {
        _data= [[NSMutableArray alloc] init];
    }
    return  _data;
}

- (void)createPromptView
{
    [self.tableView layoutIfNeeded];
    m_PromptView =  [[CGlobalPromptView alloc] init];
    m_PromptView.PromptText = @"暂无内容";
    m_PromptView.hidden = YES;
    [self.tableView addSubview:m_PromptView];
    
    m_PromptView.frame = self.tableView.frame;
    
}
- (UITableView *)tableView
{
    if (nil == _tableView) {
        
        _tableView = [[UITableView alloc]initWithFrame:kMainScreenBounds style:UITableViewStylePlain];
        self.automaticallyAdjustsScrollViewInsets = NO ;
        _tableView.autoresizingMask = UIViewAutoresizingFlexibleHeight | UIViewAutoresizingFlexibleWidth;
        _tableView.separatorStyle = UITableViewCellSeparatorStyleSingleLine;
        _tableView.contentInset = UIEdgeInsetsMake(self.navigationOrginalHeight, 0, IPHONE_TABBARHEIGHT, 0);
        _tableView.delegate =self;
        _tableView.dataSource = self;
        if (@available(iOS 11.0, *)) {
            _tableView.estimatedRowHeight = 0;
            _tableView.estimatedSectionHeaderHeight = 0;
            _tableView.estimatedSectionFooterHeight = 0;
            _tableView.contentInsetAdjustmentBehavior = UIScrollViewContentInsetAdjustmentNever;
        }

    }
    return _tableView ;
}





- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.data.count;
    
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    return 60;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    static NSString *CellIdentifier = @"UITableViewCell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    
    if (!cell)
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
        cell.textLabel.text = [NSString stringWithFormat:@"%ld - %@", (long)indexPath.row, self.data[indexPath.row]];
        cell.detailTextLabel.text = [NSString stringWithFormat:@"%ld - %@", (long)indexPath.row, self.data[indexPath.row]];

    return cell;
    
    
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    [self.data removeAllObjects];
    [self.tableView reloadData];
    
    
}

- (void)initWithMj
{
    __weak __typeof(self) weakSelf = self;
    
    // 马上进入刷新状态
    [self.tableView.mj_header beginRefreshing];
    // 设置回调（一旦进入刷新状态就会调用这个refreshingBlock）
    self.tableView.mj_header = [MJRefreshNormalHeader headerWithRefreshingBlock:^{
        [weakSelf loadNewData];
    }];
    // 设置回调（一旦进入刷新状态就会调用这个refreshingBlock）
    self.tableView.mj_footer = [MJRefreshAutoNormalFooter footerWithRefreshingBlock:^{
        [weakSelf loadMoreData];
    }];
    
}
#pragma mark 下拉刷新数据
- (void)loadNewData
{
    // 1.添加假数据
    for (int i = 0; i<5; i++) {
        [self.data insertObject:MJRandomData atIndex:0];
        
    }
    if (self.data.count>10) {
        _backTopButton.hidden = NO;
        
    }
    // 2.模拟2秒后刷新表格UI（真实开发中，可以移除这段gcd代码）
    __weak UITableView *tableView = self.tableView;
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(MJDuration * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        // 刷新表格
        [tableView reloadData];
        m_PromptView.hidden = self.data.count ? YES :NO;

        // 拿到当前的下拉刷新控件，结束刷新状态
        [tableView.mj_header endRefreshing];
    });
}

#pragma mark 上拉加载更多数据
- (void)loadMoreData
{
    // 1.添加假数据
    for (int i = 0; i<5; i++) {
        [self.data addObject:MJRandomData];
    }
    if (self.data.count>10) {
        _backTopButton.hidden = NO;

    }
    // 2.模拟2秒后刷新表格UI（真实开发中，可以移除这段gcd代码）
    __weak UITableView *tableView = self.tableView;
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(MJDuration * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        // 刷新表格
        [tableView reloadData];
        m_PromptView.hidden = self.data.count ? YES :NO;

        // 拿到当前的上拉刷新控件，结束刷新状态
        [tableView.mj_footer endRefreshing];
    });
}


@end
