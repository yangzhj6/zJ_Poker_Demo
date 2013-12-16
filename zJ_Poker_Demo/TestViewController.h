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

}

@property (strong,nonatomic) UIScrollView *scrollView;
@property (strong,nonatomic) UILabel *labelTitle;
@property (assign,nonatomic) NSInteger offest_x;

@end
