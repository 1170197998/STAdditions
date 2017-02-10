//
//  NSString+STAddition.h
//  Additions
//
//  Created by ShaoFeng on 2017/1/16.
//  Copyright © 2017年 ShaoFeng. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface NSString (STAddition)

/**
 返回Text实际size

 @param size    给定Text范围
 @param label   当前label
 @param space   行间距
 @return        对应实际size
 */
- (CGSize)calculateRectWithSize:(CGSize)size andLabel:(UILabel *)label lineSpacing:(CGFloat)space;

@end
