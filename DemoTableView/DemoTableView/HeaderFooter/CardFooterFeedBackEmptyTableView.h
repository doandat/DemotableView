//
//  CardFooterFeedBackEmptyTableView.h
//  DemoTableView
//
//  Created by Doan Dat on 8/30/17.
//  Copyright © 2017 IFI. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CardFooterFeedBackEmptyTableView : UITableViewHeaderFooterView

@property (weak, nonatomic) IBOutlet UIButton *btnUseful;
@property (weak, nonatomic) IBOutlet UIButton *btnNoInterest;

- (void)setupUI;


@end
