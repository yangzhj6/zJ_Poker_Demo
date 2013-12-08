//
//  MainViewController.h
//  zJ_Poker_Demo
//
//  Created by zJ on 13-12-4.
//  Copyright (c) 2013年 zJ. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ProfileView.h"

@class GameSquareViewController;

@interface MainViewController : UIViewController
{
    ProfileView *_firstPart;
    UIButton *_quickStart;
    UIButton *_gameSquare;
    UIButton *_PKSquare;
    UIButton *_beginStudy;
    
}

@property (strong,nonatomic) GameSquareViewController *gameSquareVC;
@property (strong,nonatomic) UIImageView *hallBackGroundImage;


@end
