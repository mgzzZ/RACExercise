//
//  DelegateVC.m
//  RACExercise
//
//  Created by YPC on 16/11/26.
//  Copyright © 2016年 mgzzZ. All rights reserved.
//

#import "DelegateVC.h"

@interface DelegateVC ()

@end

@implementation DelegateVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    self.view.backgroundColor = [UIColor whiteColor];
    if (self.subject) {
        
        [self.subject sendNext:@{@"123":@"234",@"12":@"234",@"123123":@"2342342"}];
    }
}
- (RACSubject *)subject{
    if (!_subject) {
        _subject = [RACSubject subject];
    }
    return _subject;
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
