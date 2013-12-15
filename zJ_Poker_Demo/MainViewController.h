//
//  MainViewController.h
//  zJ_Poker_Demo
//
//  Created by zJ on 13-12-4.
//  Copyright (c) 2013年 zJ. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ProfileView.h"
#import "ShoppingViewController.h"
#import "TestViewController.h"
#import "HelpViewController.h"
#import "ActivityViewController.h"
#import "MessageView.h"

@class GameSquareViewController;

@interface MainViewController : UIViewController
{
    ProfileView *_firstPart;
    UIButton *_quickStart;
    UIButton *_gameSquare;
    UIButton *_PKSquare;
    UIButton *_beginStudy;
    UIButton *_shoppingMall;
    UIButton *_help;
    UIButton *_activityButton;
    UIButton *_rangkButton;
    UIImageView *_GameName;
}

@property (strong,nonatomic) GameSquareViewController *gameSquareVC;
@property (strong,nonatomic) UIImageView *hallBackGroundImage;
@property (strong,nonatomic) ShoppingViewController *shoppingMallView;
@property (strong,nonatomic) UIImageView *selfInfoImage;
@property (strong,nonatomic) UIView *showUserInfo;

@property (strong,nonatomic) MessageView *messageView;

@property (strong,nonatomic) UILabel *userID;
@property (strong,nonatomic) UILabel *victoryOrDefeat;
@property (strong,nonatomic) UILabel *maxCard;
@property (strong,nonatomic) UILabel *maxWin;


@end
