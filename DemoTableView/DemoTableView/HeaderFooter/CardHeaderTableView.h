//
//  CardHeaderTableView.h
//  DemoTableView
//
//  Created by Doan Dat on 8/25/17.
//  Copyright © 2017 IFI. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CardHeaderTableView : UITableViewHeaderFooterView

@property (copy, nonatomic) void(^actionShowPopover)(UIButton *button);

- (void)setupUI;


@end
