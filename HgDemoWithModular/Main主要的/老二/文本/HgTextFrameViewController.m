//
//  HgTextFrameViewController.m
//  HgDemoWithModular
//
//  Created by RicardoM Lu on 2017/11/27.
//  Copyright © 2017年 RicardoM Lu. All rights reserved.
//

#import "HgTextFrameViewController.h"
#import "HgtextFrameTableViewCell.h"
#import "HgTextFrameModel.h"
#import "HgBaseCustomObj.h"
@interface HgTextFrameViewController ()<UITableViewDelegate,UITableViewDataSource>{
    NSArray * demoAry;
}
@property(strong,nonatomic)UITableView *tableView;
@property(strong,nonatomic)HgTextFrameModel * hgModel;

@end

@implementation HgTextFrameViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    [self.navigationView setTitle:@"文本"];
    _hgModel = [HgTextFrameModel new];
    _hgModel.font24 =@"24";
    _hgModel.font18 =@"18";
    _hgModel.font16 =@"16";
    _hgModel.font14 =@"14";
    _hgModel.font12 =@"12";
    
    demoAry = @[@{@"title":@"primary",@"color":@"#00bcd4"},
                          @{@"title":@"success",@"color":@"#009688"},
                          @{@"title":@"info",@"color":@"#03a9f4"},
                          @{@"title":@"warning",@"color":@"#ffc107"},
                          @{@"title":@"danger",@"color":@"#e51c23"}];
    
    
    
    [self.view addSubview:self.tableView];

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
        _tableView.tableFooterView =[UIView new];
    }
    return _tableView ;
}
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 2;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    if (section ==0) {
        return 1;
    }else{
        return 5;
    }
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.section==0) {
        return 250;
        
    }else{
        return 44;
    }
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{

    if (indexPath.section==0) {
        HgtextFrameTableViewCell * cell = (HgtextFrameTableViewCell*) GetCell(@"HgtextFrameTableViewCell", tableView, @"HgtextFrameTableViewCell");
        cell.myModel = _hgModel;
        return cell;

    }else{
        static NSString *CellIdentifier = @"UITableViewCell";
        
        UITableViewCell *icell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
        
        if (!icell)
            icell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:CellIdentifier];
            icell.textLabel.text=demoAry[indexPath.row][@"title"];
            icell.detailTextLabel.text =demoAry[indexPath.row][@"color"];
        return icell;
    }

    
    
}
-(NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section{
    if (section==0) {
        return @"常用字体大小";
    }else{
        return @"常用字体颜色";
    }
}
- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return HgHeightForHeaderInSection;
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
