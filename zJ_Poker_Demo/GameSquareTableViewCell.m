//
//  GameSquareTableViewCell.m
//  zJ_Poker_Demo
//
//  Created by zJ on 13-12-6.
//  Copyright (c) 2013年 zJ. All rights reserved.
//

#import "GameSquareTableViewCell.h"


#define RoomListFontOfSize 15.0
#define RoomListFontOfHeight 25.0

@implementation GameSquareTableViewCell

@synthesize data = _data;


- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        // Initialization code
        self.backgroundColor = [UIColor clearColor];
        self.contentView.backgroundColor = [UIColor clearColor];
        [self setSelectionStyle:UITableViewCellSelectionStyleNone];
    
        
        [self _initCell];
    }
    return self;
}

- (void) _initCell
{
    [self setFrame:CGRectMake(0, self.height, 468, self.height)];
    //房间ID
    _roomID = [[UILabel alloc] initWithFrame:CGRectZero];
    _roomID.font = [UIFont systemFontOfSize:RoomListFontOfSize];
    _roomID.backgroundColor = [UIColor clearColor];
    _roomID.textColor = [UIColor whiteColor];
    [self.contentView addSubview:_roomID];
    
    //房间名字
    _roomName = [[UILabel alloc] initWithFrame:CGRectZero];
    _roomName.font = [UIFont systemFontOfSize:RoomListFontOfSize];
    _roomName.backgroundColor = [UIColor clearColor];
    _roomName.textColor = [UIColor whiteColor];
    [self.contentView addSubview:_roomName];
    
    //小盲注
    _smallBlind = [[UILabel alloc] initWithFrame:CGRectZero];
    _smallBlind.font = [UIFont systemFontOfSize:RoomListFontOfSize];
    _smallBlind.backgroundColor = [UIColor clearColor];
    _smallBlind.textColor = [UIColor whiteColor];
    [self.contentView addSubview:_smallBlind];
    
    //大盲注
    _bigBlind = [[UILabel alloc] initWithFrame:CGRectZero];
    _bigBlind.font = [UIFont systemFontOfSize:RoomListFontOfSize];
    _bigBlind.backgroundColor = [UIColor clearColor];
    _bigBlind.textColor = [UIColor whiteColor];
    [self.contentView addSubview:_bigBlind];
    
    //最小携带
    _smallCarry = [[UILabel alloc] initWithFrame:CGRectZero];
    _smallCarry.font = [UIFont systemFontOfSize:RoomListFontOfSize];
    _smallCarry.backgroundColor = [UIColor clearColor];
    _smallCarry.textColor = [UIColor whiteColor];
    [self.contentView addSubview:_smallCarry];
    
    //最大携带
    _bigCarry = [[UILabel alloc] initWithFrame:CGRectZero];
    _bigCarry.font = [UIFont systemFontOfSize:RoomListFontOfSize];
    _bigCarry.backgroundColor = [UIColor clearColor];
    _bigCarry.textColor = [UIColor whiteColor];
    [self.contentView addSubview:_bigCarry];
    
    //在玩人数
    _onlineCount = [[UILabel alloc] initWithFrame:CGRectZero];
    _onlineCount.font = [UIFont systemFontOfSize:RoomListFontOfSize];
    _onlineCount.backgroundColor = [UIColor clearColor];
    _onlineCount.textColor = [UIColor whiteColor];
    [self.contentView addSubview:_onlineCount];
 
    _separatorLine = [[UIImageView alloc] initWithFrame:CGRectMake(0, self.height - 5 , self.width, 1)];
//    [_separatorLine setImage:[UIImage imageNamed:@"Roomlist_cellNormal.png"]];
    _separatorLine.backgroundColor = [UIColor colorWithRed:128/255.0 green:128/255.0 blue:128/255.0 alpha:0.8];
    [self.contentView addSubview:_separatorLine];

}

- (void)layoutSubviews
{
    [super layoutSubviews];

    [self _setData];
    
    _roomID.frame = CGRectMake(20, 5,[self getWidth:_roomID].width, 25);
    _roomName.frame = CGRectMake(_roomID.right+7, 5, [self getWidth:_roomName].width, RoomListFontOfHeight);
    _smallBlind.frame = CGRectMake(180, 5, [self getWidth:_smallBlind].width, RoomListFontOfHeight);
    _bigBlind.frame = CGRectMake(_smallBlind.right + 3, 5, [self getWidth:_bigBlind].width, RoomListFontOfHeight);
    _smallCarry.frame = CGRectMake(280, 5, [self getWidth:_smallCarry].width, RoomListFontOfHeight);
    _bigCarry.frame = CGRectMake(_smallCarry.right + 3, 5,[self getWidth:_bigCarry].width, RoomListFontOfHeight);
    _onlineCount.frame = CGRectMake(400, 5, [self getWidth:_onlineCount].width, RoomListFontOfHeight);
    
    
    
}

- (CGSize) getWidth:(UILabel *) label
{
    CGSize titleSize = [label.text sizeWithFont:label.font constrainedToSize:CGSizeMake(MAXFLOAT, label.height)];
    return titleSize;
}

- (void)_setData
{
    int i = rand()%4;
    [_roomID setText:self.data[i][0]];
    [_roomName setText:self.data[i][1]];
    [_smallBlind setText:self.data[i][2]];
    [_bigBlind setText:self.data[i][3]];
    [_smallCarry setText:self.data[i][4]];
    [_bigCarry setText:self.data[i][5]];
    [_onlineCount setText:self.data[i][6]];

}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
