//
//  CardDTableViewCell.h
//  DemoTableView
//
//  Created by Doan Dat on 8/22/17.
//  Copyright © 2017 IFI. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "BaseCardTableViewCell.h"
@class CardItemModel;

@interface CardDTableViewCell : BaseCardTableViewCell

@property (weak, nonatomic) IBOutlet UICollectionView *collectionView;

- (void)setDataItem:(NSArray<CardItemModel *> *)arrDataModel;

@end
