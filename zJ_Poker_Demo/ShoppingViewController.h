//
//  ShoppingViewController.h
//  zJ_Poker_Demo
//
//  Created by zJ on 13-12-9.
//  Copyright (c) 2013年 zJ. All rights reserved.
//

#import "BaseViewController.h"
#import "shoppingMallTableView.h"

@interface ShoppingViewController : BaseViewController
{
    UIImageView *_backGroundImage;
}
@property (strong,nonatomic) UIButton *backButton;
@property (strong,nonatomic) UIImageView *shoppingMallViewImage;
@property (strong,nonatomic) shoppingMallTableView *shoppingMallTableView;

@end
