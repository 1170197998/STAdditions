//
//  UIButton+ZTAddition.h
//  Additions
//
//  Created by ShaoFeng on 2017/1/16.
//  Copyright © 2017年 ShaoFeng. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIButton (ZTAddition)


/**
 快速创建UIButton

 @param type        buttonType
 @param title       buttonTitle
 @param alignment   titleAlign
 @param fontSize    titleSize
 @return            UIButton
 */
+ (instancetype)buttonWithType:(UIButtonType)type normalTitle:(NSString *)title textAlignment:(NSTextAlignment)alignment font:(CGFloat)fontSize;

/**
 快速创建UIButton
 
 @param type            buttonType
 @param frame           buttonFrame
 @param normaTitle      normaTitle
 @param highlighteTitle highlighteTitle
 @param alignment       titleAlign
 @return                UIButton
 */
+ (instancetype)buttonWithType:(UIButtonType)type frame:(CGRect)frame normalTitle:(NSString *)normaTitle highlighteTitle:(NSString *)highlighteTitle textAlignment:(NSTextAlignment)alignment;

/**
 快速创建UIButton

 @param type            buttonType
 @param frame           buttonFrame
 @param normaTitle      normalTitle
 @param titleColor      titleColor
 @param backGroundColor backGroundColor
 @return                UIButton
 */
+ (instancetype)buttonWithType:(UIButtonType)type frame:(CGRect)frame normalTitle:(NSString *)normaTitle titleColor:(UIColor*)titleColor backGroundColor:(UIColor *)backGroundColor;


@end
