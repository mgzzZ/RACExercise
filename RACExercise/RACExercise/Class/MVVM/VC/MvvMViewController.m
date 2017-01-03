//
//  MvvMViewController.m
//  RACExercise
//
//  Created by YPC on 17/1/3.
//  Copyright © 2017年 mgzzZ. All rights reserved.
//

#import "MvvMViewController.h"
#import "MvvMView.h"
#import "MVVMViewModel.h"
#import "RACBaseExrciseVC.h"
@interface MvvMViewController ()
@property (nonatomic,strong)MvvMView *mainView;
@property (nonatomic,strong)MVVMViewModel *viewModel;
@end

@implementation MvvMViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}
- (void)updateViewConstraints {
    
    self.mainView.frame = self.view.bounds;
    
    [super updateViewConstraints];
}
#pragma mark - private
- (void)zgm_addSubviews {
    
    [self.view addSubview:self.mainView];
}

- (void)zgm_bindViewModel {
    
    @weakify(self);
    [[self.viewModel.cellClickSubject takeUntil:self.rac_willDeallocSignal] subscribeNext:^(id x) {
        
        @strongify(self);
        RACBaseExrciseVC *circleMainVC = [[RACBaseExrciseVC alloc] init];
        [self.navigationController pushViewController:circleMainVC animated:YES];
    }];
}
- (void)zgm_layoutNavigation {
    
    self.title = @"圈子列表";
}

#pragma mark - layzLoad
- (MvvMView *)mainView {
    
    if (!_mainView) {
        
        _mainView = [[MvvMView alloc] initWithViewModel:self.viewModel];
    }
    
    return _mainView;
}

- (MVVMViewModel *)viewModel {
    
    if (!_viewModel) {
        
        _viewModel = [[MVVMViewModel alloc] init];
    }
    
    return _viewModel;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
