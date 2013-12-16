//
//  GameSquareSearchBarView.m
//  zJ_Poker_Demo
//
//  Created by zJ on 13-12-5.
//  Copyright (c) 2013年 zJ. All rights reserved.
//

#import "GameSquareSearchBarView.h"

@implementation GameSquareSearchBarView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        [self _initBackGroundImage];
        [self _initSelectBar];
    }
    return self;
}

- (void)_initBackGroundImage
{
    _backGroundImage = [[UIImageView alloc] initWithFrame:CGRectMake(5, 0, self.width, self.height)];
    _backGroundImage.layer.cornerRadius = 5.0;
    _backGroundImage.layer.borderWidth = 1.0;
    _backGroundImage.layer.masksToBounds = YES;
    [_backGroundImage setUserInteractionEnabled:YES];
    
    _backGroundImage.backgroundColor = [UIColor colorWithRed:46/255.0 green:78/255.0 blue:126/255.0 alpha:1];
    
    [self addSubview:_backGroundImage];

}

- (void) _initSelectBar
{
    
    _sliderView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"Roomlist_roomTypeSelected1.png"]];
    _sliderView.frame = CGRectMake(117.5, -9, 117.5, self.height+19);
    [self addSubview:_sliderView];
    
    NSArray *arr = @[@"新手场",@"初级场",@"中级场",@"高级场"];
    for(int i =0;i<4;i++){
        UIButton *button = [[UIButton alloc] initWithFrame:CGRectMake(i * 117.5, 0, 117.5, self.height)];
        [button addTarget:self action:@selector(selectedAction:) forControlEvents:UIControlEventTouchUpInside];
        [button setImage:[UIImage imageNamed:@"Roomlist_roomTypeSelectedHeight.png"] forState:UIControlStateHighlighted];
        button.tag = i;
        
        UILabel *buttonTile= [[UILabel alloc] initWithFrame:CGRectMake(37,0,117.5,self.height)];
        buttonTile.tag = i;
        [buttonTile setText:arr[i]];
        [buttonTile setTextColor:[UIColor blackColor]];
        
        [self addSubview:button];
        [button addSubview:buttonTile];
        
    }
}


- (void) selectedAction:(UIButton *) button
{
    

    float x = button.left + (button.width-_sliderView.width)/2;
    
    [UIView animateWithDuration:0.2 animations:^{
        _sliderView.left = x + 5;
        if(button.tag == 0){
            [_sliderView setImage:[UIImage imageNamed:@"Roomlist_roomTypeSelected2.png"]];
            if (self.firstTouchBlock) {
                self.firstTouchBlock();
            }
            
        }
        else if(button.tag == 1){
            [_sliderView setImage:[UIImage imageNamed:@"Roomlist_roomTypeSelected1.png"]];
            if (self.secondTouchBlock) {
                self.secondTouchBlock();
            }
        }
        else if(button.tag == 2){
            [_sliderView setImage:[UIImage imageNamed:@"Roomlist_roomTypeSelected1.png"]];
            if (self.thirdTouchBlock) {
                self.thirdTouchBlock();
            }
        }
        else{
            [_sliderView setImage:[UIImage imageNamed:@"Roomlist_roomTypeSelected3.png"]];
            if (self.fourthTouchBlock) {
                self.fourthTouchBlock();
            }
        }

    }];

    
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
