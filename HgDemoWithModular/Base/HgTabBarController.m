//
//  HgTabBarController.m
//  HgDemo
//
//  Created by RicardoM Lu on 2017/2/28.
//  Copyright © 2017年 RicardoM Lu. All rights reserved.
//

#import "HgTabBarController.h"
#import "HgOneViewController.h"
#import "HgTwoViewController.h"
#import "HgThreeViewController.h"
@interface HgTabBarController ()

@end

@implementation HgTabBarController{

}
-(void)dealloc{
    NSLog(@"测试退出登录，是会自动释放当前TabBarController的");
}
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self addChildViewController];
    
    //tabbar底部背景颜色
    [self.tabBar setBarTintColor:[UIColor whiteColor]];
//    取消tabBar的透明效果
    [UITabBar appearance].translucent = YES;

}

/**
 *  添加一个新的子控制器
 */
- (void)addChildVC:(UIViewController *)childvc andTitle:(NSString*)title andImage:(NSString*)image
       andHigImage:(NSString *)HigImage
{
    //每添加一个视图控制器自定义tabBar就添加一个按钮
    //   [self.tabBar addTabBarButtonWithNormalTitle:title NormalImageName:image];
    EasyNavigationOptions *options = [EasyNavigationOptions shareInstance];
    options.titleColor =GlobalHeader_Text_Color;
    options.buttonTitleFont = [UIFont systemFontOfSize:18];
    options.navBackGroundColor =NavBG_Color;
//    options.navBackgroundImage = [UIImage imageNamed:@"nav_background_image.png"];
    options.buttonTitleColor = [UIColor whiteColor];
    EasyNavigationController *nav=[[EasyNavigationController alloc]initWithRootViewController:childvc];
    [self addChildViewController:nav];
    childvc.tabBarItem.image = [[UIImage imageNamed:image]imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    childvc.tabBarItem.selectedImage=[[UIImage imageNamed:HigImage]imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    childvc.tabBarItem.title = title;
    //设置文字的样式
    NSMutableDictionary *textAttrs = [NSMutableDictionary dictionary];
    textAttrs[NSForegroundColorAttributeName] = CreateUIColor(154, 154, 154, 1.0);
    textAttrs[NSFontAttributeName] = [UIFont systemFontOfSize:12];
    [childvc.tabBarItem setTitleTextAttributes:textAttrs forState:UIControlStateNormal];
    
    NSMutableDictionary *selectTextAttrs = [NSMutableDictionary dictionary];
    selectTextAttrs[NSForegroundColorAttributeName] = CreateUIColor(64, 189, 230, 1.0);
    [childvc.tabBarItem setTitleTextAttributes:selectTextAttrs forState:UIControlStateSelected];
}
- (void)addChildViewController {
    [self addChildVC:[HgOneViewController new] andTitle:@"首页" andImage:@"tab-recent-nor" andHigImage:@"tab-recent-press"];
    [self addChildVC:[HgTwoViewController new] andTitle:@"老二" andImage:@"tab-qworld-nor" andHigImage:@"tab-qworld-press"];
    [self addChildVC:[HgThreeViewController new] andTitle:@"老三" andImage:@"tab-buddy-nor" andHigImage:@"tab-buddy-press"];

    
}
@end
