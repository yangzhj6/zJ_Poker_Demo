//
//  GameSquareViewController.h
//  zJ_Poker_Demo
//
//  Created by zJ on 13-12-5.
//  Copyright (c) 2013年 zJ. All rights reserved.
//

#import "BaseViewController.h"
#import "GameSquareSearchBarView.h"
#import "GameSquareTableView.h"
#import "SettingView.h"
#import "WXImageView.h"

@interface GameSquareViewController : BaseViewController
{
    UIImageView *_backGroundImage;
    WXImageView *_grayImage;
    UILabel *_name;
}

@property (strong,nonatomic) UIImageView *mainGameSqure;
@property (strong,nonatomic) UIButton *backButton;
@property (strong,nonatomic) UIButton *settingButton;
@property (strong,nonatomic) GameSquareSearchBarView *selectBar;
@property (strong,nonatomic) GameSquareTableView *GameSquareTableView;
@property (strong,nonatomic) SettingView *settingView;

@end
