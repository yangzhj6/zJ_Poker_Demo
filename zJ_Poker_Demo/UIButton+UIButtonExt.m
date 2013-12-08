//
//  UIButton+UIButtonExt.m
//  zJ_Poker_Demo
//
//  Created by zJ on 13-12-5.
//  Copyright (c) 2013年 zJ. All rights reserved.
//

#import "UIButton+UIButtonExt.h"

@implementation UIButton (UIButtonExt)


- (void) buttonStyle
{
    self.layer.borderWidth = 1;
    self.layer.cornerRadius = 5.0;
    self.layer.masksToBounds = YES;
    [self setAdjustsImageWhenHighlighted:NO];
    [self setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
}

- (void) quickStart
{
    [self buttonStyle];
    
    self.backgroundColor = [UIColor colorWithRed:66/255.0 green:139/255.0 blue:222/255.0 alpha:1];
//    self.backgroundColor = [UIColor redColor];
    self.layer.borderColor = [[UIColor colorWithRed:55/255.0 green:125/255.0 blue:190/255.0 alpha:1] CGColor];
//    self.layer.borderColor = [[UIColor redColor] CGColor];
     [self setBackgroundImage:[self buttonImageFromColor:[UIColor colorWithRed:50/255.0 green:120/255.0 blue:170/255.0 alpha:1]] forState:UIControlStateHighlighted];
    
    [self.titleLabel setFont:[UIFont boldSystemFontOfSize:20]];
    
}
- (void) squareGame
{
    
    [self buttonStyle];
    
    self.backgroundColor = [UIColor colorWithRed:66/255.0 green:200/255.0 blue:125/255.0 alpha:1];
    self.layer.borderColor = [[UIColor colorWithRed:55/255.0 green:125/255.0 blue:190/255.0 alpha:1] CGColor];
    [self setBackgroundImage:[self buttonImageFromColor:[UIColor colorWithRed:50/255.0 green:170/255.0 blue:120/255.0 alpha:1]] forState:UIControlStateHighlighted];
    
    [self.titleLabel setFont:[UIFont boldSystemFontOfSize:20]];
    
}

- (void) beginStudy
{
    [self buttonStyle];
    self.layer.cornerRadius = 15.0;
    
    self.backgroundColor = [UIColor colorWithRed:66/255.0 green:119/255.0 blue:255/255.0 alpha:1];
    self.layer.borderColor = [[UIColor colorWithRed:55/255.0 green:125/255.0 blue:190/255.0 alpha:1] CGColor];
    [self setBackgroundImage:[self buttonImageFromColor:[UIColor colorWithRed:50/255.0 green:120/255.0 blue:170/255.0 alpha:1]] forState:UIControlStateHighlighted];
    
    [self.titleLabel setFont:[UIFont boldSystemFontOfSize:18]];
    
}


- (UIImage *) buttonImageFromColor:(UIColor *)color{
    CGRect rect = CGRectMake(0, 0, self.width, self.height);
    UIGraphicsBeginImageContext(rect.size);
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextSetFillColorWithColor(context, [color CGColor]);
    CGContextFillRect(context, rect);
    UIImage *img = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return img;
}

@end
