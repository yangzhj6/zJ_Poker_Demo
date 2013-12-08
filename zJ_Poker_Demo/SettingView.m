//
//  SettingView.m
//  zJ_Poker_Demo
//
//  Created by zJ on 13-12-8.
//  Copyright (c) 2013年 zJ. All rights reserved.
//

#import "SettingView.h"



#define SettingViewFont 13

@implementation SettingView

@synthesize nomalButton = _nomalButton;
@synthesize quickButton = _quickButton;
@synthesize fivePeoplrButton = _fivePeoplrButton;
@synthesize otherButton = _otherButton;
@synthesize hideFullButton = _hideFullButton;
@synthesize hideEmptyButton = _hideEmptyButton;


- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        [self _initView];
        
    }
    return self;
}

- (void) _initView
{
    _backGroundImage = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 218, 156)];
    [_backGroundImage setImage:[UIImage imageNamed:@"房间列表_框.png"]];
    [_backGroundImage setUserInteractionEnabled:YES];
    [self addSubview:_backGroundImage];
    
    [self _initButtons];
}

- (void)_initButtons
{
    //普通按钮
    _nomalButton = [[UIButton alloc] initWithFrame:CGRectMake(20, 20, 75, 25)];
    _nomalButton.backgroundColor = [UIColor clearColor];
    [_nomalButton addTarget:self action:@selector(nomalAction:) forControlEvents:UIControlEventTouchUpInside];
    [self addSubview:_nomalButton];
    _nomalLabel = [[UILabel alloc] initWithFrame:CGRectMake(30,0, 60, 25)];
    [_nomalLabel setText:@"普通"];
    [_nomalLabel setTextColor:[UIColor whiteColor]];
    [_nomalLabel setFont:[UIFont systemFontOfSize:SettingViewFont]];
    [_nomalButton addSubview:_nomalLabel];
    _nomalImage = [[UIImageView alloc] initWithFrame:CGRectMake(15, 5, 15, 15)];
    [_nomalImage setImage:[UIImage imageNamed:@"房间列表_白色圆形.png"]];
    [_nomalButton addSubview:_nomalImage];
    
    
    //快速按钮
    _quickButton = [[UIButton alloc] initWithFrame:CGRectMake(115, 20, 75, 25)];
    _quickButton.backgroundColor = [UIColor clearColor];
    [_quickButton addTarget:self action:@selector(quickAction:) forControlEvents:UIControlEventTouchUpInside];
    [self addSubview:_quickButton];
    _quickLabel = [[UILabel alloc] initWithFrame:CGRectMake(30,0, 60, 25)];
    [_quickLabel setText:@"快速"];
    [_quickLabel setTextColor:[UIColor whiteColor]];
    [_quickLabel setFont:[UIFont systemFontOfSize:SettingViewFont]];
    [_quickButton addSubview:_quickLabel];
    _quickImage = [[UIImageView alloc] initWithFrame:CGRectMake(15, 5, 15, 15)];
    [_quickImage setImage:[UIImage imageNamed:@"房间列表_圆形选中.png"]];
    [_quickButton addSubview:_quickImage];
    
    
    //五人场按钮
    _fivePeoplrButton = [[UIButton alloc] initWithFrame:CGRectMake(25, 60, 75, 25)];
    _fivePeoplrButton.backgroundColor = [UIColor clearColor];
    [_fivePeoplrButton addTarget:self action:@selector(fivePeopleAction:) forControlEvents:UIControlEventTouchUpInside];
    [self addSubview:_fivePeoplrButton];
    _fivePeopleLabel = [[UILabel alloc] initWithFrame:CGRectMake(27,0, 60, 25)];
    [_fivePeopleLabel setText:@"五人场"];
    [_fivePeopleLabel setTextColor:[UIColor whiteColor]];
    [_fivePeopleLabel setFont:[UIFont systemFontOfSize:SettingViewFont]];
    [_fivePeoplrButton addSubview:_fivePeopleLabel];
    _fivePeopleImage = [[UIImageView alloc] initWithFrame:CGRectMake(10, 5, 15, 15)];
    [_fivePeopleImage setImage:[UIImage imageNamed:@"房间列表_设置白框.png"]];
    [_fivePeoplrButton addSubview:_fivePeopleImage];


    //其他场按钮
    _otherButton = [[UIButton alloc] initWithFrame:CGRectMake(115, 60, 75, 25)];
    _otherButton.backgroundColor = [UIColor clearColor];
     [_otherButton addTarget:self action:@selector(otherAction:) forControlEvents:UIControlEventTouchUpInside];
    [self addSubview:_otherButton];
    _otherLabel = [[UILabel alloc] initWithFrame:CGRectMake(32,0, 60, 25)];
    [_otherLabel setText:@"其他"];
    [_otherLabel setTextColor:[UIColor whiteColor]];
    [_otherLabel setFont:[UIFont systemFontOfSize:SettingViewFont]];
    [_otherButton addSubview:_otherLabel];
    _otherImage = [[UIImageView alloc] initWithFrame:CGRectMake(15, 5, 15, 15)];
    [_otherImage setImage:[UIImage imageNamed:@"房间列表_方形选中.png"]];
    [_otherButton addSubview:_otherImage];


    //隐藏满房间按钮
    _hideFullButton = [[UIButton alloc] initWithFrame:CGRectMake(20, 107, 90, 25)];
    _hideFullButton.backgroundColor = [UIColor clearColor];
    [_hideFullButton addTarget:self action:@selector(hideFullAction:) forControlEvents:UIControlEventTouchUpInside];
    [self addSubview:_hideFullButton];
    _hideFullLabel = [[UILabel alloc] initWithFrame:CGRectMake(20,0, 70, 25)];
    [_hideFullLabel setText:@"隐藏满房间"];
    [_hideFullLabel setTextColor:[UIColor whiteColor]];
    [_hideFullLabel setFont:[UIFont systemFontOfSize:SettingViewFont]];
    [_hideFullButton addSubview:_hideFullLabel];
    _hideFullImage = [[UIImageView alloc] initWithFrame:CGRectMake(3, 5, 15, 15)];
    [_hideFullImage setImage:[UIImage imageNamed:@"房间列表_方形选中.png"]];
    [_hideFullImage.image setAccessibilityIdentifier:@"方形选中"];
    [_hideFullButton addSubview:_hideFullImage];


    //隐藏空房间按钮
    _hideEmptyButton = [[UIButton alloc] initWithFrame:CGRectMake(115, 107, 90, 25)];
    _hideEmptyButton.backgroundColor = [UIColor clearColor];
    [_hideEmptyButton addTarget:self action:@selector(hideEmptyAction:) forControlEvents:UIControlEventTouchUpInside];
    [self addSubview:_hideEmptyButton];
    _hideEmptyLabel = [[UILabel alloc] initWithFrame:CGRectMake(20,0, 70, 25)];
    [_hideEmptyLabel setText:@"隐藏空房间"];
    [_hideEmptyLabel setTextColor:[UIColor whiteColor]];
    [_hideEmptyLabel setFont:[UIFont systemFontOfSize:SettingViewFont]];
    [_hideEmptyButton addSubview:_hideEmptyLabel];
    _hideEmptyImage = [[UIImageView alloc] initWithFrame:CGRectMake(3, 5, 15, 15)];
    [_hideEmptyImage setImage:[UIImage imageNamed:@"房间列表_设置白框.png"]];
    [_hideEmptyImage.image setAccessibilityIdentifier:@"白框"];
    [_hideEmptyButton addSubview:_hideEmptyImage];


}

