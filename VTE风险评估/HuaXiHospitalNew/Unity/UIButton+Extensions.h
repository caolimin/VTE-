//
//  UIButton+Extensions.h
//  HealthChat3.0
//
//  Created by maomao on 12-11-28.
//  Copyright (c) 2012年 maomao. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIButton (Extensions)
+ (id)buttonWithBackground:(UIImage *)image title:(NSString *)title target:(id)target action:(SEL)action;
+ (id)buttonWithFrame:(CGRect)frame Background:(UIImage *)image title:(NSString *)title target:(id)target action:(SEL)action;
+ (id)buttonWithImage:(UIImage *)image;
+ (id)buttonWithFrame:(CGRect)frame BackgroundColor:(UIColor *)BackgroundColor Tittle:(NSString *)title TittleColor:(UIColor *)TittleColor target:(id)target action:(SEL)action;

@end
