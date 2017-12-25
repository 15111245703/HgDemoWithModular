//
//  AppDelegate.m
//  HgDemoWithModular
//
//  Created by RicardoM Lu on 2017/11/22.
//  Copyright © 2017年 RicardoM Lu. All rights reserved.
//

#import "AppDelegate.h"
#import "HgTabBarController.h"
#import "HgBaseCustomObj.h"
#import "HgLoginViewController.h"
//init－初始化程序
//viewDidLoad－加载视图
//viewWillAppear－UIViewController对象的视图即将加入窗口时调用；
//viewDidApper－UIViewController对象的视图已经加入到窗口时调用；
//viewWillDisappear－UIViewController对象的视图即将消失、被覆盖或是隐藏时调用；
//viewDidDisappear－UIViewController对象的视图已经消失、被覆盖或是隐藏时调用；
//viewVillUnload－当内存过低时，需要释放一些不需要使用的视图时，即将释放时调用；
//viewDidUnload－当内存过低，释放一些不需要的视图时调用。

@interface AppDelegate ()

@end

@implementation AppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    IQKeyboardManager *manager = [IQKeyboardManager sharedManager];
    //    控制整个功能是否启用。
    manager.enable = YES;
    manager.overrideKeyboardAppearance = YES;
    //    1.修改IQKeyBoardManager的右边的Done按钮
    manager.toolbarDoneBarButtonItemText = @"完成";
    
    //控制点击背景是否收起键盘
    manager.shouldResignOnTouchOutside = YES;
    //    //控制键盘上的工具条文字颜色是否用户自定义。  注意这个颜色是指textfile的tintcolor
    manager.shouldToolbarUsesTextFieldTintColor = YES;
    //    //中间位置是否显示占位文字(默认是YES)
    manager.shouldShowTextFieldPlaceholder = YES;
    //    //设置占位文字的字体大小
    manager.placeholderFont = [UIFont boldSystemFontOfSize:18];
    //控制是否显示键盘上的工具条。
    manager.enableAutoToolbar = YES;
    //某个类中禁止使用工具条
    //    [[IQKeyboardManager sharedManager]disableToolbarInViewControllerClass:[UIViewController class]];
    //    防止IQKeyboardManager让rootview上滑过度,默认是YES
    manager.preventShowingBottomBlankSpace = YES;
    
    
    //背景色
    [SVProgressHUD setDefaultStyle:SVProgressHUDStyleDark];
    //菊花样式
    [SVProgressHUD setDefaultAnimationType:SVProgressHUDAnimationTypeNative];
    //菊花运作时，屏幕背景色
    [SVProgressHUD setDefaultMaskType:SVProgressHUDMaskTypeGradient];
    [self inintWithIsLogin];
    
    

    
    if (@available(iOS 11.0, *)) {
        UITableView.appearance.estimatedRowHeight = 0;
        UITableView.appearance.estimatedSectionFooterHeight = 0;
        UITableView.appearance.estimatedSectionHeaderHeight = 0;
        UIScrollView.appearance.contentInsetAdjustmentBehavior = UIScrollViewContentInsetAdjustmentNever;
    } else {
        // Fallback on earlier versions
    }
    return YES;
}
-(void)inintWithIsLogin{

        if ([[UserDefaultsObj shareInstance] getDefaultUser]==YES) {
            self.window = [[UIWindow alloc] initWithFrame:[UIScreen mainScreen].bounds];
            self.window.rootViewController = [[HgTabBarController alloc] init];
            [self.window makeKeyAndVisible];
            //设置app在桌面上的小红点
            UIUserNotificationSettings *settings = [UIUserNotificationSettings settingsForTypes:UIUserNotificationTypeBadge categories:nil];
            [[UIApplication sharedApplication] registerUserNotificationSettings:settings];
            [[UIApplication sharedApplication] setApplicationIconBadgeNumber:3];

        }else{
            self.window = [[UIWindow alloc] initWithFrame:[UIScreen mainScreen].bounds];
            EasyNavigationController * nav = [[EasyNavigationController alloc] initWithRootViewController:[[HgLoginViewController alloc] init]];
            self.window.rootViewController = nav;
            [self.window makeKeyAndVisible];

            
        }
}


- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
}

//程序进入后台
- (void)applicationDidEnterBackground:(UIApplication *)application {
    
}

//后台回到前台
- (void)applicationWillEnterForeground:(UIApplication *)application {
    //uuidsOfUserDevices
    
}


- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}


- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}


@end
