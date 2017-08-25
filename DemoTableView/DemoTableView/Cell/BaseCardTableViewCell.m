//
//  BaseCardTableViewCell.m
//  DemoTableView
//
//  Created by Doan Dat on 8/24/17.
//  Copyright © 2017 IFI. All rights reserved.
//

#import "BaseCardTableViewCell.h"

@implementation BaseCardTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
    UITapGestureRecognizer *singleFingerTap =
    [[UITapGestureRecognizer alloc] initWithTarget:self
                                            action:@selector(sellectCell:)];
    [self addGestureRecognizer:singleFingerTap];

}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (void)sellectCell:(UITapGestureRecognizer *)recognizer {
    if (self.eventSellectCell) {
        self.eventSellectCell();
    }
}

@end
