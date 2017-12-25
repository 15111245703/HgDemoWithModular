//
//  HgButtonFrameViewController.h
//  HgDemoWithModular
//
//  Created by RicardoM Lu on 2017/11/28.
//  Copyright © 2017年 RicardoM Lu. All rights reserved.
//

#import "HgBaseViewController.h"

@interface HgButtonFrameViewController : HgBaseViewController

@end


@interface BottomButton : UIButton

- (CGRect)imageRectForContentRect:(CGRect)contentRect;
- (CGRect)titleRectForContentRect:(CGRect)contentRect;

@end
