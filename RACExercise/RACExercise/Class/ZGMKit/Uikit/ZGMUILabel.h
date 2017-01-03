//
//  ZGMUILabel.h
//  RACExercise
//
//  Created by YPC on 17/1/3.
//  Copyright © 2017年 mgzzZ. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ZGMUILabel : UILabel


- (instancetype)initWithTextColor:(UIColor *)textColor font:(UIFont *)font textAlignment:(NSTextAlignment)textAlignment;

- (instancetype)initWithTextColor:(UIColor *)textColor font:(UIFont *)font textAlignment:(NSTextAlignment)textAlignment text:(NSString *)text;

@end
