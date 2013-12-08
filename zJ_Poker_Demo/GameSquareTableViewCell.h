//
//  GameSquareTableViewCell.h
//  zJ_Poker_Demo
//
//  Created by zJ on 13-12-6.
//  Copyright (c) 2013年 zJ. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "RTLabel.h"

@interface GameSquareTableViewCell : UITableViewCell
{
    UIImageView *_backgroundImage;
    UILabel *_roomID;
    UILabel *_roomName;
    UILabel *_smallBlind;
    UILabel *_bigBlind;
    UILabel *_smallCarry;
    UILabel *_bigCarry;
    UILabel *_onlineCount;
    UIImageView *_progressBar;
    UIImageView *_progress;
    UIImageView *_separatorLine;
    
}

@property (nonatomic,strong) NSArray *data;

@end
