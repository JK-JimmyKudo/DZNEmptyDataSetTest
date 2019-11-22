//
//  XLBaseTableController.m
//  EmptyDataHandle
//
//  Created by apple on 17/1/23.
//  Copyright © 2017年 ZXL. All rights reserved.
//

#import "XLBaseTableController.h"
#import "UIScrollView+EmptyDataSet.h"
#import <MJRefresh.h>

@interface XLBaseTableController () <DZNEmptyDataSetSource, DZNEmptyDataSetDelegate,UITableViewDataSource,UITableViewDelegate>


{
    NSMutableArray * _dataArray;

}

@end

@implementation XLBaseTableController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    _dataArray = [[NSMutableArray alloc]init];
    
    self.isShowEmptyData = YES;
    
    [self.view addSubview:self.tableView];
    
    self.tableView.emptyDataSetSource = self;
    self.tableView.emptyDataSetDelegate = self;
    
    self.tableView.mj_header = [MJRefreshNormalHeader headerWithRefreshingTarget:self refreshingAction:@selector(headerRefreshing)];
    self.tableView.mj_footer = [MJRefreshAutoNormalFooter footerWithRefreshingTarget:self refreshingAction:@selector(footerRefreshing)];
        
}

-(UIImage *)imageForEmptyDataSet:(UIScrollView *)scrollView
{
    if (self.noDataImgName) {
        return [UIImage imageNamed:self.noDataImgName];
    }
    return [UIImage imageNamed:@"change-tx@2x"];
}

- (NSAttributedString *)titleForEmptyDataSet:(UIScrollView *)scrollView
{

    NSDictionary *attributes = @{NSFontAttributeName: [UIFont boldSystemFontOfSize:16.0f],
                                 NSForegroundColorAttributeName: [UIColor grayColor]};

    return self.noDataTitle?[[NSAttributedString alloc] initWithString:self.noDataTitle attributes:attributes]:nil;
}

- (NSAttributedString *)descriptionForEmptyDataSet:(UIScrollView *)scrollView
{
    NSString *text = self.noDataDetailTitle;

    NSMutableParagraphStyle *paragraph = [NSMutableParagraphStyle new];
    paragraph.lineBreakMode = NSLineBreakByWordWrapping;
    paragraph.alignment = NSTextAlignmentCenter;

    NSDictionary *attributes = @{NSFontAttributeName: [UIFont systemFontOfSize:14.0f],
                                 NSForegroundColorAttributeName: [UIColor lightGrayColor],
                                 NSParagraphStyleAttributeName: paragraph};

    return self.noDataDetailTitle?[[NSAttributedString alloc] initWithString:text attributes:attributes]:nil;
}

- (BOOL)emptyDataSetShouldAllowTouch:(UIScrollView *)scrollView
{
    return YES;
}

- (BOOL)emptyDataSetShouldDisplay:(UIScrollView *)scrollView
{
    return self.isShowEmptyData;
}

- (CGFloat)verticalOffsetForEmptyDataSet:(UIScrollView *)scrollView
{
    return -self.tableView.tableHeaderView.frame.size.height/2.0f;
}

- (NSAttributedString *)buttonTitleForEmptyDataSet:(UIScrollView *)scrollView forState:(UIControlState)state
{
    NSString *text = self.btnTitle?self.btnTitle:nil;
    NSMutableAttributedString *attStr = nil;
    if (self.btnTitle) {
        attStr = [[NSMutableAttributedString alloc] initWithString:text];
//        // 设置所有字体大小为 #17
//        [attStr addAttribute:NSFontAttributeName
//                       value:[UIFont systemFontOfSize:17.0]
//                       range:NSMakeRange(0, text.length)];
//        // 设置所有字体颜色为浅灰色
//        [attStr addAttribute:NSForegroundColorAttributeName
//                       value:[UIColor lightGrayColor]
//                       range:NSMakeRange(0, text.length)];
//        // 设置指定4个字体为蓝色
//        [attStr addAttribute:NSForegroundColorAttributeName
//                       value:[UIColor colorWithRed:87/255.0 green:162/255.0 blue:252/255.0 alpha:1]
//                       range:NSMakeRange(7, 4)];
//
    }
    return attStr;
}

- (UIImage *)buttonImageForEmptyDataSet:(UIScrollView *)scrollView forState:(UIControlState)state
{
    return self.btnImgName?[UIImage imageNamed:self.btnImgName]:nil;
}

- (void)emptyDataSet:(UIScrollView *)scrollView didTapView:(UIView *)view{
    
    
    [self TapLoadButtonEvent];
}

- (void)emptyDataSet:(UIScrollView *)scrollView didTapButton:(UIButton *)button
{
    [self TapLoadButtonEvent];
}

#pragma mark 按钮事件
-(void)TapLoadButtonEvent
{
    
}


-(void)headerRefreshing{
    
    [self.tableView.mj_footer resetNoMoreData];
    
    [self TapLoadButtonEvent];
}

-(void)footerRefreshing{
    [self TapLoadButtonEvent];
}

-(void)setNoDataView{
    self.noDataTitle = @"暂无数据";
    self.noDataImgName = @"pic_zwsj";
    
}


-(void)endRefreshing{
    [self.tableView.mj_header endRefreshing];
    [self.tableView.mj_footer endRefreshing];
}


-(UITableView *)tableView
{
    if(_tableView == nil)
    {
        _tableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 0, [[UIScreen mainScreen] bounds].size.width, [[UIScreen mainScreen] bounds].size.height) style:UITableViewStylePlain];
        _tableView.dataSource = self;
        _tableView.delegate = self;
        _tableView.tableFooterView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, [[UIScreen mainScreen] bounds].size.width, 1)];
        _tableView.tableHeaderView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, [[UIScreen mainScreen] bounds].size.width, 1)];
        _tableView.showsVerticalScrollIndicator = NO;
        _tableView.showsHorizontalScrollIndicator = NO;
        if (@available(iOS 11.0, *)) {
            _tableView.contentInsetAdjustmentBehavior = UIScrollViewContentInsetAdjustmentNever;
            _tableView.contentInset = UIEdgeInsetsMake(0, 0, 0, 0);//导航栏如果使用系统原生半透明的，top设置为64
            _tableView.scrollIndicatorInsets = _tableView.contentInset;
        }else {
            self.automaticallyAdjustsScrollViewInsets = NO;
        }
    }
    return _tableView;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    return _dataArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    UITableViewCell *cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cell"];
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
}



@end
