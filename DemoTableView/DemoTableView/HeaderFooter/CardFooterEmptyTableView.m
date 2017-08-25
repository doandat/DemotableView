//
//  CardFooterEmptyTableView.m
//  DemoTableView
//
//  Created by Doan Dat on 8/25/17.
//  Copyright © 2017 IFI. All rights reserved.
//

#import "CardFooterEmptyTableView.h"

@interface CardFooterEmptyTableView()

@property (weak, nonatomic) IBOutlet UIView *viewContain;

@end

@implementation CardFooterEmptyTableView

- (void)awakeFromNib {
    [super awakeFromNib];
    //    [self setupUI];
}

- (void)setupUI {
    
    UIBezierPath *maskPath = [UIBezierPath bezierPathWithRoundedRect:self.viewContain.bounds byRoundingCorners:(UIRectCornerBottomLeft | UIRectCornerBottomRight) cornerRadii:CGSizeMake(10.0, 10.0)];
    
    CAShapeLayer *maskLayer = [[CAShapeLayer alloc] init];
    maskLayer.frame = self.viewContain.bounds;
    maskLayer.path  = maskPath.CGPath;
    self.viewContain.layer.mask = maskLayer;
    
}


@end
