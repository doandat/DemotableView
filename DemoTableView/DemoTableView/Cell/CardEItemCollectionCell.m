//
//  CardEItemCollectionCell.m
//  DemoTableView
//
//  Created by Doan Dat on 8/22/17.
//  Copyright © 2017 IFI. All rights reserved.
//

#import "CardEItemCollectionCell.h"

@implementation CardEItemCollectionCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
    
    self.imvDes.clipsToBounds = YES;
    self.imvDes.layer.cornerRadius = 30.0;
    
}

@end
