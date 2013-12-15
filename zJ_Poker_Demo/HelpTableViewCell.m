//
//  HelpTableViewCell.m
//  zJ_Poker_Demo
//
//  Created by zJ on 13-12-10.
//  Copyright (c) 2013年 zJ. All rights reserved.
//

#import "HelpTableViewCell.h"

@implementation HelpTableViewCell


@synthesize cellName = _cellName;


- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        // Initialization code
        
        [self _initView];
    }
    return self;
}

- (void) _initView
{
    _backGroundImage = [[UIImageView alloc] initWithFrame:self.frame];
    [_backGroundImage setWidth:ScreenHeight];
    [_backGroundImage setImage:[UIImage imageNamed:@"新条.png"]];
    [self.contentView addSubview:_backGroundImage];
    
    _cellName = [[UILabel alloc] initWithFrame:CGRectMake(16, 10, 300, 20)];
    [_cellName setFont:[UIFont systemFontOfSize:17]];
    [_cellName setTextColor:[UIColor darkGrayColor]];
    [self.contentView addSubview:_cellName];
    
    _accessView = [[UIImageView alloc] initWithFrame:CGRectMake(400,14, 12, 15)];
    _accessView.image = [UIImage imageNamed:@"箭头.png"];
    [self.contentView addSubview:_accessView];
    
    UIView *view = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 440, 41)];
    view.backgroundColor = [UIColor whiteColor];
    self.selectedBackgroundView = view;
    
}


- (void)setHighlighted:(BOOL)highlighted animated:(BOOL)animated{
    [super setHighlighted:highlighted animated:animated];
    if(highlighted){
        _backGroundImage.alpha = 0;
    }
    else{
        _backGroundImage.alpha = 1;
    }
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
