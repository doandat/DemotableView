//
//  CardATableViewCell.h
//  DemoTableView
//
//  Created by Doan Dat on 8/21/17.
//  Copyright © 2017 IFI. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "BaseCardTableViewCell.h"

@interface CardATableViewCell : BaseCardTableViewCell

@property (weak, nonatomic) IBOutlet UILabel *lbMainText;
@property (weak, nonatomic) IBOutlet UILabel *lbSubText;
@property (weak, nonatomic) IBOutlet UILabel *lbSupplementaryText;

@end
