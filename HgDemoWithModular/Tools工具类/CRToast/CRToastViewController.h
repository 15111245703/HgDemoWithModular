//
//  CRToast
//  Copyright (c) 2014-2015 Collin Ruffenach. All rights reserved.
//

#import <UIKit/UIKit.h>
@class CRToast;

@interface CRToastViewController : HgBaseViewController

@property (nonatomic, assign) BOOL autorotate;
@property (nonatomic, weak) CRToast *notification;
@property (nonatomic, weak) UIView *toastView;
@property (nonatomic, assign) UIStatusBarStyle statusBarStyle;

@end
