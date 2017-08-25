//
//  CardViewController.m
//  DemoTableView
//
//  Created by Doan Dat on 8/21/17.
//  Copyright © 2017 IFI. All rights reserved.
//

#import "CardViewController.h"

//Cell
#import "CardHeaderTableViewCell.h"
#import "CardFooterTableViewCell.h"
#import "CardFooterEmptyTableViewCell.h"

#import "EmptyTableViewCell.h"
#import "CardATableViewCell.h"
#import "CardBTableViewCell.h"
#import "CardCTableViewCell.h"
#import "CardDTableViewCell.h"
#import "CardETableViewCell.h"
#import "CardFTableViewCell.h"
#import "CardGTableViewCell.h"
#import "CardHTableViewCell.h"
#import "CardITableViewCell.h"
#import "CardJTableViewCell.h"
#import "CardKTableViewCell.h"
#import "CardLTableViewCell.h"


#import "CardHeaderTableView.h"
#import "CardFooterTableView.h"
#import "CardFooterEmptyTableView.h"

#import "CardFactory.h"
//library
#import "JSONModel.h"
#import <SDWebImage/UIImageView+WebCache.h>
#import "WYPopoverController.h"

#import "GSKTestStretchyHeaderView.h"
#import "GSKNibStretchyHeaderView.h"

typedef NS_ENUM( NSInteger, CardType)
{
    CardTypeA = 1,
    CardTypeB,
    CardTypeC,
    CardTypeD,
    CardTypeE,
    CardTypeF,
    CardTypeG,
    CardTypeH,
    CardTypeI,
    CardTypeJ,
    CardTypeK,
    CardTypeL,
    
};


@interface CardViewController ()<UITableViewDataSource, UITableViewDelegate, WYPopoverControllerDelegate>{
    WYPopoverController *popoverController;
}

@property (weak, nonatomic) IBOutlet UITableView *tableView;

@property (strong, nonatomic) GSKStretchyHeaderView *stretchyHeader;

@property (strong, nonatomic) CardFactory *cardFactory;

@end

@implementation CardViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.\

        NSArray* nibViews = [[NSBundle mainBundle] loadNibNamed:@"GSKNibStretchyHeaderView"
                                                          owner:self
                                                        options:nil];
        self.stretchyHeader = nibViews.firstObject;
    
    
    self.stretchyHeader.frame = CGRectMake(0, 0, self.tableView.frame.size.width, 100);
    self.stretchyHeader.maximumContentHeight = 200;
    self.stretchyHeader.minimumContentHeight = 50;
//    GSKTestStretchyHeaderView *headerView = [[GSKTestStretchyHeaderView alloc] initWithFrame:CGRectMake(0, 0, self.tableView.frame.size.width, 150)];
//    headerView.contentInset = UIEdgeInsetsMake(0, 0, 0, 0);
//    
//    self.stretchyHeader = headerView;
    //    self.stretchyHeader.delegate = self; // this is completely optional
    [self.tableView addSubview:self.stretchyHeader];
    
    
    [self setupUI];
    
    [self loadData];
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];

}

- (void)viewDidLayoutSubviews {
//    [self.stretchyHeader updateUI];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)setupUI {
    self.tableView.dataSource = self;
    self.tableView.delegate = self;
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    self.tableView.allowsSelection = NO;
    
    NSArray<NSString *> *identifierList = @[
                                            @"EmptyTableViewCell",
                                            @"CardHeaderTableViewCell",
                                            @"CardFooterTableViewCell",
                                            @"CardFooterEmptyTableViewCell",
                                            @"CardATableViewCell",
                                            @"CardBTableViewCell",
                                            @"CardCTableViewCell",
                                            @"CardDTableViewCell",
                                            @"CardETableViewCell",
                                            @"CardFTableViewCell",
                                            @"CardGTableViewCell",
                                            @"CardHTableViewCell",
                                            @"CardITableViewCell",
                                            @"CardJTableViewCell",
                                            @"CardKTableViewCell",
                                            @"CardLTableViewCell",
                                            ];
    
    for (NSString *item in identifierList) {
        [self.tableView registerNib:[UINib nibWithNibName:item bundle:nil] forCellReuseIdentifier:item];
    }
    
    
    //header footer
    NSArray<NSString *> *identifierHeaderFooter = @[
                                            @"CardHeaderTableView",
                                            @"CardFooterTableView",
                                            @"CardFooterEmptyTableView",
                                            ];
    
    for (NSString *item in identifierHeaderFooter) {
        [self.tableView registerNib:[UINib nibWithNibName:item bundle:nil] forHeaderFooterViewReuseIdentifier:item];
    }

    NSLog(@"");
}

