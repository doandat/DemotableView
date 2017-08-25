//
//  CardHTableViewCell.h
//  DemoTableView
//
//  Created by Doan Dat on 8/23/17.
//  Copyright © 2017 IFI. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "BaseCardTableViewCell.h"

@interface CardHTableViewCell : BaseCardTableViewCell
@property (weak, nonatomic) IBOutlet UILabel *lb1;
@property (weak, nonatomic) IBOutlet UILabel *lb2;
@property (weak, nonatomic) IBOutlet UILabel *lb3;

@end
