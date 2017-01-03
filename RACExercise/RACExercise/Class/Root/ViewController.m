//
//  ViewController.m
//  RACExercise
//
//  Created by YPC on 16/11/25.
//  Copyright © 2016年 mgzzZ. All rights reserved.
//

#import "ViewController.h"
#import "RACBaseExrciseVC.h"
#import "MvvMViewController.h"
@interface ViewController ()<UITableViewDelegate,UITableViewDataSource>

@property (nonatomic,strong)UITableView *tableView;

@property (nonatomic,strong)NSArray *dataArr;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    self.navigationItem.title = @"目录";
    self.view.backgroundColor = [UIColor whiteColor];
    [self.tableView reloadData];
}

#pragma mark-- tableView deledate && datasource

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.dataArr.count;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 49;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *cellID = @"Exercise";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellID];
    if (!cell) {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellID];
    }
    cell.textLabel.text = self.dataArr[indexPath.row];
    [cell setSelectionStyle:UITableViewCellSelectionStyleNone];
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
   
    switch (indexPath.row) {
        case 0:
        {
            RACBaseExrciseVC *baseexrciseVC = [[RACBaseExrciseVC alloc]init];
            [self.navigationController pushViewController:baseexrciseVC animated:YES];
        }
            break;
        case 1:{
            MvvMViewController *mvvm = [[MvvMViewController alloc]init];
            [self.navigationController pushViewController:mvvm animated:YES];
        }
            break;
            
        default:
            break;
    }
}

#pragma mark-- lazy loading
- (UITableView *)tableView{
    if (!_tableView) {
        _tableView = [[UITableView alloc]init];
        _tableView.delegate = self;
        _tableView.dataSource = self;
        [self.view addSubview:_tableView];
        self.tableView.sd_layout.spaceToSuperView(UIEdgeInsetsMake(0, 0, 0, 0));
        self.tableView.tableFooterView = [UIView new];
    }
    return _tableView;
}

- (NSArray *)dataArr{
    if (!_dataArr) {
        _dataArr = @[@"BaseExercise",@"MVVM"];
    }
    return _dataArr;
}

#pragma mark-- end

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
