//
//  ZGMUIButton.m
//  RACExercise
//
//  Created by YPC on 17/1/3.
//  Copyright © 2017年 mgzzZ. All rights reserved.
//

#import "ZGMUIButton.h"

@implementation ZGMUIButton

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

- (instancetype)initWithText:(NSString *)text textSelect:(NSString *)textSelect textColor:(UIColor *)textColor textSelectColor:(UIColor *)textSelectColor font:(UIFont *)font textAlignment:(NSTextAlignment)textAlignment{
    
    if (text.length > 0) {
        [self setTitle:text forState:UIControlStateNormal];
        [self setTitleColor:textColor forState:UIControlStateNormal];
    }
    if (textSelect.length > 0) {
        [self setTitle:textSelect forState:UIControlStateSelected];
        [self setTitleColor:textSelectColor forState:UIControlStateSelected];
    }
    self.titleLabel.font = font;
    self.titleLabel.textAlignment = textAlignment;
    
    return [ZGMUIButton buttonWithType:UIButtonTypeCustom];
}

- (instancetype)initWithImg:(UIImage *)img seletedImg:(UIImage *)seletedImg{
    if (img) {
        [self setImage:img forState:UIControlStateNormal];
    }
    
    if (seletedImg) {
        [self setImage:seletedImg forState:UIControlStateSelected];
    }
    
    
    return [ZGMUIButton buttonWithType:UIButtonTypeCustom];
}

@end
