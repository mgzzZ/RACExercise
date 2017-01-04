//
//  MVVMViewModel.m
//  RACExercise
//
//  Created by YPC on 17/1/3.
//  Copyright © 2017年 mgzzZ. All rights reserved.
//

#import "MVVMViewModel.h"
#import "MMVMCellViewModel.h"
#import "YPCNetworking.h"
#import "GuessModel.h"
@interface MVVMViewModel ()
@property (nonatomic, assign) NSInteger currentPage;
@end

@implementation MVVMViewModel
- (void)zgm_initialize {
    @weakify(self);
    [self.refreshDataCommand.executionSignals.switchToLatest subscribeNext:^(NSDictionary *dict) {
        @strongify(self);
        NSMutableArray *arr = [GuessModel mj_objectArrayWithKeyValuesArray:dict];
        NSMutableArray *reArray = [[NSMutableArray alloc] init];
        for (int i = 0; i < arr.count; i++) {
            GuessModel *model =arr[i];
            MMVMCellViewModel *viewModel = [[MMVMCellViewModel alloc] initWithModel:model];
            viewModel.headerImageStr = model.goods_image;
            viewModel.name = model.goods_name;
            viewModel.articleNum = @"1568";
            viewModel.peopleNum = @"568";
            viewModel.topicNum = @"5749";
            viewModel.content = model.goods_price;
            [reArray addObject:viewModel];
        }
        self.dataArray = reArray;
        [self.refreshEndSubject sendNext:@(ZGMHeaderRefresh_HasMoreData)];
       
    }];
    
    
    [[[self.refreshDataCommand.executing skip:1] take:1] subscribeNext:^(id x) {
        
        if ([x isEqualToNumber:@(YES)]) {
            
            NSLog(@"正在加载");
        }
    }];
    
    [self.nextPageCommand.executionSignals.switchToLatest subscribeNext:^(NSDictionary *dict) {
        @strongify(self);
        NSMutableArray *arr = [GuessModel mj_objectArrayWithKeyValuesArray:dict];
        NSMutableArray *reArray = [[NSMutableArray alloc] initWithArray:self.dataArray];
        for (int i = 0; i < arr.count; i++) {
            GuessModel *model =arr[i];
            MMVMCellViewModel *viewModel = [[MMVMCellViewModel alloc] initWithModel:model];
            viewModel.headerImageStr = model.goods_image;
            viewModel.name = model.goods_name;
            viewModel.articleNum = @"1568";
            viewModel.peopleNum = @"568";
            viewModel.topicNum = @"5749";
            viewModel.content = model.goods_price;
            [reArray addObject:viewModel];
        }
        self.dataArray = reArray;
        [self.refreshEndSubject sendNext:@(ZGMFooterRefresh_HasMoreData)];
        
    }];
    
}

- (RACSubject *)refreshUI {
    
    if (!_refreshUI) {
        
        _refreshUI = [RACSubject subject];
    }
    
    return _refreshUI;
}

- (RACSubject *)refreshEndSubject {
    
    if (!_refreshEndSubject) {
        
        _refreshEndSubject = [RACSubject subject];
    }
    
    return _refreshEndSubject;
}

- (RACCommand *)refreshDataCommand {
    
    if (!_refreshDataCommand) {
        
        @weakify(self);
        _refreshDataCommand = [[RACCommand alloc] initWithSignalBlock:^RACSignal *(id input) {
            
            @strongify(self);
            return [RACSignal createSignal:^RACDisposable *(id<RACSubscriber> subscriber) {
                
                @strongify(self);
                self.currentPage = 1;
                [YPCNetworking postWithUrl:@"shop/goods/guesslist"
                              refreshCache:YES
                                    params:@{
                                             @"pagination":@{
                                                     @"count":@"10",
                                                     @"page":[NSString stringWithFormat:@"%zd",self.currentPage]
                                                     }
                                             }
                                   success:^(id response) {
                
                                       [subscriber sendNext:response[@"data"]];
                                       [subscriber sendCompleted];
                                   }
                                      fail:^(NSError *error) {
                                          [subscriber sendCompleted];
                                      }];
//
               return nil;
            }];
        }];
    }
    
    return _refreshDataCommand;
}

- (RACCommand *)nextPageCommand {
    
    if (!_nextPageCommand) {
        
        @weakify(self);
        _nextPageCommand = [[RACCommand alloc] initWithSignalBlock:^RACSignal *(id input) {
            
            @strongify(self);
            return [RACSignal createSignal:^RACDisposable *(id<RACSubscriber> subscriber) {
                
                @strongify(self);
                self.currentPage ++;
                [YPCNetworking postWithUrl:@"shop/goods/guesslist"
                              refreshCache:YES
                                    params:@{
                                             @"pagination":@{
                                                     @"count":@"10",
                                                     @"page":[NSString stringWithFormat:@"%zd",self.currentPage]
                                                     }
                                             }
                                   success:^(id response) {
                                       
                                       [subscriber sendNext:response[@"data"]];
                                       [subscriber sendCompleted];
                                   }
                                      fail:^(NSError *error) {
                                          [subscriber sendCompleted];
                                      }];
                
                return nil;
            }];
        }];
    }
    
    return _nextPageCommand;
}


- (NSArray *)dataArray {
    
    if (!_dataArray) {
        
        _dataArray = [[NSArray alloc] init];
    }
    
    return _dataArray;
}

- (RACSubject *)cellClickSubject {
    
    if (!_cellClickSubject) {
        
        _cellClickSubject = [RACSubject subject];
    }
    
    return _cellClickSubject;
}

@end
