//
//  JHDropHeaderView.h
//  JHPullZoomView
//
//  Created by rookie on 2017/6/18.
//  Copyright © 2017年 mamahome. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface JHDropHeaderView : UIView
@property (nonatomic, strong) UIView *contentView;
@property (nonatomic, strong) UIView *stretchView;
+ (instancetype)dropHeaderViewWithFrame:(CGRect)frame contentView:(UIView *)contentView stretchView:(UIView *)stretchView;
 
@end
