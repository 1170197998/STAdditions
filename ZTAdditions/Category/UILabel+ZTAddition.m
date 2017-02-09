


//
//  UILabel+ZTAddition.m
//  Additions
//
//  Created by ShaoFeng on 2017/1/16.
//  Copyright © 2017年 ShaoFeng. All rights reserved.
//

#import "UILabel+ZTAddition.h"

@implementation UILabel (ZTAddition)

+ (instancetype)labelWithFrame:(CGRect)rect font:(CGFloat)font backGroundColor:(UIColor *)bColor textColor:(UIColor *)tColor isWarp:(BOOL)isWarp
{
    UILabel *label = [[self alloc] initWithFrame:rect];
    if (font != 0) {
        label.font = [UIFont systemFontOfSize:font];
    }
    label.backgroundColor = bColor;
    label.textColor = tColor;
    label.numberOfLines = isWarp ? 0 : 1;
    [label sizeToFit];
    return label;
}

@end
