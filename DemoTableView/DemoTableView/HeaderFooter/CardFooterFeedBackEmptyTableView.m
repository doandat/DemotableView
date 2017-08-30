//
//  CardFooterFeedBackEmptyTableView.m
//  DemoTableView
//
//  Created by Doan Dat on 8/30/17.
//  Copyright © 2017 IFI. All rights reserved.
//

#import "CardFooterFeedBackEmptyTableView.h"

@interface CardFooterFeedBackEmptyTableView()

@property (weak, nonatomic) IBOutlet UIView *viewContain;

@end

@implementation CardFooterFeedBackEmptyTableView

- (void)setupUI {
    
    UIBezierPath *maskPath = [UIBezierPath bezierPathWithRoundedRect:self.viewContain.bounds byRoundingCorners:(UIRectCornerBottomLeft | UIRectCornerBottomRight) cornerRadii:CGSizeMake(10.0, 10.0)];
    
    CAShapeLayer *maskLayer = [[CAShapeLayer alloc] init];
    maskLayer.frame = self.viewContain.bounds;
    maskLayer.path  = maskPath.CGPath;
    self.viewContain.layer.mask = maskLayer;
}

@end
