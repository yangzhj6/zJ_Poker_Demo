//
//  ProfileView.m
//  zJ_Poker_Demo
//
//  Created by zJ on 13-12-4.
//  Copyright (c) 2013年 zJ. All rights reserved.
//

#import "ProfileView.h"

@implementation ProfileView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        [self setBackgroundColor:[UIColor orangeColor]];
        [self _initView];

    }
    return self;
}

- (void)_initView
{
    [self _initUserImage];
    
}

- (void) _initUserImage
{
    _userImage = [[WXImageView alloc] initWithFrame:CGRectMake(7, 7, 55, 55)];
    _userImage.backgroundColor = [UIColor clearColor];
    _userImage.layer.cornerRadius = 5;  //圆弧半径
    _userImage.layer.borderWidth = .5;
    _userImage.layer.borderColor = [UIColor grayColor].CGColor;
    _userImage.layer.masksToBounds = YES;
    _userImage.image = [UIImage imageNamed:@"male_head.jpg"];
    _userImage.touchBlock = ^{
        UserViewController *userVC = [[UserViewController alloc] init];
        [self.viewController.navigationController pushViewController:userVC animated:YES];
    };
    [self addSubview:_userImage];
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
}
*/

@end
