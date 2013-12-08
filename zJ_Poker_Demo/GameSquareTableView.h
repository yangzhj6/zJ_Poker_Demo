//
//  GameSquareTableView.h
//  zJ_Poker_Demo
//
//  Created by zJ on 13-12-6.
//  Copyright (c) 2013年 zJ. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface GameSquareTableView : UITableView <UITableViewDataSource, UITableViewDelegate>

@property(nonatomic,strong) NSArray *data;
@property (nonatomic,assign) int wocao;

@end
