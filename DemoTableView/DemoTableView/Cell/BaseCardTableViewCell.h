//
//  BaseCardTableViewCell.h
//  DemoTableView
//
//  Created by Doan Dat on 8/24/17.
//  Copyright © 2017 IFI. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface BaseCardTableViewCell : UITableViewCell

@property (copy, nonatomic) void(^eventSellectCell)();

@end
