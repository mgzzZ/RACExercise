//
//  ZGMView.m
//  RACExercise
//
//  Created by YPC on 17/1/2.
//  Copyright © 2017年 mgzzZ. All rights reserved.
//

#import "ZGMView.h"
#import "AppDelegate.h"
@implementation ZGMView

- (instancetype)init
{
    self = [super init];
    if (self) {
        
        [self zgm_setupViews];
        [self zgm_bindViewModel];
    }
    return self;
}

- (instancetype)initWithViewModel:(id<ZGMViewProtocol>)viewModel {
    
    self = [super init];
    if (self) {
        
        [self zgm_setupViews];
        [self zgm_bindViewModel];
    }
    return self;
}

- (void)zgm_bindViewModel {
}

- (void)zgm_setupViews {
}

- (void)zgm_addReturnKeyBoard {
    
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] init];
    tap.numberOfTapsRequired = 1;
    tap.numberOfTouchesRequired = 1;
    [tap.rac_gestureSignal subscribeNext:^(id x) {
        
        AppDelegate *appDelegate = (AppDelegate *)[[UIApplication sharedApplication] delegate];
        [appDelegate.window endEditing:YES];
    }];
    [self addGestureRecognizer:tap];
}

@end
