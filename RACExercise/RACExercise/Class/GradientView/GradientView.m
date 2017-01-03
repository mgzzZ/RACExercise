//
//  GradientView.m
//  RACExercise
//
//  Created by YPC on 16/12/23.
//  Copyright © 2016年 mgzzZ. All rights reserved.
//

#import "GradientView.h"

@interface GradientView ()

@property (nonatomic,strong)UIView *bgView;
@property (nonatomic,strong)UIView *gradientView;
@property (nonatomic,strong)CAGradientLayer *gradientLayer;
@end

@implementation GradientView
- (instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        self.bgColor = [UIColor whiteColor];
        self.fillColor = [UIColor whiteColor];
        self.fromColor = [UIColor whiteColor];
        self.toColor = [UIColor whiteColor];
        [self addSubview:self.bgView];
        
    }
    return self;
}

- (void)setWidth:(CGFloat)width{
    if (_width != width) {
        _width = width;
    }
    [self addSubview:self.gradientView];
}

- (void)setFillColor:(UIColor *)fillColor{
    _fillColor = fillColor;
    self.bgView.layer.borderColor = _fillColor.CGColor;
}

- (void)setFromColor:(UIColor *)fromColor{
    if (_fromColor != fromColor) {
        _fromColor = fromColor;
    }
}

- (void)setToColor:(UIColor *)toColor{
    if (_toColor != toColor) {
        _toColor = toColor;
    }
}

- (UIView *)bgView{
    if (_bgView == nil) {
        _bgView = [[UIView alloc]init];
        _bgView.frame = self.bounds;
        _bgView.clipsToBounds = YES;
        _bgView.backgroundColor = self.bgColor;
        _bgView.layer.borderColor = self.fillColor.CGColor;
        _bgView.layer.borderWidth = 1;
        _bgView.layer.cornerRadius = self.bounds.size.height / 2;
    }
    return _bgView;
}

- (UIView *)gradientView{
    if (_gradientView == nil) {
        _gradientView = [[UIView alloc]init];
        _gradientView.frame = CGRectMake(self.bounds.origin.x + 1, self.bounds.origin.y + 1, self.width, self.bounds.size.height - 2);
        _gradientView.clipsToBounds = YES;
         [self.gradientView.layer addSublayer:self.gradientLayer];
        
        if ((self.bounds.size.width - self.width) < (self.bounds.size.height / 2)) {
            UIBezierPath *maskPath = [UIBezierPath bezierPathWithRoundedRect:_gradientView.bounds byRoundingCorners:UIRectCornerAllCorners cornerRadii:CGSizeMake(self.bounds.size.height / 2, self.bounds.size.height / 2)];
            CAShapeLayer *maskLayer = [[CAShapeLayer alloc] init];
            maskLayer.frame = _gradientView.bounds;
            maskLayer.path = maskPath.CGPath;
            _gradientView.layer.mask = maskLayer;
            _gradientView.layer.masksToBounds = YES;
        }else{
            UIBezierPath *maskPath = [UIBezierPath bezierPathWithRoundedRect:_gradientView.bounds byRoundingCorners:UIRectCornerBottomLeft | UIRectCornerTopLeft cornerRadii:CGSizeMake(self.bounds.size.height / 2, self.bounds.size.height / 2)];
            CAShapeLayer *maskLayer = [[CAShapeLayer alloc] init];
            maskLayer.frame = _gradientView.bounds;
            maskLayer.path = maskPath.CGPath;
            _gradientView.layer.mask = maskLayer;
            _gradientView.layer.masksToBounds = YES;
        }
    }
    return _gradientView;
}

- (CAGradientLayer *)gradientLayer{
    if (_gradientLayer == nil) {
        _gradientLayer = [CAGradientLayer layer];
        _gradientLayer.frame = self.gradientView.bounds;
        _gradientLayer.startPoint = CGPointMake(0, 0);
        _gradientLayer.endPoint = CGPointMake(1, 0);
        _gradientLayer.colors = @[(__bridge id)self.fromColor.CGColor,
                                      (__bridge id)self.toColor.CGColor];
        _gradientLayer.locations = @[@(0.5f), @(1.0f)];
    }
    return _gradientLayer;
}

@end
