//
//  RankDetailViewController.h
//  zJ_Poker_Demo
//
//  Created by zJ on 13-12-12.
//  Copyright (c) 2013年 zJ. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "RankTableView.h"

@interface RankDetailViewController : UIViewController
{
 
    UIImageView *_firstBackGroundImage;
}

@property (strong,nonatomic) UILabel *labelTitle;
@property (strong,nonatomic) RankTableView *rankTableView;

@end
