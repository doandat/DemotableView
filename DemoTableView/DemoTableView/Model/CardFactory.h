//
//  CardFactory.h
//  DemoTableView
//
//  Created by Doan Dat on 8/22/17.
//  Copyright © 2017 IFI. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "CardsContainer.h"

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


@interface CardFactory : NSObject

- (instancetype)initWithDict:(NSDictionary*)dict;

- (BOOL)isShowByCard;

- (NSInteger)totalGroupCard;

- (NSInteger)totalCardItemInGroupAtIndex:(NSInteger)index;

- (CardListModel *)getCardListModelWithCardID:(NSInteger)cardID;

- (CardListModel *)getCardListModelWithIndex:(NSInteger)index;

- (NSArray<NSNumber*> *)getArrayIndexContainCardID:(NSInteger)cardID;


@end
