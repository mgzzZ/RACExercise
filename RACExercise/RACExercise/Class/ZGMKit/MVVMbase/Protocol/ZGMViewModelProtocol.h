//
//  ZGMViewModelProtocol.h
//  RACExercise
//
//  Created by YPC on 17/1/3.
//  Copyright © 2017年 mgzzZ. All rights reserved.
//

#import <Foundation/Foundation.h>
typedef enum : NSUInteger {
    ZGMHeaderRefresh_HasMoreData = 1,
    ZGMHeaderRefresh_HasNoMoreData,
    ZGMFooterRefresh_HasMoreData,
    ZGMFooterRefresh_HasNoMoreData,
    ZGMRefreshError,
    ZGMRefreshUI,
} ZGMRefreshDataStatus;
@protocol ZGMViewModelProtocol <NSObject>
- (instancetype)initWithModel:(id)model;

//@property (strong, nonatomic)CMRequest *request;

/**
 *  初始化
 */
- (void)zgm_initialize;
@end
