//
//  HgTableViewController.h
//  HgDemoWithModular
//
//  Created by RicardoM Lu on 2017/11/24.
//  Copyright © 2017年 RicardoM Lu. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "HgBaseViewController.h"
@class HgBaseViewController;
@interface HgTableViewController :HgBaseViewController
@property (nonatomic,strong) NSArray  *sectionArray; /**< section模型数组*/
@property (nonatomic,strong)UITableView *tableView ;

@end
