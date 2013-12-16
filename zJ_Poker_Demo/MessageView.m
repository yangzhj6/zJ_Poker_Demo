//
//  MessageView.m
//  zJ_Poker_Demo
//
//  Created by zJ on 13-12-15.
//  Copyright (c) 2013年 zJ. All rights reserved.
//

#import "MessageView.h"

@implementation MessageView

@synthesize touchView = _touchView;
@synthesize mainView = _mainView;
@synthesize upImageView = _upImageView;
@synthesize backgroundImage = _backgroundImage;
@synthesize downImageView = _downImageView;

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        self.clipsToBounds = YES;
        [self _initView];
    }
    return self;
}

- (void) _initView
{
    _upImageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 22, 9)];
    [_upImageView setUserInteractionEnabled:YES];
    [_upImageView setCenter:CGPointMake(self.width/2, -5)];
    [_upImageView setImage:[UIImage imageNamed:@"cnHall_上标签.png"]];
    [self addSubview:_upImageView];
    
    _mainView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, self.width, self.height)];
    [self addSubview:_mainView];
    
    _backgroundImage = [[UIImageView alloc] initWithFrame:_mainView.frame];
    [_backgroundImage setOrigin:CGPointMake(0, 0)];
    [_backgroundImage setImage:[UIImage imageNamed:@"cnHall_下拉底图.png"]];
//    [_backgroundImage setBackgroundColor:[UIColor grayColor]];
    [_mainView addSubview:_backgroundImage];
    
    _downImageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 22, 9)];
    [_downImageView setCenter:CGPointMake(_backgroundImage.width/2, _backgroundImage.bottom - 13)];
    [_downImageView setImage:[UIImage imageNamed:@"cnHall_下标签.png"]];
    [_mainView addSubview:_downImageView];
    
    _touchView = [[UIView alloc] initWithFrame:CGRectMake(5, 102, _backgroundImage.width - 10, 25)];
//    [_touchView setBackgroundColor:[UIColor orangeColor]];
    [self addSubview:_touchView];
    
    UIPanGestureRecognizer *panGuesture = [[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(handlePanGesture:)];
    [_touchView addGestureRecognizer:panGuesture];
    
    [self setShow:NO];

    
}

- (void) setShow:(BOOL) ifshow
{
    _ifShow = ifshow;
    if(_ifShow){
        _mainView.top = 0;
        [_upImageView setCenter:CGPointMake(self.width/2, -5)];
        _touchView.top = 102;

    }
    else{
        _mainView.top = -133;
        [_upImageView setCenter:CGPointMake(self.width/2, 5)];
        _touchView.top = 0;

    }
}



- (void) handlePanGesture:(UIPanGestureRecognizer *)recognizer
{
    
    if(recognizer.state != UIGestureRecognizerStateFailed){
        CGPoint translation = [recognizer translationInView:_touchView];
        CGFloat offest_y = _mainView.frame.origin.y + translation.y;
        if(offest_y < -133){
            offest_y = -133;
        }
        if(offest_y > 0){
            offest_y = 0;
        }
        _mainView.top = offest_y;
//        NSLog(@"%f",offest_y);
        
        if (recognizer.state == UIGestureRecognizerStateEnded) {
            if(_ifShow){
                if(offest_y > - 25){
                    [UIView animateWithDuration:0.15 animations:^{
                        _mainView.top = 0;
                        
                    } completion:^(BOOL finished) {
                        _touchView.top = 102;
                        [_upImageView setCenter:CGPointMake(self.width/2, -5)];
                        _ifShow = YES;
                    }];
                }
                else{
                    [UIView animateWithDuration:0.15 animations:^{
                        _mainView.top = -133;
                    }completion:^(BOOL finished) {
                        _touchView.top = 0;
                        [_upImageView setCenter:CGPointMake(self.width/2, 5)];
                        _ifShow = NO;
                    }];
                }
                
            }else{
                
                if(offest_y > - 90){
                    
                    [UIView animateWithDuration:0.15 animations:^{
                        _mainView.top = 0;
                        
                    } completion:^(BOOL finished) {
                        _touchView.top = 102;
                        [_upImageView setCenter:CGPointMake(self.width/2, -5)];
                        _ifShow = YES;
                    }];
                }
                else{
                    [UIView animateWithDuration:0.15 animations:^{
                        _mainView.top = -133;
                    }completion:^(BOOL finished) {
                        _touchView.top = 0;
                        [_upImageView setCenter:CGPointMake(self.width/2, 5)];
                        _ifShow = NO;
                    }];
                }

            }
        }
    }
    [recognizer setTranslation:CGPointMake(0, 0) inView:_touchView];

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
