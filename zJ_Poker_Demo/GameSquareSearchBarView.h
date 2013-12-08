//
//  GameSquareSearchBarView.h
//  zJ_Poker_Demo
//
//  Created by zJ on 13-12-5.
//  Copyright (c) 2013年 zJ. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void(^firstButtonBlock)(void);
typedef void(^secondButtonBlock)(void);
typedef void(^thirdButtonBlock)(void);
typedef void(^fourthButtonBlock)(void);


@interface GameSquareSearchBarView : UIView
{
    UIImageView *_backGroundImage;
    UIImageView *_sliderView;
    
}

@property(nonatomic,copy)firstButtonBlock firstTouchBlock;
@property(nonatomic,copy)secondButtonBlock secondTouchBlock;
@property(nonatomic,copy)thirdButtonBlock thirdTouchBlock;
@property(nonatomic,copy)fourthButtonBlock fourthTouchBlock;



@end
