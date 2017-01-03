//
//  ZGMViewModel.m
//  RACExercise
//
//  Created by YPC on 17/1/3.
//  Copyright © 2017年 mgzzZ. All rights reserved.
//

#import "ZGMViewModel.h"

@implementation ZGMViewModel
+ (instancetype)allocWithZone:(struct _NSZone *)zone {
    
    ZGMViewModel *viewModel = [super allocWithZone:zone];
    
    if (viewModel) {
        
        [viewModel zgm_initialize];
    }
    return viewModel;
}

- (instancetype)initWithModel:(id)model {
    
    self = [super init];
    if (self) {
    }
    return self;
}

//- (CMRequest *)request {
//    
//    if (!_request) {
//        
//        _request = [CMRequest request];
//    }
//    return _request;
//}

- (void)zgm_initialize {}
@end
