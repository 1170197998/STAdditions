//
//  UILabel+ZTAddition.h
//  Additions
//
//  Created by ShaoFeng on 2017/1/16.
//  Copyright © 2017年 ShaoFeng. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UILabel (ZTAddition)

/**
 快速实例化一个UILabel

 @param rect    指定frame
 @param font    字体大小
 @param bColor  背景色
 @param tColor  字体颜色
 @param isWarp  是否换行
 @return        UIlabel
 */
+ (instancetype)labelWithFrame:(CGRect)rect font:(CGFloat)font backGroundColor:(UIColor *)bColor textColor:(UIColor *)tColor isWarp:(BOOL)isWarp;

@end
