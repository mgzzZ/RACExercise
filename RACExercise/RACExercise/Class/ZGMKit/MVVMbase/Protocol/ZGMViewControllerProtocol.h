//
//  ZGMViewControllerProtocol.h
//  RACExercise
//
//  Created by YPC on 17/1/2.
//  Copyright © 2017年 mgzzZ. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ZGMViewModelProtocol.h"
@protocol ZGMViewModelProtocol;

@protocol ZGMViewControllerProtocol <NSObject>

@optional
- (instancetype)initWithViewModel:(id <ZGMViewModelProtocol>)viewModel;

- (void)zgm_bindViewModel;
- (void)zgm_addSubviews;
- (void)zgm_layoutNavigation;
- (void)zgm_getNewData;
- (void)recoverKeyboard;
@end
