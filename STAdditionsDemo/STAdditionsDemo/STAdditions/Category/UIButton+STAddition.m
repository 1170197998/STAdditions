//
//  UIButton+STAddition.m
//  Additions
//
//  Created by ShaoFeng on 2017/1/16.
//  Copyright © 2017年 ShaoFeng. All rights reserved.
//

#import "UIButton+STAddition.h"

@implementation UIButton (STAddition)

+ (instancetype)buttonWithType:(UIButtonType)type normalTitle:(NSString *)title textAlignment:(NSTextAlignment)alignment font:(CGFloat)fontSize;
{
    UIButton *button = [self buttonWithType:type];
    [button setTitle:title forState:UIControlStateNormal];
    button.titleLabel.textAlignment = alignment;
    button.titleLabel.font = [UIFont systemFontOfSize:fontSize];
    [button sizeToFit];
    return button;
}

+ (instancetype)buttonWithType:(UIButtonType)type frame:(CGRect)frame normalTitle:(NSString *)normaTitle highlighteTitle:(NSString *)highlighteTitle textAlignment:(NSTextAlignment)alignment
{
    UIButton *button = [[self alloc] initWithFrame:frame];
    [button setTitle:normaTitle forState:UIControlStateNormal];
    [button setTitle:highlighteTitle forState:UIControlStateHighlighted];
    button.titleLabel.textAlignment = alignment;
    return button;
}

+ (instancetype)buttonWithType:(UIButtonType)type frame:(CGRect)frame normalTitle:(NSString *)normaTitle titleColor:(UIColor*)titleColor backGroundColor:(UIColor *)backGroundColor
{
    UIButton *button = [[self alloc] initWithFrame:frame];
    [button setTitle:normaTitle forState:UIControlStateNormal];
    [button setTitleColor:titleColor forState:UIControlStateNormal];
    button.backgroundColor = backGroundColor;
    return button;
}

@end
