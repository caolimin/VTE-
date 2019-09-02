//
//  MCAlertViewController.h
//  HealthChat3.0
//
//  Created by maomao on 13-4-19.
//  Copyright (c) 2013年 maomao. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "UIView+Alert.h"


//EXTERN NSString *const ALERT_SUBMIT_DEFAULT;
@interface MCAlertView : UIAlertView
@property (nonatomic, copy) void(^clickButtonBlock)(MCAlertView *alertView,NSInteger idx);
@property (nonatomic, copy) void(^completeMissBlock)();
+ (MCAlertView *)alert:(NSString *)str;
+ (MCAlertView *)alert:(NSString *)str title:(NSString *)title;
+ (MCAlertView *)alert:(NSString *)str withCancel:(NSString *)cancel submit:(NSString *)submit;
+ (MCAlertView *)alert:(NSString *)str withCancel:(NSString *)cancel submit:(NSString *)submit title:(NSString*)title;
@end
