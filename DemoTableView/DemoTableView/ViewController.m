//
//  ViewController.m
//  DemoTableView
//
//  Created by Doan Dat on 8/21/17.
//  Copyright © 2017 IFI. All rights reserved.
//

#import "ViewController.h"

#import "CardViewController.h"
#import "DemoHeaderTableViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    CardViewController *pVC = [[CardViewController alloc] initWithNibName:nil bundle:nil];
    [self.navigationController pushViewController:pVC animated:YES];
    
//    DemoHeaderTableViewController *pVC = [[DemoHeaderTableViewController alloc] initWithNibName:nil bundle:nil];
//    [self.navigationController pushViewController:pVC animated:YES];
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
