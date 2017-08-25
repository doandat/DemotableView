//
//  CardDItemCollectionCell.h
//  DemoTableView
//
//  Created by Doan Dat on 8/22/17.
//  Copyright © 2017 IFI. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CardDItemCollectionCell : UICollectionViewCell

@property (weak, nonatomic) IBOutlet UIImageView *imvDes;
@property (weak, nonatomic) IBOutlet UILabel *lbMainText;
@property (weak, nonatomic) IBOutlet UILabel *lbSubText;

@end
