//
//  UIColor+STAdditions.m
//  Additions
//
//  Created by ShaoFeng on 2017/1/13.
//  Copyright © 2017年 ShaoFeng. All rights reserved.
//

#import "UIColor+STAdditions.h"

@implementation UIColor (STAdditions)

+ (instancetype)colorWithHex:(uint32_t)hexValue
{
    return [self colorWithHex:hexValue alpha:1.0];
}

+ (instancetype)colorWithHex:(uint32_t)hexValue alpha:(CGFloat)alphaValue
{
    uint8_t r = (hexValue & 0xff0000) >> 16;
    uint8_t g = (hexValue & 0x00ff00) >> 8;
    uint8_t b = hexValue & 0x0000ff;
    return [self colorWithRed:r green:g blue:b alpha:alphaValue];
}

+ (instancetype)colorOfRandom
{
    return [UIColor colorWithRed:arc4random_uniform(256) green:arc4random_uniform(256) blue:arc4random_uniform(256)];
}

+ (instancetype)colorWithRed:(uint8_t)red green:(uint8_t)green blue:(uint8_t)blue
{
    return [self colorWithRed:red green:green blue:blue alpha:1.0];
}

+ (instancetype)colorWithRed:(uint8_t)red green:(uint8_t)green blue:(uint8_t)blue alpha:(CGFloat)alpha
{
    return [UIColor colorWithRed:red / 255.0 green:green / 255.0 blue:blue / 255.0 alpha:alpha];
}

@end
