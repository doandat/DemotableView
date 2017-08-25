//
//  DemoHeaderTableViewController.m
//  DemoTableView
//
//  Created by Doan Dat on 8/25/17.
//  Copyright © 2017 IFI. All rights reserved.
//

#import "DemoHeaderTableViewController.h"

#import "GSKStretchyHeaderView.h"
#import "GSKNibStretchyHeaderView.h"
#import "GSKTestStretchyHeaderView.h"

@interface DemoHeaderTableViewController ()

@property (strong, nonatomic) GSKTestStretchyHeaderView *stretchyHeader;
@property (weak, nonatomic) IBOutlet UITableView *tableView;


@end

@implementation DemoHeaderTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    CGSize headerSize = CGSizeMake(self.tableView.frame.size.width, 200); // 200 will be the default height
//    GSKNibStretchyHeaderView *pView = [[GSKNibStretchyHeaderView alloc] initWithFrame:CGRectMake(0, 0, headerSize.width, headerSize.height)];
    
    GSKTestStretchyHeaderView *headerView = [[GSKTestStretchyHeaderView alloc] initWithFrame:CGRectMake(0, 64, self.tableView.frame.size.width, 200)];
    headerView.contentInset = UIEdgeInsetsMake(64, 0, 0, 0);
    
//    self.stretchyHeader = [[GSKTestStretchyHeaderView alloc] initWithFrame:CGRectMake(0, 0, self.tableView.frame.size.width, 220)];
    
//    NSArray* nibViews = [[NSBundle mainBundle] loadNibNamed:@"GSKNibStretchyHeaderView"
//                                                      owner:self
//                                                    options:nil];
//    self.stretchyHeader = nibViews.firstObject;
    
    self.stretchyHeader = headerView;
//    self.stretchyHeader.delegate = self; // this is completely optional
    [self.tableView addSubview:self.stretchyHeader];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
