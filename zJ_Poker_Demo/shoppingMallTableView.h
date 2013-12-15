//
//  shoppingMallTableView.h
//  zJ_Poker_Demo
//
//  Created by zJ on 13-12-9.
//  Copyright (c) 2013年 zJ. All rights reserved.
//

#import "BaseTableView.h"
#import "shoppingMallCell.h"

@interface shoppingMallTableView : BaseTableView
{
    NSInteger _selected;
    NSInteger _nextSelected;
    NSMutableArray *_storeNumber;
    BOOL _ifOpen;

}

@property (strong,nonatomic) NSArray *data;

@end
