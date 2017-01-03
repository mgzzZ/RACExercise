//
//  ZGMBaseCollectionViewCell.m
//  RACExercise
//
//  Created by YPC on 17/1/3.
//  Copyright © 2017年 mgzzZ. All rights reserved.
//

#import "ZGMBaseCollectionViewCell.h"

@implementation ZGMBaseCollectionViewCell
- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        
        [self zgm_setupViews];
    }
    return self;
}

- (void)zgm_setupViews {}
@end