#pragma UITableViewDataSource

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return self.cardFactory? [self.cardFactory totalGroupCard] : 0;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    if ([self isSectionA: section]) {
        return [self numberRowInSectionAWithSection:section];
    }
    
    if ([self isSectionB: section]) {
        return [self numberRowInSectionBWithSection:section];
    }
    
    if ([self isSectionC: section]) {
        return [self numberRowInSectionCWithSection:section];
    }
    
    if ([self isSectionD: section]) {
        return [self numberRowInSectionDWithSection:section];
    }
    
    if ([self isSectionE: section]) {
        return [self numberRowInSectionEWithSection:section];
    }
    
    if ([self isSectionF: section]) {
        return [self numberRowInSectionFWithSection:section];
    }
    
    if ([self isSectionG: section]) {
        return [self numberRowInSectionGWithSection:section];
    }
    
    if ([self isSectionH: section]) {
        return [self numberRowInSectionHWithSection:section];
    }
    
    if ([self isSectionI: section]) {
        return [self numberRowInSectionIWithSection:section];
    }
    
    if ([self isSectionJ: section]) {
        return [self numberRowInSectionJWithSection:section];
    }
    
    if ([self isSectionK: section]) {
        return [self numberRowInSectionKWithSection:section];
    }
    
    if ([self isSectionL: section]) {
        return [self numberRowInSectionLWithSection:section];
    }
    
    return 0;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    if ([self isSectionA: indexPath.section]) {
        return [self cardATableCellAtIndex:indexPath];
    }
    
    if ([self isSectionB: indexPath.section]) {
        return [self cardBTableCellAtIndex:indexPath];
    }
    
    if ([self isSectionC: indexPath.section]) {
        return [self cardCTableCellAtIndex:indexPath];
    }
    
    if ([self isSectionD: indexPath.section]) {
        return [self cardDTableCellAtIndex:indexPath];
    }
    
    if ([self isSectionE: indexPath.section]) {
        return [self cardETableCellAtIndex:indexPath];
    }
    
    if ([self isSectionF: indexPath.section]) {
        return [self cardFTableCellAtIndex:indexPath];
    }
    
    if ([self isSectionG: indexPath.section]) {
        return [self cardGTableCellAtIndex:indexPath];
    }
    
    if ([self isSectionH: indexPath.section]) {
        return [self cardHTableCellAtIndex:indexPath];
    }
    
    if ([self isSectionI: indexPath.section]) {
        return [self cardITableCellAtIndex:indexPath];
    }
    
    if ([self isSectionJ: indexPath.section]) {
        return [self cardJTableCellAtIndex:indexPath];
    }
    
    if ([self isSectionK: indexPath.section]) {
        return [self cardKTableCellAtIndex:indexPath];
    }
    
    if ([self isSectionL: indexPath.section]) {
        return [self cardLTableCellAtIndex:indexPath];
    }
    
    
    return [self emptyTableCellAtIndex:indexPath];
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {
    
    CardHeaderTableView *header = [self headerAtSection:section];
    
    [header setActionShowPopover:^(UIButton *button){
        UIViewController *pVC = [[UIViewController alloc] init];
        pVC.view.backgroundColor = [UIColor whiteColor];
        pVC.preferredContentSize = CGSizeMake(170, 180);
        pVC.modalInPopover = NO;
        
        popoverController = [[WYPopoverController alloc] initWithContentViewController:pVC];
        popoverController.delegate = self;
        [popoverController presentPopoverFromRect:button.bounds inView:button permittedArrowDirections:WYPopoverArrowDirectionUp animated:YES options:WYPopoverAnimationOptionFadeWithScale];
    }];
    
    

    [header setupUI];
    
    
    if ([self isSectionA: section] && [self numberRowInSectionAWithSection:section] > 0) {
        return header;
    }
    
    if ([self isSectionB: section] && [self numberRowInSectionBWithSection:section] > 0) {
        return header;
    }
    
    if ([self isSectionC: section] && [self numberRowInSectionCWithSection:section] > 0) {
        return header;
    }
    
    if ([self isSectionD: section] && [self numberRowInSectionDWithSection:section] > 0) {
        return header;
    }
    
    if ([self isSectionE: section] && [self numberRowInSectionEWithSection:section] > 0) {
        return header;
    }
    
    if ([self isSectionF: section] && [self numberRowInSectionFWithSection:section] > 0) {
        return header;
    }
    
    if ([self isSectionG: section] && [self numberRowInSectionGWithSection:section] > 0) {
        return header;
    }
    
    if ([self isSectionH: section] && [self numberRowInSectionHWithSection:section] > 0) {
        return header;
    }
    
    if ([self isSectionI: section] && [self numberRowInSectionIWithSection:section] > 0) {
        return header;
    }
    
    if ([self isSectionJ: section] && [self numberRowInSectionJWithSection:section] > 0) {
        return header;
    }
    
    if ([self isSectionK: section] && [self numberRowInSectionKWithSection:section] > 0) {
        return header;
    }
    
    if ([self isSectionL: section] && [self numberRowInSectionLWithSection:section] > 0) {
        return header;
    }
    
    return nil;
}


