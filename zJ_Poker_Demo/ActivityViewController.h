//
//  ActivityViewController.h
//  zJ_Poker_Demo
//
//  Created by zJ on 13-12-11.
//  Copyright (c) 2013年 zJ. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ActivityViewController : UIViewController
{

    UILabel *_labelTitle;
    UIImageView *_activityBGImage;
    UIImageView *_footBarImage;
    UIImageView *_slideImage;
    NSInteger _lastTouchNumber;
}

@property (strong,nonatomic) UIImageView *activityImage;
@property (strong,nonatomic) UILabel *activityLabel;

@property (strong,nonatomic) UIButton *receiveAwardsButton;

@property (strong,nonatomic) UIButton *firstActivityButton;
@property (strong,nonatomic) UIButton *secondActivityButton;
@property (strong,nonatomic) UIButton *thirdActivityButton;
@property (strong,nonatomic) UIButton *fourthActivityButton;

@end
