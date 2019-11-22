//
//  TestViewController.m
//  DZNEmptyDataSetTest
//
//  Created by power on 2019/7/10.
//  Copyright © 2019 qing. All rights reserved.
//

#import "TestViewController.h"

@interface TestViewController ()<UITableViewDataSource,UITableViewDelegate>{
    
    NSMutableArray * _dataArray;
}


@end

@implementation TestViewController


- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    
    _dataArray = [[NSMutableArray alloc]init];
    
    
    self.tableView.frame =CGRectMake(0, 0, [[UIScreen mainScreen] bounds].size.width, [[UIScreen mainScreen] bounds].size.height);
    self.tableView.dataSource = self;
    self.tableView.delegate = self;
    
    [self setNoDataView];
    
    
//    [TtableView setNoDataView];
}

-(void)TapLoadButtonEvent{
    
 
    
    
    
}



@end