- (UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section {
    
    CardFooterTableView *footer = (CardFooterTableView *)[self.tableView dequeueReusableHeaderFooterViewWithIdentifier:@"CardFooterTableView"];

    
//    return footer;
    
//    CardFooterTableViewCell *footer = [self footerAtSection:section];
//    
    if ([self isSectionA: section] && [self numberRowInSectionAWithSection:section] > 1) {
        return footer;
    }
    
    if ([self isSectionB: section] && [self numberRowInSectionBWithSection:section] > 1) {
        return footer;
    }
    
    if ([self isSectionC: section] && [self numberRowInSectionCWithSection:section] > 1) {
        return footer;
    }
    
    if ([self isSectionI: section] && [self numberRowInSectionIWithSection:section] > 1) {
        return footer;
    }

    return [self footerEmptyAtSection:section];
}

- (void)tableView:(UITableView *)tableView willDisplayHeaderView:(UIView *)view forSection:(NSInteger)section {
    [((CardHeaderTableView *)view) setupUI];
}

- (void)tableView:(UITableView *)tableView willDisplayFooterView:(UIView *)view forSection:(NSInteger)section {
    
    if ([self isSectionA: section] && [self numberRowInSectionAWithSection:section] > 1) {
        [((CardFooterTableView *)view) setupUI];
        return;
    }
    
    if ([self isSectionB: section] && [self numberRowInSectionBWithSection:section] > 1) {
        [((CardFooterTableView *)view) setupUI];
        return;
    }
    
    if ([self isSectionC: section] && [self numberRowInSectionCWithSection:section] > 1) {
        [((CardFooterTableView *)view) setupUI];
        return;
    }
    
    if ([self isSectionI: section] && [self numberRowInSectionIWithSection:section] > 1) {
        [((CardFooterTableView *)view) setupUI];
        return;
    }
    
    [((CardFooterEmptyTableView *)view) setupUI];
}


//CustomCell

- (CardHeaderTableView *)headerAtSection:(NSInteger )section {
    CardHeaderTableView *sectionHeaderView = (CardHeaderTableView *)[self.tableView dequeueReusableHeaderFooterViewWithIdentifier:@"CardHeaderTableView"];
    
    return sectionHeaderView;
}


- (CardFooterTableViewCell *)footerAtSection:(NSInteger )section {
    CardFooterTableViewCell *pCell = [self.tableView dequeueReusableCellWithIdentifier:@"CardFooterTableViewCell"];
    
    return pCell;
}

- (CardFooterEmptyTableView *)footerEmptyAtSection:(NSInteger )section {
    CardFooterEmptyTableView *footer = (CardFooterEmptyTableView *)[self.tableView dequeueReusableHeaderFooterViewWithIdentifier:@"CardFooterEmptyTableView"];
    
    return footer;
}


- (EmptyTableViewCell *)emptyTableCellAtIndex:(NSIndexPath *)indexPath {
    EmptyTableViewCell *pCell = [self.tableView dequeueReusableCellWithIdentifier:@"EmptyTableViewCell" forIndexPath:indexPath];
    
    return pCell;
}

//cell

- (CardATableViewCell *)cardATableCellAtIndex:(NSIndexPath *)indexPath {
    CardATableViewCell *pCell = [self.tableView dequeueReusableCellWithIdentifier:@"CardATableViewCell" forIndexPath:indexPath];
    
    NSArray *arrCardItem = [self.cardFactory getCardListModelWithCardID:CardTypeA].listItemGroup;
    
    if (arrCardItem.count > indexPath.row) {
        CardItemModel *cardItem = arrCardItem[indexPath.row];
        
        pCell.lbMainText.text = cardItem.text;
        pCell.lbSubText.text = cardItem.caption;
//        pCell.lbSupplementaryText.text = @"";
        
        [pCell setEventSellectCell:^{
            NSLog(@"EventSellection: %@",indexPath);
        }];
    }

    
    return pCell;
}

- (CardBTableViewCell *)cardBTableCellAtIndex:(NSIndexPath *)indexPath {
    CardBTableViewCell *pCell = [self.tableView dequeueReusableCellWithIdentifier:@"CardBTableViewCell" forIndexPath:indexPath];
    
//    NSArray *arrCardItem = [self.cardFactory getCardListModelWithCardID:CardTypeB].listItemGroup;
//
//    if (arrCardItem.count > indexPath.row) {
//        CardItemModel *cardItem = arrCardItem[indexPath.row];
//        
//        pCell.lbMainText.text = cardItem.text;
//        pCell.lbSubText.text = cardItem.caption;
//        //        pCell.lbSupplementaryText.text = @"";
//        
//        [pCell setEventSellectCell:^{
//            NSLog(@"EventSellection: %@",indexPath);
//        }];
//    }
    
    NSArray *arrCardItem = [self.cardFactory getCardListModelWithIndex:indexPath.section].listItemGroup;
    
    if (arrCardItem.count > indexPath.row) {
        CardItemModel *cardItem = arrCardItem[indexPath.row];
        
        pCell.lbMainText.text = cardItem.text;
        pCell.lbSubText.text = cardItem.caption;
        //        pCell.lbSupplementaryText.text = @"";
        
        [pCell setEventSellectCell:^{
            NSLog(@"EventSellection: %@",indexPath);
        }];
    }
    
    
    return pCell;
}

- (CardCTableViewCell *)cardCTableCellAtIndex:(NSIndexPath *)indexPath {
    CardCTableViewCell *pCell = [self.tableView dequeueReusableCellWithIdentifier:@"CardCTableViewCell" forIndexPath:indexPath];
    
    NSArray *arrCardItem = [self.cardFactory getCardListModelWithCardID:CardTypeC].listItemGroup;
    
    if (arrCardItem.count > indexPath.row) {
        CardItemModel *cardItem = arrCardItem[indexPath.row];
        
        pCell.lbMainText.text = cardItem.text;
        pCell.lbSubText.text = cardItem.caption;
        //        pCell.lbSupplementaryText.text = @"";
        
        [pCell setEventSellectCell:^{
            NSLog(@"EventSellection: %@",indexPath);
        }];
    }
    
    return pCell;
}

- (CardDTableViewCell *)cardDTableCellAtIndex:(NSIndexPath *)indexPath {
    CardDTableViewCell *pCell = [self.tableView dequeueReusableCellWithIdentifier:@"CardDTableViewCell" forIndexPath:indexPath];
    
    [pCell setDataItem:[self.cardFactory getCardListModelWithCardID:CardTypeD].listItemGroup];
    
    return pCell;
}

- (CardETableViewCell *)cardETableCellAtIndex:(NSIndexPath *)indexPath {
    CardETableViewCell *pCell = [self.tableView dequeueReusableCellWithIdentifier:@"CardETableViewCell" forIndexPath:indexPath];
    
    [pCell setDataItem:[self.cardFactory getCardListModelWithCardID:CardTypeE].listItemGroup];
    
    return pCell;
}

- (CardFTableViewCell *)cardFTableCellAtIndex:(NSIndexPath *)indexPath {
    CardFTableViewCell *pCell = [self.tableView dequeueReusableCellWithIdentifier:@"CardFTableViewCell" forIndexPath:indexPath];
    
    
    NSArray *arrCardItem = [self.cardFactory getCardListModelWithCardID:CardTypeF].listItemGroup;
    
    if (arrCardItem.count > indexPath.row) {
        CardItemModel *cardItem = arrCardItem[indexPath.row];
        
        pCell.lbMainText.text = cardItem.text;
        pCell.lbSubText.text = cardItem.caption;
        
        __weak typeof (self) thiz = self;
        [pCell.imvDes sd_setImageWithURL:[NSURL URLWithString:cardItem.image] completed:^(UIImage * _Nullable image, NSError * _Nullable error, SDImageCacheType cacheType, NSURL * _Nullable imageURL) {
            CGFloat height = ([UIScreen mainScreen].bounds.size.width- 32) * image.size.height / image.size.width;
            NSLog(@"Finish:%f", height);
            dispatch_async(dispatch_get_main_queue(), ^{
                pCell.constraintMaxHeightImv.constant = height < [UIScreen mainScreen].bounds.size.width - 32 ? height : [UIScreen mainScreen].bounds.size.width - 32;
//                [thiz.tableView beginUpdates];
//                [thiz.tableView endUpdates];
            });
        }];
        
    }

    
    return pCell;
}

- (CardGTableViewCell *)cardGTableCellAtIndex:(NSIndexPath *)indexPath {
    CardGTableViewCell *pCell = [self.tableView dequeueReusableCellWithIdentifier:@"CardGTableViewCell" forIndexPath:indexPath];
    
    return pCell;
}

- (CardHTableViewCell *)cardHTableCellAtIndex:(NSIndexPath *)indexPath {
    CardHTableViewCell *pCell = [self.tableView dequeueReusableCellWithIdentifier:@"CardHTableViewCell" forIndexPath:indexPath];
    
    
    return pCell;
}

- (CardITableViewCell *)cardITableCellAtIndex:(NSIndexPath *)indexPath {
    CardITableViewCell *pCell = [self.tableView dequeueReusableCellWithIdentifier:@"CardITableViewCell" forIndexPath:indexPath];
    
    
    return pCell;
}

- (CardJTableViewCell *)cardJTableCellAtIndex:(NSIndexPath *)indexPath {
    CardJTableViewCell *pCell = [self.tableView dequeueReusableCellWithIdentifier:@"CardJTableViewCell" forIndexPath:indexPath];
    
    
    return pCell;
}

- (CardKTableViewCell *)cardKTableCellAtIndex:(NSIndexPath *)indexPath {
    CardKTableViewCell *pCell = [self.tableView dequeueReusableCellWithIdentifier:@"CardKTableViewCell" forIndexPath:indexPath];
    
    NSArray *arrCardItem = [self.cardFactory getCardListModelWithCardID:CardTypeK].listItemGroup;
    
    if (arrCardItem.count > indexPath.row) {
        CardItemModel *cardItem = arrCardItem[indexPath.row];
        
        __weak typeof (self) thiz = self;
        [pCell.imvDes sd_setImageWithURL:[NSURL URLWithString:cardItem.image] completed:^(UIImage * _Nullable image, NSError * _Nullable error, SDImageCacheType cacheType, NSURL * _Nullable imageURL) {
            
        }];
        
    }
    
    return pCell;
}

- (CardLTableViewCell *)cardLTableCellAtIndex:(NSIndexPath *)indexPath {
    CardLTableViewCell *pCell = [self.tableView dequeueReusableCellWithIdentifier:@"CardLTableViewCell" forIndexPath:indexPath];
    
    [pCell setDataItem:[self.cardFactory getCardListModelWithCardID:CardTypeL].listItemGroup];
    
    return pCell;
}


#pragma UITableViewDelegate

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    if ([self isSectionA: section] && [self numberRowInSectionAWithSection:section] > 0) {
        return 50.0;
    }
    
    if ([self isSectionB: section] && [self numberRowInSectionBWithSection:section] > 0) {
        return 50.0;
    }
    
    if ([self isSectionC: section] && [self numberRowInSectionCWithSection:section] > 0) {
        return 50.0;
    }
    
    if ([self isSectionD: section] && [self numberRowInSectionDWithSection:section] > 0) {
        return 50.0;
    }
    
    if ([self isSectionE: section] && [self numberRowInSectionEWithSection:section] > 0) {
        return 50.0;
    }
    
    if ([self isSectionF: section] && [self numberRowInSectionFWithSection:section] > 0) {
        return 50.0;
    }
    
    if ([self isSectionG: section] && [self numberRowInSectionGWithSection:section] > 0) {
        return 50.0;
    }
    
    if ([self isSectionH: section] && [self numberRowInSectionHWithSection:section] > 0) {
        return 50.0;
    }
    
    if ([self isSectionI: section] && [self numberRowInSectionIWithSection:section] > 0) {
        return 50.0;
    }
    
    if ([self isSectionJ: section] && [self numberRowInSectionJWithSection:section] > 0) {
        return 50.0;
    }
    
    if ([self isSectionK: section] && [self numberRowInSectionKWithSection:section] > 0) {
        return 50.0;
    }
    
    if ([self isSectionL: section] && [self numberRowInSectionLWithSection:section] > 0) {
        return 50.0;
    }
    
    return 0.01;
}
- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section {
    if ([self isSectionA: section] && [self numberRowInSectionAWithSection:section] > 1) {
        return 50.0;
    }
    
    if ([self isSectionB: section] && [self numberRowInSectionBWithSection:section] > 1) {
        return 50.0;
    }
    
    if ([self isSectionC: section] && [self numberRowInSectionCWithSection:section] > 1) {
        return 50.0;
    }
    
    if ([self isSectionC: section] && [self numberRowInSectionCWithSection:section] > 1) {
        return 50.0;
    }
    
    if ([self isSectionI: section] && [self numberRowInSectionIWithSection:section] > 1) {
        return 50.0;
    }
    
    if ([self isSectionJ: section] && [self numberRowInSectionJWithSection:section] > 1) {
        return 50.0;
    }
    
    return 20.0;
}

