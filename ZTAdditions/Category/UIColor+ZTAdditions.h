//
//  UIColor+ZTAdditions.h
//  Additions
//
//  Created by ShaoFeng on 2017/1/13.
//  Copyright © 2017年 ShaoFeng. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIColor (ZTAdditions)

/**
 通过十六进制值设置UIColor

 @param hexValue    十六进制值
 @return            UIColor
 */
+ (instancetype)colorWithHex:(uint32_t)hexValue;

/**
 通过十六进制值设置UIColor,同时设置透明度

 @param hexValue    十六进制值
 @param alphaValue  透明度
 @return UIColor
 */
+ (instancetype)colorWithHex:(uint32_t)hexValue alpha:(CGFloat)alphaValue;

/**
 设置随机颜色

 @return UIColor
 */
+ (instancetype)colorOfRandom;

/**
 通过RGB方式设置UIColor

 @param red     red value
 @param green   green value
 @param blue    blue value
 @return        UIColor
 */
+ (instancetype)colorWithRed:(uint8_t)red green:(uint8_t)green blue:(uint8_t)blue;

/**
 通过RGB方式设置UIColor,同时设置透明度

 @param red     red value
 @param green   green value
 @param blue    blue value
 @param alpha   alpha value
 @return        UIColor
 */
+ (instancetype)colorWithRed:(uint8_t)red green:(uint8_t)green blue:(uint8_t)blue alpha:(CGFloat)alpha;

@end
