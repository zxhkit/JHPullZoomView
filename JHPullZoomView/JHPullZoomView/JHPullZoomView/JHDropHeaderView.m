//
//  JHDropHeaderView.m
//  JHPullZoomView
//
//  Created by rookie on 2017/6/18.
//  Copyright © 2017年 mamahome. All rights reserved.
//

#import "JHDropHeaderView.h"
#import "UIView+Size.h"

@interface JHDropHeaderView()<UIScrollViewDelegate>

@property (nonatomic, assign) CGFloat OffsetY;
@property (nonatomic, assign) CGRect StretchViewFrame;
@property (nonatomic, assign) CGFloat SelfHeight;
@property (nonatomic, assign) CGFloat ContentHeight;

@end

@implementation JHDropHeaderView


+ (instancetype)dropHeaderViewWithFrame:(CGRect)frame contentView:(UIView *)contentView stretchView:(UIView *)stretchView
{
    JHDropHeaderView *dropHeaderView = [[JHDropHeaderView alloc] init];
    dropHeaderView.frame = frame;
    dropHeaderView.contentView = contentView;
    dropHeaderView.stretchView = stretchView;
    
    stretchView.contentMode = UIViewContentModeScaleAspectFill;
    stretchView.clipsToBounds = YES;
    return dropHeaderView;
}

- (void)setContentView:(UIView *)contentView
{
    _contentView = contentView;
    [self addSubview:contentView];
}

- (void)willMoveToSuperview:(UIView *)newSuperview
{
    [self.superview removeObserver:self forKeyPath:@"contentOffset"];
    if (newSuperview != nil) {
        [newSuperview addObserver:self forKeyPath:@"contentOffset" options:NSKeyValueObservingOptionNew context:nil];
        UIScrollView *scrollView = (UIScrollView *)newSuperview;
        
        self.OffsetY = scrollView.contentOffset.y;
        self.StretchViewFrame = self.stretchView.frame;
        self.SelfHeight = self.height;
        self.ContentHeight = self.contentView.height;
    }
    
}


- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary *)change context:(void *)context
{
    CGFloat offsetY = [change[@"new"] CGPointValue].y - self.OffsetY;
    
    if (offsetY > 0) {
        
        self.stretchView.y = self.StretchViewFrame.origin.y + offsetY;
        self.stretchView.height = self.StretchViewFrame.size.height - offsetY;
        
    }else{
        
        self.stretchView.y = self.StretchViewFrame.origin.y + offsetY;
        self.stretchView.height = self.StretchViewFrame.size.height - offsetY;
        
    }
    
}



@end
