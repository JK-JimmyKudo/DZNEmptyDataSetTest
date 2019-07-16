//
//  TestTableView.m
//  DZNEmptyDataSetTest
//
//  Created by power on 2019/7/10.
//  Copyright © 2019 qing. All rights reserved.
//

#import "TestTableView.h"
#import "UIScrollView+EmptyDataSet.h"

@interface TestTableView () <DZNEmptyDataSetSource, DZNEmptyDataSetDelegate,UITableViewDataSource,UITableViewDelegate>

@end

@implementation TestTableView

-(instancetype) initWithFrame:(CGRect)frame{
    
    if (self = [super initWithFrame:frame]) {
        
        
        self.dataArray = [NSMutableArray array];
        [self addSubview:self.tableView];
        
        self.tableView.emptyDataSetSource = self;
        self.tableView.emptyDataSetDelegate = self;
        
        self.tableView.backgroundColor = [UIColor redColor];
    }
    
    return self;
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    return _dataArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    UITableViewCell *cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cell"];
    
    cell.backgroundColor = [UIColor blueColor];
    
    cell.textLabel.text = _dataArray[indexPath.row];
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
}



- (void)TapLoadButtonEvent{
    
    [_dataArray addObject:@"123"];
    [_dataArray addObject:@"haha"];
    
    NSLog(@"_dataArray ==  %@",_dataArray);
    
    [self.tableView reloadData];
    
}

-(UITableView *) tableView{
    
    if (_tableView == nil) {
        _tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, [[UIScreen mainScreen] bounds].size.width, [[UIScreen mainScreen] bounds].size.height-64) style:UITableViewStylePlain];
        _tableView.dataSource = self;
        _tableView.delegate = self;
    }
    return _tableView;
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

-(void)setNoDataView{
    self.noDataTitle = @"暂无数据";
    self.noDataImgName = @"pic_zwsj";
}


@end
