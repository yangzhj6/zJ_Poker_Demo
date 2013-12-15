//
//  SettingView.h
//  zJ_Poker_Demo
//
//  Created by zJ on 13-12-8.
//  Copyright (c) 2013年 zJ. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SettingView : UIView
{
    UIImageView *_backGroundImage;
    UILabel *_nomalLabel;
    UILabel *_quickLabel;
    UILabel *_fivePeopleLabel;
    UILabel *_otherLabel;
    UILabel *_hideFullLabel;
    UILabel *_hideEmptyLabel;
    UIImageView *_nomalImage;
    UIImageView *_quickImage;
    UIImageView *_fivePeopleImage;
    UIImageView *_otherImage;
    UIImageView *_hideFullImage;
    UIImageView *_hideEmptyImage;

}

@property (strong,nonatomic) UIButton *nomalButton;
@property (strong,nonatomic) UIButton *quickButton;
@property (strong,nonatomic) UIButton *fivePeoplrButton;
@property (strong,nonatomic) UIButton *otherButton;
@property (strong,nonatomic) UIButton *hideFullButton;
@property (strong,nonatomic) UIButton *hideEmptyButton;

@property (nonatomic,assign) BOOL ifQuick;
@property (nonatomic,assign) BOOL ifFivePeople;
@property (nonatomic,assign) BOOL ifOther;
@property (nonatomic,assign) BOOL ifHideFull;
@property (nonatomic,assign) BOOL ifHideEmpty;

- (void)storeData;

@end
