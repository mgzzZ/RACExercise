//
//  RACBaseExrciseVC.m
//  RACExercise
//
//  Created by YPC on 16/11/25.
//  Copyright © 2016年 mgzzZ. All rights reserved.
//

#import "RACBaseExrciseVC.h"

@interface RACBaseExrciseVC ()
@property (strong, nonatomic) IBOutlet UILabel *textLab;
@property (strong, nonatomic) IBOutlet UIButton *clickBtn;
@property (strong, nonatomic) IBOutlet UITextField *textField;

@end

@implementation RACBaseExrciseVC
- (void)dealloc{
    //这种简单操作 不用对self进行强弱引用也不会造成内存泄漏
    NSLog(@"没有泄露");
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    self.view.backgroundColor = [UIColor whiteColor];
    self.navigationItem.title = @"基础练习";
    [self text1];
    [self text2];
    [self text3];
}
- (void)text1{
    //lab 绑定 textField
    RAC(self.textLab,text) = [self.textField rac_textSignal];
}
- (void)text2{
    //textField 绑定btn
    //长度大于10 按钮可以点击
    RAC(self.clickBtn,enabled) = [[self.textField rac_textSignal] map:^id(NSString * value) {
        if (value.length > 10) {
            return [NSNumber numberWithBool:YES];
            
        }else{
            return [NSNumber numberWithBool:NO];
        }
    }];
    //长度大于10 按钮变色
    RAC(self.clickBtn,backgroundColor) = [[self.textField rac_textSignal] map:^id(NSString * value) {
        if (value.length > 10) {
            return [UIColor redColor];
            
        }else{
            return [UIColor grayColor];
        }
    }];
    
    
    
}

- (void)text3{
    //监听按钮点击方法
    [[self.clickBtn rac_signalForControlEvents:UIControlEventTouchUpInside] subscribeNext:^(id x) {
        NSLog(@"点击");
    }];
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
