//
//  CardHTableViewCell.m
//  DemoTableView
//
//  Created by Doan Dat on 8/23/17.
//  Copyright © 2017 IFI. All rights reserved.
//

#import "CardHTableViewCell.h"

@implementation CardHTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
    self.lb1.clipsToBounds = YES;
    self.lb2.clipsToBounds = YES;
    self.lb3.clipsToBounds = YES;
    
    self.lb1.layer.cornerRadius = self.lb1.frame.size.height/2;
    self.lb2.layer.cornerRadius = self.lb2.frame.size.height/2;
    self.lb3.layer.cornerRadius = self.lb3.frame.size.height/2;
    
    
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