- (CGFloat)tableView:(UITableView *)tableView estimatedHeightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 50.0;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
}


#pragma mark - 

//section

- (BOOL)isSectionA:(NSInteger)section {
//    return section == 0;
    return [[self.cardFactory getArrayIndexContainCardID:CardTypeA] containsObject:@(section)];
}

- (BOOL)isSectionB:(NSInteger)section {
//    return section == 1;
//    NSArray *pArr = [self.cardFactory getArrayIndexContainCardID:CardTypeB];
//    BOOL isContain = [pArr containsObject:@(section)];
//    if (section == 1) {
//        NSLog(@"");
//    }
    return [[self.cardFactory getArrayIndexContainCardID:CardTypeB] containsObject:@(section)];
}

- (BOOL)isSectionC:(NSInteger)section {
//    return section == 2;
    return [[self.cardFactory getArrayIndexContainCardID:CardTypeC] containsObject:@(section)];
}

- (BOOL)isSectionD:(NSInteger)section {
//    return section == 3;
    return [[self.cardFactory getArrayIndexContainCardID:CardTypeD] containsObject:@(section)];
}

- (BOOL)isSectionE:(NSInteger)section {
//    return section == 4;
    return [[self.cardFactory getArrayIndexContainCardID:CardTypeE] containsObject:@(section)];
}

