//
//  UIViewController+setBackground.m
//  zJ_Poker_Demo
//
//  Created by zJ on 13-12-16.
//  Copyright (c) 2013年 zJ. All rights reserved.
//

#import "UIViewController+setBackground.h"

@implementation UIViewController (setBackground)


- (void) _initBackGroundEXT
{
    
    UIImageView *_backGroundImage = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, ScreenHeight, ScreenWidth)];
    [_backGroundImage setImage:[UIImage imageNamed:@"二级页面_底.jpg"]];
    [_backGroundImage setUserInteractionEnabled:YES];
    [self.view addSubview:_backGroundImage];
    
    UIImageView *_titleBarImage = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, ScreenHeight, 45)];
    [_titleBarImage setImage:[UIImage imageNamed:@"二级页面_标题.png"]];
    [_titleBarImage setUserInteractionEnabled:YES];
    [self.view addSubview:_titleBarImage];
    
}

- (void)_initBackButtonEXT
{
    UIButton *_backButton = [[UIButton alloc] initWithFrame:CGRectMake(3, 5, 40, 25)];
    [_backButton setImage:[UIImage imageNamed:@"Roomlist_backBtn.png"] forState:UIControlStateNormal];
    [_backButton addTarget:self action:@selector(backAction:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:_backButton];
}
- (void) backAction:(UIButton *) button
{
    [self.navigationController popViewControllerAnimated:YES];
}


@end
