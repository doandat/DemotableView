//
//  CardDTableViewCell.m
//  DemoTableView
//
//  Created by Doan Dat on 8/22/17.
//  Copyright © 2017 IFI. All rights reserved.
//

#import "CardDTableViewCell.h"
#import "CardsContainer.h"
#import "CardDItemCollectionCell.h"

//
#import <SDWebImage/UIImageView+WebCache.h>

@interface CardDTableViewCell()<UICollectionViewDelegate, UICollectionViewDataSource>

@property (strong, nonatomic) NSArray<CardItemModel> *arrData;


@end

@implementation CardDTableViewCell

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
    pLayout.itemSize = CGSizeMake(120, 160);
    pLayout.scrollDirection = UICollectionViewScrollDirectionHorizontal;
    pLayout.minimumInteritemSpacing = 00.0f;
    pLayout.minimumLineSpacing = 10.0;

    
    [self.collectionView registerNib:[UINib nibWithNibName:NSStringFromClass([CardDItemCollectionCell class]) bundle:nil] forCellWithReuseIdentifier:NSStringFromClass([CardDItemCollectionCell class])];
    
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
    return CGSizeMake(120, 160);
}

- (UICollectionViewCell*)collectionView:(UICollectionView *)collectionView
                 cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.row >= self.arrData.count) {
        return [UICollectionViewCell new];
    }
    
    CardDItemCollectionCell *pCell = [self.collectionView dequeueReusableCellWithReuseIdentifier:NSStringFromClass([CardDItemCollectionCell class]) forIndexPath:indexPath];
    
    if (self.arrData.count > indexPath.row) {
        CardItemModel *cardItem = self.arrData[indexPath.row];
        
        pCell.lbMainText.text = cardItem.text;
        pCell.lbSubText.text = cardItem.caption;
        [pCell.imvDes sd_setImageWithURL: [NSURL URLWithString:cardItem.image] placeholderImage:nil];
    }
    
    
    return pCell;
}

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath {

}

@end