- (BOOL)isSectionF:(NSInteger)section {
//    return section == 5;
    return [[self.cardFactory getArrayIndexContainCardID:CardTypeF] containsObject:@(section)];
}

- (BOOL)isSectionG:(NSInteger)section {
//    return section == 6;
    return [[self.cardFactory getArrayIndexContainCardID:CardTypeG] containsObject:@(section)];
}

- (BOOL)isSectionH:(NSInteger)section {
//    return section == 7;
    return [[self.cardFactory getArrayIndexContainCardID:CardTypeH] containsObject:@(section)];
}

- (BOOL)isSectionI:(NSInteger)section {
//    return section == 8;
    return [[self.cardFactory getArrayIndexContainCardID:CardTypeI] containsObject:@(section)];
}

- (BOOL)isSectionJ:(NSInteger)section {
//    return section == 9;
    return [[self.cardFactory getArrayIndexContainCardID:CardTypeJ] containsObject:@(section)];
}

- (BOOL)isSectionK:(NSInteger)section {
//    return section == 10;
    return [[self.cardFactory getArrayIndexContainCardID:CardTypeK] containsObject:@(section)];
}

- (BOOL)isSectionL:(NSInteger)section {
//    return section == 11;
    return [[self.cardFactory getArrayIndexContainCardID:CardTypeL] containsObject:@(section)];
}

