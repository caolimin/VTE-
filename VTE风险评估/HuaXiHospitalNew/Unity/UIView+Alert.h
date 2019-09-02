//
//  UIView+Alert.h
//  HealthChat
//
//  Created by maomao on 15/2/6.
//  Copyright (c) 2015年 maomao. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MCCustomAlertView : UIWindow
@property (nonatomic, copy) void(^clickButtonBlock)(MCCustomAlertView *alertView,NSInteger idx);
@property (nonatomic, copy) void(^completeMissBlock)();
@property (nonatomic, readonly) int cancelButtonIndex;
@property (nonatomic, assign) BOOL dismissByManul;
@property (unsafe_unretained, nonatomic, readonly) UIView *customContentView;
@property (nonatomic, assign) NSTextAlignment textAlignment;
+ (MCCustomAlertView *)viewWithTitle:(NSString *)title customView:(UIView *)customView cancelButtonTitle:(NSString *)cancelButtonTitle otherButtonTitles:(NSString *)otherButtonTitles,...NS_REQUIRES_NIL_TERMINATION;

+ (MCCustomAlertView *)viewWithTitle:(NSString *)title message:(NSString *)message cancelButtonTitle:(NSString *)cancelButtonTitle otherButtonTitles:(NSString *)otherButtonTitles,...NS_REQUIRES_NIL_TERMINATION;

+ (MCCustomAlertView *)alert:(NSString *)str;
+ (MCCustomAlertView *)alert:(NSString *)str withCancel:(NSString *)cancel submit:(NSString *)submit;
- (id)show;
- (void)registDismissNotification;
- (void)dismiss;
@end

@interface UIView (Alert)
- (MCCustomAlertView *)alertWithTitle:(NSString *)title cancelButtonTitle:(NSString *)cancelButtonTitle otherButtonTitles:(NSString *)otherButtonTitles,...NS_REQUIRES_NIL_TERMINATION;
@end
