//
//  UIButton+Extensions.m
//  HealthChat3.0
//
//  Created by maomao on 12-11-28.
//  Copyright (c) 2012年 maomao. All rights reserved.
//

#import "UIButton+Extensions.h"
#import "UIColor+UIColorExetnsion.h"
@implementation UIButton (Extensions)
+ (id)buttonWithBackground:(UIImage *)image title:(NSString *)title target:(id)target action:(SEL)action {
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    if (image) {
        [button setBackgroundImage:image forState:UIControlStateNormal];
    }
    CGRect frame = CGRectZero;
    frame.size = image.size;
    button.frame = frame;
    
    if (title) {
        [button setTitle:title forState:UIControlStateNormal];
    }
    
    if (target && action) {
        [button addTarget:target action:action forControlEvents:UIControlEventTouchUpInside];
    }
    
    return button;
}

+ (id)buttonWithFrame:(CGRect)frame Background:(UIImage *)image title:(NSString *)title target:(id)target action:(SEL)action{
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    button.frame = frame;
    if (image) {
        [button setBackgroundImage:image forState:UIControlStateNormal];
    }
    if (title) {
        [button setTitle:title forState:UIControlStateNormal];
        [button setTitleColor:[UIColor flashColorWithRed:29 green:29 blue:29 alpha:1] forState:UIControlStateNormal];
        button.titleLabel.font = [UIFont systemFontOfSize:15.f];
    }
    if (action && target) {
        [button addTarget:target action:action forControlEvents:UIControlEventTouchUpInside];
    }
    return button;
}

+ (id)buttonWithImage:(UIImage *)image {
    UIButton *button = [[self class] buttonWithType:UIButtonTypeCustom];
    button.frame = CGRectMake(0, 0, image.size.width, image.size.height);
    [button setBackgroundImage:image forState:UIControlStateNormal];
    return button;
}

+ (id)buttonWithFrame:(CGRect)frame BackgroundColor:(UIColor *)BackgroundColor Tittle:(NSString *)title TittleColor:(UIColor *)TittleColor target:(id)target action:(SEL)action{
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    button.layer.cornerRadius = 7;
    button.frame = frame;
    if (BackgroundColor) {
        [button setBackgroundColor:BackgroundColor];
    }
    if (title) {
        [button setTitle:title forState:UIControlStateNormal];
        button.titleLabel.font = [UIFont systemFontOfSize:20.f];
    }
    if (TittleColor) {
        [button setTitleColor:TittleColor forState:UIControlStateNormal];
    }
    if (action && target) {
        [button addTarget:target action:action forControlEvents:UIControlEventTouchUpInside];
    }
    return button;
}


@end
