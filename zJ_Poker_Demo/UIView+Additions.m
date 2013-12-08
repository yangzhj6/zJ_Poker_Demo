//
//  UIView+Additions.m
//  WXWeibo
//
//  Created by wilson on 6/11/13.
//  Copyright (c) 2013 Zhihui (Robin) Sun. All rights reserved.
//

#import "UIView+Additions.h"

@implementation UIView (Additions)

- (UIViewController *)viewController {
    // 下一个响应者
    UIResponder *next = [self nextResponder];
    do {
        if ([next isKindOfClass:[UIViewController class]] ) {
            return (UIViewController *)next;
        }
        
        next = [next nextResponder];
    } while (next != nil);
    
    return nil;
}

@end
