//
//  ZGMUIButton.h
//  RACExercise
//
//  Created by YPC on 17/1/3.
//  Copyright © 2017年 mgzzZ. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ZGMUIButton : UIButton

@property (nonatomic,copy)NSString *strTag;

@property (nonatomic,assign)NSInteger intTag;

@property (nonatomic,assign)CGFloat floatTag;

@property (nonatomic,strong)NSNumber *numberTag;

- (instancetype)initWithText:(NSString *)text textSelect:(NSString *)textSelect textColor:(UIColor *)textColor textSelectColor:(UIColor *)textSelectColor font:(UIFont *)font textAlignment:(NSTextAlignment)textAlignment;


- (instancetype)initWithImg:(UIImage *)img seletedImg:(UIImage *)seletedImg;

@end
