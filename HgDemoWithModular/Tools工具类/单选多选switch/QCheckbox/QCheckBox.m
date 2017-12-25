//
//  EICheckBox.m
//  EInsure
//
//  Created by ivan on 13-7-9.
//  Copyright (c) 2013年 ivan. All rights reserved.
//

#import "QCheckBox.h"

#define Q_CHECK_ICON_WH                    (15.0)
#define Q_ICON_TITLE_MARGIN                (5.0)

static NSMutableDictionary *_groupRadioDics = nil;
static NSLock *lock = nil;
@implementation QCheckBox

@synthesize delegate = _delegate;
@synthesize checked = _checked;
@synthesize userInfo = _userInfo;

- (void)initWithgroupId:(NSString*)groupId count:(int)mcount{
    
    if (self) {
        
        
        if (!lock) {
            lock = [[NSLock alloc] init];
        }
        _groupId = [groupId copy];
        count = mcount;
        [self addToGroup];
        self.exclusiveTouch = YES;
        [self setImage:[UIImage imageNamed:@"checkbox1_unchecked.png"] forState:UIControlStateNormal];
        [self setImage:[UIImage imageNamed:@"checkbox1_checked.png"] forState:UIControlStateSelected];
        [self addTarget:self action:@selector(checkboxBtnChecked) forControlEvents:UIControlEventTouchUpInside];
    }
    
}

-(void)initDelegate:(id)delegate {
    
    if (self) {
        
        _delegate = delegate;
        
        
    }
    
    
}
- (id)initWithDelegate:(id)delegate groupId:(NSString*)groupId count:(int)mcount{
    self = [super init];
    if (self) {
        _delegate = delegate;
        _groupId = [groupId copy];
        count = mcount;
        @synchronized(lock){
            [self addToGroup];
        }
        
        
        self.exclusiveTouch = YES;
        [self setImage:[UIImage imageNamed:@"checkbox1_unchecked.png"] forState:UIControlStateNormal];
        [self setImage:[UIImage imageNamed:@"checkbox1_checked.png"] forState:UIControlStateSelected];
        [self addTarget:self action:@selector(checkboxBtnChecked) forControlEvents:UIControlEventTouchUpInside];
    }
    return self;
}
- (void)addToGroup {
    
    if(!_groupRadioDics){
        _groupRadioDics = [[NSMutableDictionary dictionary] retain];
    }
    
    NSMutableArray *_gRadios = [_groupRadioDics objectForKey:_groupId];
    if (!_gRadios) {
        _gRadios = [NSMutableArray array];
    }
    [_gRadios addObject:self];
    [_groupRadioDics setObject:_gRadios forKey:_groupId];
    
}

- (void)removeFromGroup {
    if (_groupRadioDics) {
        NSMutableArray *_gRadios = [_groupRadioDics objectForKey:_groupId];
        if (_gRadios) {
            [_gRadios removeObject:self];
            if (_gRadios.count == 0) {
                [_groupRadioDics removeObjectForKey:_groupId];
            }
        }
    }
}

- (void)uncheckOtherRadios:(BOOL)checked  {
    
    
    NSMutableArray *_gRadios = [_groupRadioDics objectForKey:_groupId];
    int i = 0;
    if (_gRadios.count > 0) {
        for (QCheckBox *_radio in _gRadios) {
            if (_radio.selected && ![_radio isEqual:self]) {
                i++;
            }
        }
    }
    
    NSLog(@"i = %d,count = %d",i,count);
    if (self.selected) {
        i++;
    }
    if (count >=i) {
        self.selected = checked;
        self.checked = checked;
    }
    else{
        self.selected = false;
        self.checked = false;
        if ( _delegate && [_delegate respondsToSelector:@selector(alerViewCount:)]) {
            [_delegate alerViewCount:count];
        }
    }
    
    
}

- (void)setChecked:(BOOL)checked {
    if (_checked == checked) {
        return;
    }
    
    _checked = checked;
    self.selected = checked;
    
    @synchronized(lock){
        [self uncheckOtherRadios:self.selected ];
    }
    
    
    if (_delegate && [_delegate respondsToSelector:@selector(didSelectedCheckBox:checked:groupId:)]) {
        [_delegate didSelectedCheckBox:self checked:self.selected groupId:_groupId];
        
    }
}

- (void)checkboxBtnChecked {
    
    
    
    self.selected = !self.selected;
    _checked = self.selected;
    
    
    @synchronized(lock){
        [self uncheckOtherRadios:self.selected ];
    }
    
    
    if ( _delegate && [_delegate respondsToSelector:@selector(didSelectedCheckBox:checked:groupId:)]) {
        [_delegate didSelectedCheckBox:self checked:self.selected groupId:_groupId];
        
    }
    
}

- (CGRect)imageRectForContentRect:(CGRect)contentRect {
    return CGRectMake(0, (CGRectGetHeight(contentRect) - Q_CHECK_ICON_WH)/2.0, Q_CHECK_ICON_WH, Q_CHECK_ICON_WH);
}

- (CGRect)titleRectForContentRect:(CGRect)contentRect {
    return CGRectMake(Q_CHECK_ICON_WH + Q_ICON_TITLE_MARGIN, 0,
                      CGRectGetWidth(contentRect) - Q_CHECK_ICON_WH - Q_ICON_TITLE_MARGIN,
                      CGRectGetHeight(contentRect));
}

- (void)dealloc {
    [_userInfo release];
    _delegate = nil;
    [super dealloc];
}

@end
