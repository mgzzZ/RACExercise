//
//  ZGMBaseTableViewCellProtocol.h
//  RACExercise
//
//  Created by YPC on 17/1/3.
//  Copyright © 2017年 mgzzZ. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol ZGMBaseTableViewCellProtocol <NSObject>
@optional

- (void)zgm_setupViews;
- (void)zgm_bindViewModel;

@end
