//
//  CardFactory.h
//  DemoTableView
//
//  Created by Doan Dat on 8/22/17.
//  Copyright © 2017 IFI. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "CardsContainer.h"

@interface CardFactory : NSObject

- (instancetype)initWithDict:(NSDictionary*)dict;

- (BOOL)isShowByCard;

- (NSInteger)totalGroupCard;

- (NSInteger)totalCardItemInGroupAtIndex:(NSInteger)index;

- (CardListModel *)getCardListModelWithCardID:(NSInteger)cardID;

- (CardListModel *)getCardListModelWithIndex:(NSInteger)index;

- (NSArray<NSNumber*> *)getArrayIndexContainCardID:(NSInteger)cardID;


@end
