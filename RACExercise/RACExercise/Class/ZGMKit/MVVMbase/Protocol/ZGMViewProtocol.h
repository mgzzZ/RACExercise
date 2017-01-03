//
//  ZGMViewProtocol.h
//  RACExercise
//
//  Created by YPC on 17/1/2.
//  Copyright © 2017年 mgzzZ. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ZGMViewModelProtocol.h"

@protocol ZGMViewModelProtocol;

@protocol ZGMViewProtocol <NSObject>

@optional

- (instancetype)initWithViewModel:(id <ZGMViewModelProtocol>)viewModel;

- (void)zgm_bindViewModel;
- (void)zgm_setupViews;
- (void)zgm_addReturnKeyBoard;
@end
