//
//  CardFooterTableViewCell.m
//  DemoTableView
//
//  Created by Doan Dat on 8/21/17.
//  Copyright © 2017 IFI. All rights reserved.
//

#import "CardFooterTableViewCell.h"

@implementation CardFooterTableViewCell

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
    
    UIBezierPath *maskPath = [UIBezierPath bezierPathWithRoundedRect:self.viewContain.bounds byRoundingCorners:(UIRectCornerBottomLeft | UIRectCornerBottomRight) cornerRadii:CGSizeMake(10.0, 10.0)];
    
    CAShapeLayer *maskLayer = [[CAShapeLayer alloc] init];
    maskLayer.frame = self.viewContain.bounds;
    maskLayer.path  = maskPath.CGPath;
    self.viewContain.layer.mask = maskLayer;


//    self.viewContain.layer.masksToBounds = NO;
    
    
    
//    self.viewContain.layer.shadowColor = [UIColor redColor].CGColor;
//    self.viewShadow.layer.shadowOpacity = 0.8;
//    self.viewShadow.layer.shadowRadius = 3.0;
//    self.viewShadow.layer.shadowOffset = CGSizeZero;
//    self.viewShadow.layer.shadowPath = maskPath.CGPath;
    
}

@end
