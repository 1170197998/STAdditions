
//
//  NSString+ZTAddition.m
//  Additions
//
//  Created by ShaoFeng on 2017/1/16.
//  Copyright © 2017年 ShaoFeng. All rights reserved.
//

#import "NSString+ZTAddition.h"

@implementation NSString (ZTAddition)

- (CGSize)calculateRectWithSize:(CGSize)size andLabel:(UILabel *)label lineSpacing:(CGFloat)space
{
    NSMutableAttributedString *attibutesString = [[NSMutableAttributedString alloc] initWithString:self];
    NSMutableParagraphStyle *paraghStyle =[[NSMutableParagraphStyle alloc] init];
    [paraghStyle setLineSpacing:space];
    [attibutesString addAttribute:NSParagraphStyleAttributeName value:paraghStyle range:NSMakeRange(0, self.length)];
    label.attributedText = attibutesString;
    label.lineBreakMode = NSLineBreakByTruncatingTail;
    [label setContentMode:UIViewContentModeTop];
    NSDictionary *attribute = @{NSFontAttributeName:label.font,NSParagraphStyleAttributeName:paraghStyle};
    CGSize labelSize = [self boundingRectWithSize:size options: NSStringDrawingTruncatesLastVisibleLine |NSStringDrawingUsesLineFragmentOrigin | NSStringDrawingUsesFontLeading attributes:attribute context:nil].size;
    return labelSize;
}


@end
