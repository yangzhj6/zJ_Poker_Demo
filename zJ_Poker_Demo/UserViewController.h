//
//  UserViewController.h
//  zJ_Poker_Demo
//
//  Created by zJ on 13-12-11.
//  Copyright (c) 2013年 zJ. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UserViewController : UIViewController<UITextFieldDelegate>
{
    UIImageView *_backGroundImage;
    UIImageView *_UserInfoImage;
    UILabel *_userName;
    UILabel *_userMoney;
    UILabel *_userVIP;
    UILabel *_userLevel;
    UILabel *_userID;
    UILabel *_victoryOrDefeat;
    UILabel *_maxCard;
    UILabel *_maxWin;
    UILabel *_Innings;
    UILabel *_maxOwn;
    UIImageView *_genderView;
    UIScrollView *_genderScrollView;
    UIButton *_gender;
    UIImageView *_arrowImage;
    UIImageView *_textFieldBackground;
    BOOL _ifGenderOpen;
}

@property (strong,nonatomic) UITextField *textField;

@property (strong,nonatomic) UIButton *backButton;
@property (strong,nonatomic) UIButton *userInfoButton;
@property (strong,nonatomic) UIButton *myProductButton;
@property (strong,nonatomic) UIButton *modifyUserImageButton;
@property (strong,nonatomic) UIScrollView *userInfoScrollView;
@property (strong,nonatomic) UIView *scrollContentView;

@property (strong,nonatomic) UIButton *modifyButton;
@property (strong,nonatomic) UIButton *getMoneyButton;
@property (strong,nonatomic) UIButton *getVipButton;

@end
