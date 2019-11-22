//
//  ViewController.m
//  DZNEmptyDataSetTest
//
//  Created by qing on 2017/11/21.
//  Copyright © 2017年 qing. All rights reserved.
//

#import "ViewController.h"
#import "TableViewController.h"
#import "CollectionViewController.h"
#import "TestViewController.h"
@interface ViewController ()<UITableViewDelegate,UITableViewDataSource>{
    NSArray *_dataArray;
    
}

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    _dataArray = @[@"tableView",@"collectionView",@"testView"];
    
    [self setUI];


}

- (void)setUI{
    
    UITableView *tableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 64, [UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.height)];
    tableView.delegate = self;
    tableView.dataSource = self;
    tableView.rowHeight = 60;
    tableView.tableFooterView = [UIView new];
    [self.view addSubview:tableView];
    
    
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    return _dataArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    UITableViewCell *cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cell"];
    cell.textLabel.text = _dataArray[indexPath.row];
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    if (indexPath.row==0) {
        TableViewController *tableViewCtrl = [[TableViewController alloc]init];
        [self.navigationController pushViewController:tableViewCtrl animated:YES];
    }if (indexPath.row==1) {
        CollectionViewController *ViewCtrl = [[CollectionViewController alloc]init];
        [self.navigationController pushViewController:ViewCtrl animated:YES];
    }if (indexPath.row==2) {
        NSLog(@"=====");
        TestViewController *ViewCtrl = [[TestViewController alloc]init];
        [self.navigationController pushViewController:ViewCtrl animated:YES];
    }
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
