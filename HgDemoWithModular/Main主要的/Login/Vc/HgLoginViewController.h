//
//  HgLoginViewController.h
//  HGBasicFramework
//
//  Created by RicardoM Lu on 2017/8/17.
//  Copyright © 2017年 RicardoM Lu. All rights reserved.
//

#import "HgBaseViewController.h"
#import "RCAnimatedImagesView.h"
//MVC
@interface HgLoginViewController : HgBaseViewController<RCAnimatedImagesViewDelegate>
- (void)login:(NSString *)userName password:(NSString *)password;

@end
