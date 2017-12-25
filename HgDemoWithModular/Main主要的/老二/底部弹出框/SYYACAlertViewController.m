//
//  SYYACAlertViewController.m
//  HgDemoWithModular
//
//  Created by Syy on 2017/12/14.
//  Copyright © 2017年 RicardoM Lu. All rights reserved.
//

#import "SYYACAlertViewController.h"
#import "ACAlertController.h"
@interface SYYACAlertViewController (){
    UIButton *btn;
}
/** action titles */
@property (nonatomic, strong) NSArray *titles;

/** cancel title */
@property (nonatomic, copy) NSString *cancelTitle;
@property(nonatomic,retain)UIButton *btn;

@end

@implementation SYYACAlertViewController


    @synthesize btn;

- (NSArray *)titles {
    if (!_titles) {
        _titles = @[@"相册", @"从手机拍照", @"自定义画图"];
    }
    return _titles;
}

- (NSString *)cancelTitle {
    if (!_cancelTitle) {
        _cancelTitle = @"取消";
    }
    return _cancelTitle;
}

    - (void)viewDidLoad {
        [super viewDidLoad];
        // Do any additional setup after loading the view.
        //初始化按钮，设置按钮类型
        self.btn = [UIButton buttonWithType:UIButtonTypeSystem];
        /*
         17      Type:
         18      UIButtonTypeCustom = 0, // 自定义类型
         19      UIButtonTypeSystem NS_ENUM_AVAILABLE_IOS(7_0),  // 系统类型
         20      UIButtonTypeDetailDisclosure,//详细描述样式，圆圈中间加个i
         21      UIButtonTypeInfoLight, //浅色的详细描述样式
         22      UIButtonTypeInfoDark,//深色的详细描述样式
         23      UIButtonTypeContactAdd,//加号样式
         24      UIButtonTypeRoundedRect = UIButtonTypeSystem,   // 圆角矩形
         25      */
        
        //设置按钮位置和尺寸
        self.btn.frame = CGRectMake(50, 150, 300, 50);
        
        //设置按钮文字标题
        [self.btn setTitle:@"我是一个按钮" forState:UIControlStateNormal];
        /*
         33      State:前三个较为常用
         34      UIControlStateNormal //正常状态下
         35      UIControlStateHighlighted //高亮状态下，按钮按下还未抬起的时候
         36      UIControlStateDisabled  //按钮禁用状态下，不能使用
         37      UIControlStateSelected  //选中状态下
         38      UIControlStateApplication //当应用程序标志时
         39      UIControlStateReserved  //为内部框架预留
         40      */
        
        //按钮响应点击事件，最常用的方法：第一个参数是目标对象，一般都是self； 第二个参数是一个SEL类型的方法；第三个参数是按钮点击事件
        [self.btn addTarget:self action:@selector(Method:) forControlEvents:UIControlEventTouchUpInside];
        
        //将控件添加到当前视图上
        [self.view addSubview:self.btn];
    }
    
    -(void)Method:(UIButton *)sender{
        /* 更多使用请查看 readme */
        
        //1、初始化
        ACAlertController *action2 = [[ACAlertController alloc] initWithActionSheetTitles:self.titles cancelTitle:self.cancelTitle];
        
        //2、获取点击事件
        [action2 clickActionButton:^(NSInteger index) {
            NSLog(@"选中的item = %ld", (long)index);
        }];
        
        //3、显示
        [action2 show];
        
    }
    - (void)didReceiveMemoryWarning {
        [super didReceiveMemoryWarning];
        // Dispose of any resources that can be recreated.
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

