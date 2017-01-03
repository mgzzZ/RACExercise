//
//  DelegateVC.m
//  RACExercise
//
//  Created by YPC on 16/11/26.
//  Copyright © 2016年 mgzzZ. All rights reserved.
//

#import "DelegateVC.h"
#import "GradientView.h"
#import "ZGMUILabel.h"
@interface DelegateVC ()

@end

@implementation DelegateVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    self.view.backgroundColor = [UIColor whiteColor];
    
    ZGMUILabel *lab = [[ZGMUILabel alloc]initWithTextColor:[UIColor blackColor] font:[UIFont systemFontOfSize:15] textAlignment:NSTextAlignmentLeft];
    lab.frame = CGRectMake(0, 0, 100, 100);
    lab.center = self.view.center;
    lab.text = @"123123123";
    [self.view addSubview:lab];
    
    GradientView *gradientView = [[GradientView alloc]initWithFrame:CGRectMake(100, 100, 100, 30)];
    gradientView.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:gradientView];
    gradientView.fromColor = [UIColor blueColor];
    gradientView.toColor = [UIColor blackColor];
    
    gradientView.fillColor = [UIColor redColor];
    gradientView.width = 100;
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
