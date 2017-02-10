//
//  UIImageView+STAdditions.h
//  STAdditionsDemo
//
//  Created by ShaoFeng on 2017/1/20.
//  Copyright © 2017年 ShaoFeng. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImageView (STAdditions)

/**
 快速创建UIImageView(多适用于设置头像)

 @param rect    frame
 @param radiue  radiusValue
 @param color   colorValue
 @return        UIImageView
 */
+ (UIImageView *)imageViewWithFrame:(CGRect)rect radiue:(CGFloat)radiue backGroundColor:(UIColor *)color;

@end
