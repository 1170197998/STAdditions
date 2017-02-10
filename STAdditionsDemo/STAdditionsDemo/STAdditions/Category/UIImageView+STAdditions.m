//
//  UIImageView+STAdditions.m
//  STAdditionsDemo
//
//  Created by ShaoFeng on 2017/1/20.
//  Copyright © 2017年 ShaoFeng. All rights reserved.
//

#import "UIImageView+STAdditions.h"

@implementation UIImageView (STAdditions)

+ (UIImageView *)imageViewWithFrame:(CGRect)rect radiue:(CGFloat)radiue backGroundColor:(UIColor *)color
{
    UIImageView *imageView = [[self alloc] initWithFrame:rect];
    imageView.backgroundColor = color;
    CALayer *lay = imageView.layer;
    [lay setMasksToBounds:YES];
    [lay setCornerRadius:radiue];
    return imageView;
}

@end
