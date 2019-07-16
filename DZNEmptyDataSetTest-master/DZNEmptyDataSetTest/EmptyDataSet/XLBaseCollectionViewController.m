//
//  XLBaseCollectionViewController.m
//  DZNEmptyDataSetTest
//
//  Created by qing on 2017/11/21.
//  Copyright © 2017年 qing. All rights reserved.
//

#import "XLBaseCollectionViewController.h"
#import "UIScrollView+EmptyDataSet.h"

@interface XLBaseCollectionViewController ()<DZNEmptyDataSetSource, DZNEmptyDataSetDelegate>

@end

@implementation XLBaseCollectionViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    self.isShowEmptyData = YES;

    [self.view addSubview:self.collectionView];

    self.collectionView.emptyDataSetSource = self;
    self.collectionView.emptyDataSetDelegate = self;

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
    return -0.5;
}

- (NSAttributedString *)buttonTitleForEmptyDataSet:(UIScrollView *)scrollView forState:(UIControlState)state
{
    NSString *text = self.btnTitle?self.btnTitle:nil;
    NSMutableAttributedString *attStr = nil;
    if (self.btnTitle) {
        attStr = [[NSMutableAttributedString alloc] initWithString:text];
        // 设置所有字体大小为 #17
        [attStr addAttribute:NSFontAttributeName
                       value:[UIFont systemFontOfSize:17.0]
                       range:NSMakeRange(0, text.length)];
        // 设置所有字体颜色为浅灰色
        [attStr addAttribute:NSForegroundColorAttributeName
                       value:[UIColor lightGrayColor]
                       range:NSMakeRange(0, text.length)];
        // 设置指定4个字体为蓝色
        [attStr addAttribute:NSForegroundColorAttributeName
                       value:[UIColor colorWithRed:87/255.0 green:162/255.0 blue:252/255.0 alpha:1]
                       range:NSMakeRange(7, 4)];
        
    }
    return attStr;
}

- (UIImage *)buttonImageForEmptyDataSet:(UIScrollView *)scrollView forState:(UIControlState)state
{
    return self.btnImgName?[UIImage imageNamed:self.btnImgName]:nil;
}

- (void)emptyDataSet:(UIScrollView *)scrollView didTapButton:(UIButton *)button
{
    [self TapLoadButtonEvent];
}

#pragma mark 按钮事件
-(void)TapLoadButtonEvent
{
    
}

-(UICollectionView *)collectionView
{
    if(_collectionView == nil)
    {
        
        UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc]init];
        layout.headerReferenceSize = CGSizeMake([UIScreen mainScreen].bounds.size.width, 1);

        _collectionView = [[UICollectionView alloc]initWithFrame:CGRectZero collectionViewLayout:layout];
        
        _collectionView.showsVerticalScrollIndicator = NO;
        _collectionView.showsHorizontalScrollIndicator = NO;
    }
    
    return _collectionView;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}


@end
