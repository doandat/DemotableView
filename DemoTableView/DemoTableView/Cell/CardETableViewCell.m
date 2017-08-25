//
//  CardETableViewCell.m
//  DemoTableView
//
//  Created by Doan Dat on 8/22/17.
//  Copyright © 2017 IFI. All rights reserved.
//

#import "CardETableViewCell.h"
#import "CardsContainer.h"
#import "CardEItemCollectionCell.h"

@interface CardETableViewCell()<UICollectionViewDelegate, UICollectionViewDataSource>

@property (strong, nonatomic) NSArray<CardItemModel> *arrData;


@end

@implementation CardETableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
    
    [self setupCollectionView];
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];
    
    // Configure the view for the selected state
}

- (void)setDataItem:(NSArray<CardItemModel> *)arrDataModel {
    self.arrData = arrDataModel;
    [self.collectionView reloadData];
}


/////
- (void)setupCollectionView {
    UICollectionViewFlowLayout *pLayout = (UICollectionViewFlowLayout*)self.collectionView.collectionViewLayout;
    pLayout.sectionInset = UIEdgeInsetsMake(0.0f, 0.0f, 0.0f, 0.0f);
    pLayout.itemSize = CGSizeMake(60, 100);
    pLayout.scrollDirection = UICollectionViewScrollDirectionHorizontal;
    pLayout.minimumInteritemSpacing = 00.0f;
    pLayout.minimumLineSpacing = 10.0;
    
    
    [self.collectionView registerNib:[UINib nibWithNibName:NSStringFromClass([CardEItemCollectionCell class]) bundle:nil] forCellWithReuseIdentifier:NSStringFromClass([CardEItemCollectionCell class])];
    
    self.collectionView.delegate = self;
    self.collectionView.dataSource = self;
    
    //    self.collectionView.backgroundColor = UIColor.whiteColor;
    self.collectionView.showsHorizontalScrollIndicator = NO;
    
    [self.collectionView reloadData];
}

#pragma mark - Collection view datasource & delegate

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    return 1;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView
     numberOfItemsInSection:(NSInteger)section {
    return self.arrData.count;
}

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath {
    return CGSizeMake(60, 100);
}

- (UICollectionViewCell*)collectionView:(UICollectionView *)collectionView
                 cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.row >= self.arrData.count) {
        return [UICollectionViewCell new];
    }
    
    CardEItemCollectionCell *pCell = [self.collectionView dequeueReusableCellWithReuseIdentifier:NSStringFromClass([CardEItemCollectionCell class]) forIndexPath:indexPath];
    
    if (self.arrData.count > indexPath.row) {
        CardItemModel *cardItem = self.arrData[indexPath.row];
        
        pCell.lbMainText.text = cardItem.text;
    }
    
    
    return pCell;
}

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    
}

@end

