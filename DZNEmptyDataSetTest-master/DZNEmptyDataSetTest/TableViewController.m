//
//  TableViewController.m
//  DZNEmptyDataSetTest
//
//  Created by qing on 2017/11/21.
//  Copyright © 2017年 qing. All rights reserved.
//

#import "TableViewController.h"

@interface TableViewController ()<UITableViewDataSource,UITableViewDelegate>{
    
    NSMutableArray * _dataArray;
}

@end

@implementation TableViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    self.view.backgroundColor = [UIColor whiteColor];
    self.title = @"tableView";
    
    _dataArray = [[NSMutableArray alloc]init];
    
    [self setUI];

}

- (void)setUI{
    
    self.tableView.frame =CGRectMake(0, 100, [[UIScreen mainScreen] bounds].size.width, [[UIScreen mainScreen] bounds].size.height-64);
    [self setNoDataView];
    

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
      NSLog(@"didSelectRowAtIndexPath");
}



- (void)TapLoadButtonEvent{
    
    [_dataArray addObject:@"123"];
    [_dataArray addObject:@"haha"];
    [_dataArray addObject:@"haha"];
    [_dataArray addObject:@"haha"];
    [_dataArray addObject:@"haha"];
    [_dataArray addObject:@"haha"];
    [_dataArray addObject:@"haha"];
    [_dataArray addObject:@"haha"];
    [_dataArray addObject:@"haha"];
    [_dataArray addObject:@"haha"];
    [_dataArray addObject:@"haha"];
    [_dataArray addObject:@"haha"];
    [_dataArray addObject:@"haha"];
    [_dataArray addObject:@"haha"];
    [_dataArray addObject:@"haha"];
    [_dataArray addObject:@"haha"];
    [_dataArray addObject:@"haha"];
    [_dataArray addObject:@"haha"];
    [_dataArray addObject:@"haha"];
    [_dataArray addObject:@"haha"];

    [self.tableView reloadData];

}







@end
