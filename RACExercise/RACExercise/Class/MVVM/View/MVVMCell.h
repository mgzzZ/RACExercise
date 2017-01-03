//
//  MVVMCell.h
//  RACExercise
//
//  Created by YPC on 17/1/3.
//  Copyright © 2017年 mgzzZ. All rights reserved.
//

#import "ZGMBaseTableViewCell.h"
#import "MMVMCellViewModel.h"
@interface MVVMCell : ZGMBaseTableViewCell
@property (nonatomic, strong) MMVMCellViewModel *viewModel;
@end