//numberRowInSection
- (NSInteger) numberRowInSectionAWithSection:(NSInteger)section {
//    return [self.cardFactory getCardListModelWithCardID:CardTypeA].listItemGroup.count;
    return [self.cardFactory getCardListModelWithIndex:section].listItemGroup.count;
}

- (NSInteger) numberRowInSectionBWithSection:(NSInteger)section {
//    return [self.cardFactory getCardListModelWithCardID:CardTypeB].listItemGroup.count;
    return [self.cardFactory getCardListModelWithIndex:section].listItemGroup.count;
}

- (NSInteger) numberRowInSectionCWithSection:(NSInteger)section {
//    return [self.cardFactory getCardListModelWithCardID:CardTypeC].listItemGroup.count;
    return [self.cardFactory getCardListModelWithIndex:section].listItemGroup.count;
}

- (NSInteger) numberRowInSectionDWithSection:(NSInteger)section {
//    return [self.cardFactory getCardListModelWithCardID:CardTypeD].listItemGroup.count > 0 ? 1 : 0;
    return [self.cardFactory getCardListModelWithIndex:section].listItemGroup.count > 0 ? 1 : 0;
}

- (NSInteger) numberRowInSectionEWithSection:(NSInteger)section {
//    return [self.cardFactory getCardListModelWithCardID:CardTypeE].listItemGroup.count > 0 ? 1 : 0;
    return [self.cardFactory getCardListModelWithIndex:section].listItemGroup.count > 0 ? 1 : 0;
}

