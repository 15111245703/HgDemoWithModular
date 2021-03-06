//
//  RCAnimatedImagesView.h
//  RCloudMessage
//
//  Created by 杜立召 on 15/3/18.
//  Copyright (c) 2015年 RongCloud. All rights reserved.
//

#import <UIKit/UIKit.h>
//该类是用于登录时背景的动态图片
#define kJSAnimatedImagesViewDefaultTimePerImage 20.0f

@protocol RCAnimatedImagesViewDelegate;

@interface RCAnimatedImagesView : UIView

@property(nonatomic, assign) id<RCAnimatedImagesViewDelegate> delegate;

@property(nonatomic, assign) NSTimeInterval timePerImage;

- (void)startAnimating;
- (void)stopAnimating;

- (void)reloadData;

@end

@protocol RCAnimatedImagesViewDelegate
- (NSUInteger)animatedImagesNumberOfImages:
    (RCAnimatedImagesView *)animatedImagesView;
- (UIImage *)animatedImagesView:(RCAnimatedImagesView *)animatedImagesView
                   imageAtIndex:(NSUInteger)index;
@end
