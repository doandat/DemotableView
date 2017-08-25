//
//  CardCTableViewCell.m
//  DemoTableView
//
//  Created by Doan Dat on 8/21/17.
//  Copyright © 2017 IFI. All rights reserved.
//

#import "CardCTableViewCell.h"

@interface CardCTableViewCell()

@property (weak, nonatomic) IBOutlet UIImageView *imv;


@end

@implementation CardCTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
    [self setupUI];
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (void)setupUI {
    self.imv.clipsToBounds = YES;
    self.imv.layer.cornerRadius = 23.0;
}

@end
