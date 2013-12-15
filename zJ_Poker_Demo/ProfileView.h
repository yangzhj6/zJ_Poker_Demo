//
//  ProfileView.h
//  zJ_Poker_Demo
//
//  Created by zJ on 13-12-4.
//  Copyright (c) 2013年 zJ. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "WXImageView.h"
#import "UserViewController.h"

@interface ProfileView : UIView
{
    
    WXImageView *_userImage;
    UILabel *userName;
    UIView  *money;
    UIView  *level;
    UIButton *logOut;
    
}

@end
