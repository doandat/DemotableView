//
//  CardsContainer.h
//  DemoTableView
//
//  Created by Doan Dat on 8/22/17.
//  Copyright © 2017 IFI. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "JSONModel.h"
//Protocol

@protocol CardListModel <NSObject>

@end

@protocol CardItemModel <NSObject>

@end

//Interface

@interface CardListModel : JSONModel

@property (strong, nonatomic) NSNumber<Optional> *cardId;
@property (strong, nonatomic) NSString<Optional> *title;
@property (strong, nonatomic) NSArray<CardItemModel, Optional> *listItemGroup;

@end

@interface CardItemModel : JSONModel

@property (strong, nonatomic) NSString<Optional> *text;
@property (strong, nonatomic) NSString<Optional> *caption;
@property (strong, nonatomic) NSString<Optional> *image;
@property (strong, nonatomic) NSString<Optional> *webview;
@property (strong, nonatomic) NSString<Optional> *listPressTransitionDestinationURL;

@end


@interface CardsContainer : JSONModel

@property (strong, nonatomic) NSNumber<Optional> *responseCode;
@property (strong, nonatomic) NSNumber<Optional> *responseTime;
@property (strong, nonatomic) NSNumber<Optional> *displayTypeIndicator;

@property (strong, nonatomic) NSArray<CardListModel, Optional> *cardList;


@end
