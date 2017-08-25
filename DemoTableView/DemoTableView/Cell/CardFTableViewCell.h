//
//  CardFTableViewCell.h
//  DemoTableView
//
//  Created by Doan Dat on 8/23/17.
//  Copyright © 2017 IFI. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "BaseCardTableViewCell.h"

@interface CardFTableViewCell : BaseCardTableViewCell

@property (weak, nonatomic) IBOutlet UIImageView *imvDes;

@property (weak, nonatomic) IBOutlet UILabel *lbMainText;
@property (weak, nonatomic) IBOutlet UILabel *lbSubText;
@property (weak, nonatomic) IBOutlet UILabel *lbSupText;

@property (weak, nonatomic) IBOutlet NSLayoutConstraint *constraintMaxHeightImv;

@end
