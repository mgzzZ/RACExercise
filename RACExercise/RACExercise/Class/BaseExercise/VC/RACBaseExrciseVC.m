//
//  RACBaseExrciseVC.m
//  RACExercise
//
//  Created by YPC on 16/11/25.
//  Copyright © 2016年 mgzzZ. All rights reserved.
//

#import "RACBaseExrciseVC.h"
#import "DelegateVC.h"

@interface RACBaseExrciseVC ()
@property (strong, nonatomic) IBOutlet UILabel *textLab;
@property (strong, nonatomic) IBOutlet UIButton *clickBtn;
@property (strong, nonatomic) IBOutlet UITextField *textField;
@property (nonatomic ,strong) UIAlertView *alert;
@property (strong, nonatomic) IBOutlet UITextField *textfield2;

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
    [self text5];
    [self text3];
}
- (void)text1{
    //lab 绑定 textField
    RAC(self.textLab,text) = [[self.textField rac_textSignal] map:^id(NSString * value) {
        if (value.length < 10) {
            return value;
        }else{
            return  [value substringToIndex:10];
        }
    }];
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
    @weakify(self);

    [[self.clickBtn rac_signalForControlEvents:UIControlEventTouchUpInside] subscribeNext:^(id x) {
        DelegateVC *delegate = [[DelegateVC alloc]init];
        // 代替代理 Block 返回传值
         @strongify(self);
        [delegate.subject subscribeNext:^(NSDictionary * x) {
           @strongify(self);
            [self text4:x[@"12"]];
        }];
        [self.navigationController pushViewController:delegate animated:YES];
    }];
    //每层Block下都要使用一次strong  才不会有泄露
}

- (void)text4:(NSString *)dic{
    self.alert = [[UIAlertView alloc]initWithTitle:@"RAC" message:dic delegate:self cancelButtonTitle:@"取消" otherButtonTitles:@"确认", nil];
    [self.alert show];
    [[self rac_signalForSelector:@selector(alertView:clickedButtonAtIndex:) fromProtocol:@protocol(UIAlertViewDelegate)] subscribeNext:^(RACTuple *x) {
        NSLog(@"%@",x.first);
        NSLog(@"%@",x.second);//确认 取消的坐标
        NSLog(@"%@",x.third);
    }];
}

// 同时绑定多个信号
- (void)text5{

    RACSignal *combinSigal = [RACSignal combineLatest:@[self.textField.rac_textSignal,self.textfield2.rac_textSignal] reduce:^id(NSString *text1,NSString *text2){
        return @((text1.length >= 6 && text1.length <= 18) && (text2.length >= 6 && text2.length <= 18));
    }];
    //第一种写法 可以监听多个属性值
   @weakify(self);
    [combinSigal subscribeNext:^(NSNumber *x) {
        @strongify(self);
        if (x.boolValue == YES) {
            self.clickBtn.backgroundColor = [UIColor redColor];
        }else{
            self.clickBtn.backgroundColor = [UIColor whiteColor];
        }
        self.clickBtn.enabled = x.boolValue;
    }];
    //第二种方法 方便 监听一个属性值
    //RAC(self.clickBtn,enabled) = combinSigal;
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