- (NSInteger) numberRowInSectionFWithSection:(NSInteger)section {
//    return [self.cardFactory getCardListModelWithCardID:CardTypeF].listItemGroup.count > 0 ? 1 : 0;
    return [self.cardFactory getCardListModelWithIndex:section].listItemGroup.count > 0 ? 1 : 0;
}

- (NSInteger) numberRowInSectionGWithSection:(NSInteger)section {
//    return [self.cardFactory getCardListModelWithCardID:CardTypeG].listItemGroup.count > 0 ? 1 : 0;
    return [self.cardFactory getCardListModelWithIndex:section].listItemGroup.count > 0 ? 1 : 0;
}

- (NSInteger) numberRowInSectionHWithSection:(NSInteger)section {
//    return [self.cardFactory getCardListModelWithCardID:CardTypeH].listItemGroup.count > 0 ? 1 : 0;
    return [self.cardFactory getCardListModelWithIndex:section].listItemGroup.count > 0 ? 1 : 0;
}

- (NSInteger) numberRowInSectionIWithSection:(NSInteger)section {
//    return [self.cardFactory getCardListModelWithCardID:CardTypeI].listItemGroup.count;
    return [self.cardFactory getCardListModelWithIndex:section].listItemGroup.count;
}

- (NSInteger) numberRowInSectionJWithSection:(NSInteger)section {
//    return [self.cardFactory getCardListModelWithCardID:CardTypeJ].listItemGroup.count;
    return [self.cardFactory getCardListModelWithIndex:section].listItemGroup.count;
}

- (NSInteger) numberRowInSectionKWithSection:(NSInteger)section {
//    return [self.cardFactory getCardListModelWithCardID:CardTypeK].listItemGroup.count > 0 ? 1 : 0;
    return [self.cardFactory getCardListModelWithIndex:section].listItemGroup.count > 0 ? 1 : 0;
}

- (NSInteger) numberRowInSectionLWithSection:(NSInteger)section {
//    return [self.cardFactory getCardListModelWithCardID:CardTypeL].listItemGroup.count > 0 ? 1 : 0;
    return [self.cardFactory getCardListModelWithIndex:section].listItemGroup.count > 0 ? 1 : 0;
}


#pragma mark - JSON

- (void)loadData {
    NSString *dataPath = [[NSBundle bundleForClass:[self class]] pathForResource:@"json" ofType:@"txt"];
    NSData *data = [NSData dataWithContentsOfFile:dataPath];
    NSDictionary *obj = [NSJSONSerialization JSONObjectWithData:data options:0 error:nil];
    
    CardFactory *pFactory = [[CardFactory alloc] initWithDict:obj];

    self.cardFactory = pFactory;
    
    [self.tableView reloadData];
    
}


#pragma mark - PopoverDelegate
- (BOOL)popoverControllerShouldDismissPopover:(WYPopoverController *)controller {
    return YES;
}

- (void)popoverControllerDidDismissPopover:(WYPopoverController *)controller {
    popoverController.delegate = nil;
    popoverController = nil;
}

- (void)dealloc {
    NSLog(@"Dealloc");
}


@end
