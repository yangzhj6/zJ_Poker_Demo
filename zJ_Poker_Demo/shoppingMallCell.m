//
//  shoppingMallCell.m
//  zJ_Poker_Demo
//
//  Created by zJ on 13-12-9.
//  Copyright (c) 2013年 zJ. All rights reserved.
//

#import "shoppingMallCell.h"

@implementation shoppingMallCell

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        // Initialization code
        [self _initView];
    }
    return self;
}

- (void) _initView
{
    [self setSelectionStyle:UITableViewCellSelectionStyleNone];
    [self setBackgroundColor:[UIColor orangeColor]];
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
