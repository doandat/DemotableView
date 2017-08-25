//
//  CardATableViewCell.m
//  DemoTableView
//
//  Created by Doan Dat on 8/21/17.
//  Copyright © 2017 IFI. All rights reserved.
//

#import "CardATableViewCell.h"

@interface CardATableViewCell()

@property (weak, nonatomic) IBOutlet UIView *viewContain;


@end

@implementation CardATableViewCell

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
    
}

@end
