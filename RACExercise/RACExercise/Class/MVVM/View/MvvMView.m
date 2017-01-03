//
//  MvvMView.m
//  RACExercise
//
//  Created by YPC on 17/1/3.
//  Copyright © 2017年 mgzzZ. All rights reserved.
//

#import "MvvMView.h"
#import "MVVMViewModel.h"
#import "MVVMCell.h"
@interface MvvMView ()<UITableViewDelegate,UITableViewDataSource>
@property (nonatomic,strong)UITableView *tableView;
@property (nonatomic,strong)MVVMViewModel *viewModel;
@end

@implementation MvvMView
- (instancetype)initWithViewModel:(id<ZGMViewModelProtocol>)viewModel{
    self.viewModel = (MVVMViewModel *)viewModel;
    return [super initWithViewModel:viewModel];
}

//约束
- (void)updateConstraints{
    self.tableView.sd_layout.spaceToSuperView(UIEdgeInsetsMake(0, 0, 0, 0));
    [super updateConstraints];
}

#pragma mark - private
- (void)zgm_setupViews {
    
    [self addSubview:self.tableView];
    [self setNeedsUpdateConstraints];
    [self updateConstraintsIfNeeded];
}

- (void)zgm_bindViewModel {
    
    [self.viewModel.refreshDataCommand execute:nil];
    
    @weakify(self);
    
    [self.viewModel.refreshUI subscribeNext:^(id x) {
        
        @strongify(self);
        [self.tableView reloadData];
    }];
    
    [self.viewModel.refreshEndSubject subscribeNext:^(id x) {
        @strongify(self);
        
        [self.tableView reloadData];
        
        switch ([x integerValue]) {
            case ZGMHeaderRefresh_HasMoreData: {
                
                [self.tableView.mj_header endRefreshing];
                
                if (self.tableView.mj_footer == nil) {
                    
                    self.tableView.mj_footer = [MJRefreshBackNormalFooter footerWithRefreshingBlock:^{
                        @strongify(self);
                        [self.viewModel.nextPageCommand execute:nil];
                    }];
                }
            }
                break;
            case ZGMHeaderRefresh_HasNoMoreData: {
                
                [self.tableView.mj_header endRefreshing];
                self.tableView.mj_footer = nil;
            }
                break;
            case ZGMFooterRefresh_HasMoreData: {
                
                [self.tableView.mj_header endRefreshing];
                [self.tableView.mj_footer resetNoMoreData];
                [self.tableView.mj_footer endRefreshing];
            }
                break;
            case ZGMFooterRefresh_HasNoMoreData: {
                [self.tableView.mj_header endRefreshing];
                [self.tableView.mj_footer endRefreshingWithNoMoreData];
            }
                break;
            case ZGMRefreshError: {
                
                [self.tableView.mj_footer endRefreshing];
                [self.tableView.mj_header endRefreshing];
            }
                break;
                
            default:
                break;
        }
    }];
}



- (NSInteger )tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.viewModel.dataArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    MVVMCell *cell = (MVVMCell *)[tableView dequeueReusableCellWithIdentifier:[NSString stringWithUTF8String:object_getClassName([MVVMCell class])] forIndexPath:indexPath];
    
    if (self.viewModel.dataArray.count > indexPath.row) {
        
        cell.viewModel = self.viewModel.dataArray[indexPath.row];
    }
    
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    return 100;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    [self.viewModel.cellClickSubject sendNext:nil];
}
- (MVVMViewModel *)viewModel{
    if (!_viewModel) {
        _viewModel = [[MVVMViewModel alloc]init];
    }
    return _viewModel;
}

- (UITableView *)tableView{
    if (_tableView == nil) {
        _tableView = [[UITableView alloc]init];
        _tableView.delegate = self;
        _tableView.dataSource = self;
        _tableView.tableFooterView = [UIView new];
        [_tableView registerClass:[MVVMCell class] forCellReuseIdentifier:[NSString stringWithUTF8String:object_getClassName([MVVMCell class])]];
        WS(weakSelf)
        _tableView.mj_header = [MJRefreshNormalHeader headerWithRefreshingBlock:^{
            
            [weakSelf.viewModel.refreshDataCommand execute:nil];
        }];
        _tableView.mj_footer = [MJRefreshAutoNormalFooter footerWithRefreshingBlock:^{
            
            [weakSelf.viewModel.nextPageCommand execute:nil];
        }];
    }
    return _tableView;
}
@end
