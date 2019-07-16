//
//  CollectionViewController.m
//  DZNEmptyDataSetTest
//
//  Created by qing on 2017/11/21.
//  Copyright © 2017年 qing. All rights reserved.
//

#import "CollectionViewController.h"
#import "UIScrollView+EmptyDataSet.h"

@interface CollectionViewController ()<UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout,DZNEmptyDataSetSource, DZNEmptyDataSetDelegate>{
    
    NSMutableArray * _dataArray;

}

@end

@implementation CollectionViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = @"collectionView";
    
    _dataArray = [[NSMutableArray alloc]init];

    self.view.backgroundColor = [UIColor whiteColor];

    [self setUI];


}

- (void)setUI{
    
    
    self.collectionView.frame = CGRectMake(0, 64,  [UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.height-64);
    self.collectionView.backgroundColor = [UIColor whiteColor];
    self.collectionView.delegate = self;
    self.collectionView.dataSource = self;
    
    [self.collectionView registerClass:[UICollectionViewCell class] forCellWithReuseIdentifier:@"collectionCell"];
    
    [self.collectionView registerClass:[UICollectionViewCell class] forSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:@"headerCell"];
    
    [self.collectionView registerClass:[UICollectionViewCell class] forSupplementaryViewOfKind:UICollectionElementKindSectionFooter withReuseIdentifier:@"footerCell"];

    
    self.btnTitle = @"网络不给力，请点击重试哦~";

    
}


- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    
    return  _dataArray.count;
}

- (__kindof UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    
    UICollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"collectionCell" forIndexPath:indexPath];
    cell.backgroundColor = [UIColor yellowColor];
    cell.contentView.backgroundColor = [UIColor yellowColor];
    return cell;
    
    
}


- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath{
    
    return CGSizeMake(200, 200);
    
}


- (UICollectionReusableView *)collectionView:(UICollectionView *)collectionView viewForSupplementaryElementOfKind:(NSString *)kind atIndexPath:(NSIndexPath *)indexPath {
    
    //此处是headerView
    if (kind == UICollectionElementKindSectionHeader) {
        
        UICollectionReusableView *headReusableView = [self.collectionView dequeueReusableSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:@"headerCell" forIndexPath:indexPath];
        headReusableView.backgroundColor = [UIColor redColor];
        return headReusableView;
        
    }else{
        
        UICollectionReusableView * footReusableView = [self.collectionView dequeueReusableSupplementaryViewOfKind:UICollectionElementKindSectionFooter withReuseIdentifier:@"footerCell" forIndexPath:indexPath];
        footReusableView.backgroundColor = [UIColor greenColor];
        return footReusableView;
    }
}


- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout referenceSizeForHeaderInSection:(NSInteger)section{
    
    return _dataArray.count>0?CGSizeMake(375,143):CGSizeMake(375,0.5);
    
}
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout referenceSizeForFooterInSection:(NSInteger)section{
    return _dataArray.count>0?CGSizeMake(375,143):CGSizeMake(375,0.5);

}



- (void)TapLoadButtonEvent{
    
    [_dataArray addObject:@"123"];
    [_dataArray addObject:@"haha"];
    [self.collectionView reloadData];
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



@end
