//
//  CardFactory.m
//  DemoTableView
//
//  Created by Doan Dat on 8/22/17.
//  Copyright © 2017 IFI. All rights reserved.
//

#import "CardFactory.h"

@interface CardFactory()

@property (strong, nonatomic) CardsContainer *container;

@property (strong, nonatomic) NSMutableDictionary<NSNumber *, NSArray *> *dictCard;

@end


@implementation CardFactory

- (instancetype)initWithDict:(NSDictionary*)dict {
    self = [super init];
    
    if (self) {
        NSError *pErr = nil;
        
        CardsContainer *pCardsContainer = [[CardsContainer alloc] initWithDictionary:dict error:&pErr];
        
        if (!pErr) {
            self.container = pCardsContainer;
            self.dictCard = [[NSMutableDictionary alloc] initWithCapacity:12];
        } else {
            NSLog(@"cant not parse CardsContainer %@", pErr);
            return nil;
        }
    }
    
    return self;
}


- (BOOL)isShowByCard {
    return [self.container.displayTypeIndicator integerValue] == 0;
}

- (NSInteger)totalGroupCard {
    return self.container.cardList.count;
}

- (NSInteger)totalCardItemInGroupAtIndex:(NSInteger)index {
    if (index >= self.container.cardList.count) {
        return 0;
    }
    
    CardListModel *cardListModel = self.container.cardList[index];
    
    return cardListModel.listItemGroup.count;
}

- (CardListModel *)getCardListModelWithCardID:(NSInteger)cardID {
    NSArray *results = [self.container.cardList filteredArrayUsingPredicate:[NSPredicate predicateWithFormat:@"cardId = %i", cardID]];
    
    return results.firstObject;
}

- (CardListModel *)getCardListModelWithIndex:(NSInteger)index {    
    return self.container.cardList[index];
}

- (NSArray<NSNumber*> *)getArrayIndexContainCardID:(NSInteger)cardID {
    
    NSArray *arrData = self.dictCard[@(cardID)];
    if (arrData.count > 0) {
        return arrData;
    }
    
    NSArray *results = [self.container.cardList filteredArrayUsingPredicate:[NSPredicate predicateWithFormat:@"cardId = %i", cardID]];
    if (results == nil || results.count == 0) {
        return nil;
    }
    NSMutableArray *pArray = [[NSMutableArray alloc] initWithCapacity:5];
    
    for (CardListModel *pItem in results) {
        NSInteger index = [self.container.cardList indexOfObject:pItem];
        if (index || index == 0) {
            [pArray addObject:@(index)];
        }
    }
    
    self.dictCard[@(cardID)] = [pArray copy];
    
//    return [pArray copy];
    return self.dictCard[@(cardID)];
}

@end
