//
//  TestViewController.h
//  zJ_Poker_Demo
//
//  Created by zJ on 13-12-10.
//  Copyright (c) 2013年 zJ. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TestViewController : UIViewController<UIScrollViewDelegate>
{
    NSArray *_titleArray;
    UIImageView *_backGroundImage;
    UIImageView *_titleBarImage;
}

@property (strong,nonatomic) UIScrollView *scrollView;
@property (strong,nonatomic) UILabel *labelTitle;
@property (strong,nonatomic) UIButton *backButton;
@property (assign,nonatomic) NSInteger offest_x;

@property (strong,nonatomic) UIImageView *subView0;
@property (strong,nonatomic) UIImageView *subView1;
@property (strong,nonatomic) UIImageView *subView2;
@property (strong,nonatomic) UIImageView *subView3;
@property (strong,nonatomic) UIImageView *subView4;
@property (strong,nonatomic) UIImageView *subView5;
@property (strong,nonatomic) UIImageView *subView6;

@end