# pragma mark ButtonAction

- (void)nomalAction:(UIButton *) button
{
    NSLog(@"%@",@"我被按了普通场");
}
- (void)quickAction:(UIButton *) button
{
    NSLog(@"%@",@"我被按了快速场");
}
- (void)fivePeopleAction:(UIButton *) button
{
    NSLog(@"%@",@"我被按了五人场");
}
- (void)otherAction:(UIButton *) button
{
    NSLog(@"%@",@"我被按了其他场");
}
- (void)hideFullAction:(UIButton *) button
{
    NSLog(@"%@",@"我被按了隐藏满房间");
    if([_hideFullImage.image.accessibilityIdentifier isEqualToString:@"方形选中"]){
        [_hideFullImage setImage:[UIImage imageNamed:@"房间列表_设置白框.png"]];
        [_hideFullImage.image setAccessibilityIdentifier:@"白框"];
    }
    else if([_hideFullImage.image.accessibilityIdentifier isEqualToString:@"白框"]){
        [_hideFullImage setImage:[UIImage imageNamed:@"房间列表_方形选中.png"]];
        [_hideFullImage.image setAccessibilityIdentifier:@"方形选中"];
    }
    else{
        NSLog(@"%@",@"nothing happen!");
    }
}
- (void)hideEmptyAction:(UIButton *) button
{
    NSLog(@"%@",@"我被按了隐藏空房间");
    if([_hideEmptyImage.image.accessibilityIdentifier isEqualToString:@"方形选中"]){
        [_hideEmptyImage setImage:[UIImage imageNamed:@"房间列表_设置白框.png"]];
        [_hideEmptyImage.image setAccessibilityIdentifier:@"白框"];
    }
    else if([_hideEmptyImage.image.accessibilityIdentifier isEqualToString:@"白框"]){
        [_hideEmptyImage setImage:[UIImage imageNamed:@"房间列表_方形选中.png"]];
        [_hideEmptyImage.image setAccessibilityIdentifier:@"方形选中"];
    }
    else{
        NSLog(@"%@",@"nothing happen!");
    }
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
