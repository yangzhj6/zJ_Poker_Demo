//
//  MessageView.h
//  zJ_Poker_Demo
//
//  Created by zJ on 13-12-15.
//  Copyright (c) 2013年 zJ. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MessageView : UIView
{
    BOOL _ifShow;
}
@property (strong,nonatomic) UIImageView *upImageView;
@property (strong,nonatomic) UIView *mainView;
@property (strong,nonatomic) UIImageView *backgroundImage;
@property (strong,nonatomic) UIImageView *downImageView;
@property (strong,nonatomic) UIView *touchView;

- (void) setShow:(BOOL) ifshow;
@end
