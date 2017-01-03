//
//  ZGMUILabel.m
//  RACExercise
//
//  Created by YPC on 17/1/3.
//  Copyright © 2017年 mgzzZ. All rights reserved.
//

#import "ZGMUILabel.h"

@implementation ZGMUILabel

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

- (instancetype)initWithTextColor:(UIColor *)textColor font:(UIFont *)font textAlignment:(NSTextAlignment)textAlignment{
  
    self.textColor = textColor;
    self.font = font;
    self.textAlignment = textAlignment;
    return [self init];
}

- (instancetype)initWithTextColor:(UIColor *)textColor font:(UIFont *)font textAlignment:(NSTextAlignment)textAlignment text:(NSString *)text{
    self.text = text;
    return [self initWithTextColor:textColor font:font textAlignment:textAlignment];
}

@end
