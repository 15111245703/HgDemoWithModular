//
//  Inline.h
//  迈湘McDonald
//
//  Created by pierrot on 15/9/22.
//  Copyright © 2015年 HN-AiNi-Tec. All rights reserved.
//

#ifndef Inline_h
#define Inline_h

CG_INLINE UIImage* GetUIImageFromNSBundle(NSString *imgName)
{
    NSString *fullImageName;
    UIImage  *i;
    
    
    NSArray *as = [NSArray arrayWithObjects:@"@3x",@"@2x",@"",nil];
    NSArray *at = [NSArray arrayWithObjects:@".png",@"jpg",@"jpeg",@"",nil];
    
    for ( NSString *s in as )
        for ( NSString *t in at )
        {
            fullImageName = [NSString stringWithFormat:@"%@%@%@",imgName,s,t];
            i = [UIImage imageWithContentsOfFile:[[[NSBundle mainBundle] resourcePath] stringByAppendingPathComponent:fullImageName]];
            if ( i && [i size].width )
            {
                return i;
            }
        }
    assert(i && [i size].width);
    return i;
}

CG_INLINE UITableViewCell* GetCell(NSString *strClassName,UITableView *tableView,NSString *CellIdentifier)
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil)
    {
        cell = [[NSClassFromString(strClassName) alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
    }
    return cell;
}

CG_INLINE UIImage *ScaleImage(UIImage *img,CGSize toSize)
{
    if ( NSStringFromCGSize(img.size) == NSStringFromCGSize(toSize) )
        return img;
    UIImage *i;
    // 创建一个bitmap的context,并把它设置成为当前正在使用的context
    UIGraphicsBeginImageContext(toSize);
    CGRect imageRect=CGRectMake(0, 0, toSize.width, toSize.height);
    // 绘制改变大小的图片
    [img drawInRect:imageRect];
    // 从当前context中创建一个改变大小后的图片
    i=UIGraphicsGetImageFromCurrentImageContext();
    // 使当前的context出堆栈
    UIGraphicsEndImageContext();
    // 返回新的改变大小后的图片
    return i;
}

CG_INLINE UIImage* CreateImageWithColor(UIColor *color,CGSize toSize)
{
    CGRect rect=CGRectMake(0.0f, 0.0f, toSize.width, toSize.height);
    UIGraphicsBeginImageContext(rect.size);
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextSetFillColorWithColor(context, [color CGColor]);
    CGContextFillRect(context, rect);
    UIImage *theImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return theImage;
}

CG_INLINE UIImage *CreateHLTImage(UIImage *srcImage,UIColor *hltColor,CGRect rect)
{
    UIGraphicsBeginImageContext(rect.size);
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextSetFillColorWithColor(context, [hltColor CGColor]);
    CGContextFillRect(context, rect);
    
    CGFloat cx = rect.size.width / 2.0;
    CGFloat cy = rect.size.height / 2.0;
    
    CGPoint p = CGPointMake(cx - srcImage.size.width / 2.0 , cy - srcImage.size.height / 2.0);
    [srcImage drawAtPoint:p];
    
    UIImage *theImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return theImage;
}

CG_INLINE UITapGestureRecognizer *CreateCancelKeyBoardInputGesture(id objTarget,SEL sel,UIView *tapParentView,bool cancelsTouchesInView)
{
    UITapGestureRecognizer *TapGr_CancelInput;
    /*创建取消键盘输入手势*/
    TapGr_CancelInput = [[UITapGestureRecognizer alloc] initWithTarget:objTarget action:sel];
    /*NO 为链式响应*/
    TapGr_CancelInput.cancelsTouchesInView = cancelsTouchesInView;
    [tapParentView addGestureRecognizer:TapGr_CancelInput];
    return TapGr_CancelInput;
}

CG_INLINE UIButton * createBtn(UIView * ParentView , id Target, SEL Action, UIColor *NorImgColor,UIColor *HighlightedImgColor)
{
    UIButton * btn  = [UIButton buttonWithType:UIButtonTypeCustom];
    [btn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    btn.titleLabel.font = [UIFont systemFontOfSize:14.5];
    [btn.layer setCornerRadius:5];
    [btn.layer setMasksToBounds:YES];
    [btn.layer setBorderWidth:0.0];
    
    [btn setBackgroundImage:CreateImageWithColor(NorImgColor, CGSizeMake(20, 20)) forState:UIControlStateNormal];
    [btn setBackgroundImage:CreateImageWithColor(HighlightedImgColor, CGSizeMake(20, 20)) forState:UIControlStateHighlighted];
    
    if (Action) {
          [btn addTarget:Target action:Action forControlEvents:UIControlEventTouchUpInside];
    }
    
  
    [ParentView addSubview:btn];
    return btn;
}
CG_INLINE UILabel * createLab(UIView * ParentView , UIColor *TextColor,CGFloat  FontSize, NSTextAlignment  TextAlignment)
{
    UILabel * lab = [[UILabel alloc] init];
    lab.backgroundColor = [UIColor clearColor];
    lab.textColor = TextColor;
    lab.font = [UIFont systemFontOfSize:FontSize];
    lab.textAlignment = TextAlignment;
    [ParentView addSubview:lab];
    return lab;
}

CG_INLINE UITextView * createUITextView(UIView * ParentView , UIColor *TextColor,CGFloat  FontSize, NSTextAlignment  TextAlignment)
{
    UITextView * lab = [[UITextView alloc] init];
    lab.backgroundColor = [UIColor redColor];
    lab.textColor = [UIColor blueColor];
    lab.font = [UIFont systemFontOfSize:FontSize];
    lab.textAlignment = TextAlignment;
    [ParentView addSubview:lab];
    return lab;
}

CG_INLINE UIImageView * createLine(UIView * ParentView , UIColor *LineColor)
{
    UIImageView * imgView = [[UIImageView alloc] init];
    imgView.image = CreateImageWithColor(LineColor, CGSizeMake(20, 20));
    [ParentView addSubview:imgView];
    return imgView;
}

CG_INLINE UIImageView * createArrow(UIView * ParentView )
{
    UIImageView * Arrow = [[UIImageView alloc] init];
    Arrow.image = [UIImage imageNamed:@"arrow"];
    Arrow.contentMode = UIViewContentModeScaleAspectFit;
    [ParentView addSubview:Arrow];
    return Arrow;
}


CG_INLINE UITableView * createTabView(id<UITableViewDataSource,UITableViewDelegate>delegate,UIView * ParentView, UITableViewStyle tableviewStyle)
{
    UITableView * tab = [[UITableView alloc] initWithFrame:CGRectZero style:tableviewStyle];
    tab.separatorStyle = UITableViewCellSeparatorStyleNone;
    tab.dataSource = delegate;
    tab.delegate = delegate;
    [ParentView addSubview:tab];
    
    tab.estimatedRowHeight = 0;
    tab.estimatedSectionHeaderHeight = 0;
    tab.estimatedSectionFooterHeight = 0;
    return tab;
}



#endif /* Inline_h */
