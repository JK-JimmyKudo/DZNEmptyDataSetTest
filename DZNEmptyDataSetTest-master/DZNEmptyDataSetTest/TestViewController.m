//
//  TestViewController.m
//  DZNEmptyDataSetTest
//
//  Created by power on 2019/7/10.
//  Copyright © 2019 qing. All rights reserved.
//

#import "TestViewController.h"
#import "TestTableView.h"
@interface TestViewController ()<UITableViewDataSource,UITableViewDelegate>{
    
    NSMutableArray * _dataArray;
}

@property (nonatomic,strong)  TestTableView *TtableView;

@end

@implementation TestViewController


- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    
    _dataArray = [[NSMutableArray alloc]init];
    
    TestTableView *TtableView = [[TestTableView alloc] initWithFrame:CGRectMake(0, 0, self.view.bounds.size.width, self.view.bounds.size.height)];
    [self.view addSubview:TtableView];
    
    self.TtableView = TtableView;
    
    self.TtableView.hidden = YES;
    
    
    self.tableView.frame =CGRectMake(0, 64, [[UIScreen mainScreen] bounds].size.width, [[UIScreen mainScreen] bounds].size.height-64);
    self.tableView.dataSource = self;
    self.tableView.delegate = self;
    
    [self setNoDataView];
    
    
//    [TtableView setNoDataView];
}

-(void)TapLoadButtonEvent{
    
    self.TtableView.hidden = NO;
    self.tableView.hidden = YES;
    
    
    
}



@end
