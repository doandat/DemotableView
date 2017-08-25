#import "GSKTestStretchyHeaderView.h"
//#import "GSKGradientView.h"
#import "UIView+GSKLayoutHelper.h"
#import "GSKGeometry.h"

@interface GSKTestStretchyHeaderView ()
//@property (nonatomic) GSKGradientView *gradientView;
@property (nonatomic) UIImageView *imageView;
@property (nonatomic) UIImageView *imageViewBackground;
@property (nonatomic) UIButton *button;
@end

@implementation GSKTestStretchyHeaderView

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        self.minimumContentHeight = 40;
        self.backgroundColor = [UIColor redColor];
        [self setupGradient];
//        [self setupImageView];
        [self setupButton];
    }
    return self;
}


- (void)updateUI {
    self.button.center = self.imageViewBackground.center;
}

- (void)setupGradient {
//    self.gradientView = [[GSKGradientView alloc] initWithFrame:self.contentView.bounds];
//    self.gradientView.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
//    [self.contentView addSubview:self.gradientView];
    
    self.imageViewBackground = [[UIImageView alloc] initWithFrame:self.contentView.bounds];
    self.imageViewBackground.contentMode = UIViewContentModeScaleAspectFill;
    [self.imageViewBackground setImage:[UIImage imageNamed:@"book"]];
    self.imageViewBackground.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;

    [self.contentView addSubview:self.imageViewBackground];
    

    
}

- (void)setupImageView {
    
    self.imageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"lab"]];
    [self.contentView addSubview:self.imageView];
    
}

- (void)setupButton {
    self.button = [[UIButton alloc] init];
    [self.button setTitle:@"知る"
                 forState:UIControlStateNormal];
    self.button.titleLabel.font = [UIFont systemFontOfSize:30];

    [self.button setTitleColor:[UIColor whiteColor]
                      forState:UIControlStateNormal];
    [self.button setTitleColor:[UIColor lightGrayColor]
                      forState:UIControlStateHighlighted];
    [self.button addTarget:self
                    action:@selector(didTapButton:)
          forControlEvents:UIControlEventTouchUpInside];
    [self.contentView addSubview:self.button];
    [self.button sizeToFit];
    
//    self.button.center = self.center;
    
    
    NSLayoutConstraint *xCenterConstraint = [NSLayoutConstraint constraintWithItem:self.button attribute:NSLayoutAttributeCenterX relatedBy:NSLayoutRelationEqual toItem:self.contentView attribute:NSLayoutAttributeCenterX multiplier:1.0 constant:0];
    [self.contentView addConstraint:xCenterConstraint];
    
    NSLayoutConstraint *yCenterConstraint = [NSLayoutConstraint constraintWithItem:self.button attribute:NSLayoutAttributeCenterY relatedBy:NSLayoutRelationEqual toItem:self.contentView attribute:NSLayoutAttributeCenterY multiplier:1.0 constant:0];
    [self.contentView addConstraint:yCenterConstraint];


}


- (void)didChangeStretchFactor:(CGFloat)stretchFactor {
    [super didChangeStretchFactor:stretchFactor];
    CGFloat limitedStretchFactor = MIN(1, stretchFactor);

    CGSize minImageSize = CGSizeMake(32, 32);
    CGSize maxImageSize = CGSizeMake(96, 96);
    CGPoint minImageOrigin = CGPointMake(96, 24);
    CGPoint maxImageOrigin = CGPointMake((self.contentView.width - maxImageSize.width) / 2, 32);

//    self.imageView.size = CGSizeInterpolate(limitedStretchFactor, minImageSize, maxImageSize);
//    self.imageView.left = CGFloatInterpolate(limitedStretchFactor, minImageOrigin.x, maxImageOrigin.x);
//    self.imageView.top = CGFloatInterpolate(stretchFactor, minImageOrigin.y, maxImageOrigin.y);

//    if (stretchFactor < 1) {
//        self.button.top = CGFloatInterpolate(stretchFactor,
//                                             self.imageView.centerY - self.button.height / 2,
//                                             self.imageView.bottom + 4);
//    } else {
//        self.button.top = self.imageView.bottom + 4;
//    }

//    self.button.left = CGFloatInterpolate(limitedStretchFactor,
//                                          minImageOrigin.x + minImageSize.width + 8,
//                                          self.contentView.width / 2 - self.button.width / 2);
    
//    if (stretchFactor < 1) {
//        self.button.top = self.contentView.height/2;
//    } else {
//        self.button.top = self.contentView.height/2;
//    }
//    
//    self.button.left = self.contentView.width / 2 - self.button.width / 2;
    
//    self.button.center = self.imageViewBackground.center;
}

- (void)didTapButton:(id)sender {
    NSLog(@"tap!");
}

@end
