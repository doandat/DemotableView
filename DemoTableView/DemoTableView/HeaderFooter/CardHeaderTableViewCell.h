//
//  CardHeaderTableViewCell.h
//  DemoTableView
//
//  Created by Doan Dat on 8/21/17.
//  Copyright © 2017 IFI. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CardHeaderTableViewCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UIView *viewContain;

@property (copy, nonatomic) void(^actionShowPopover)(UIButton *button);

- (void)setupUI;

@end
