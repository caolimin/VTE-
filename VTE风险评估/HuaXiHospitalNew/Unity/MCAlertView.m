////
////  MCAlertViewController.m
////  HealthChat3.0
////
////  Created by maomao on 13-4-19.
////  Copyright (c) 2013年 maomao. All rights reserved.
////
//
#import "MCAlertView.h"
//#import "MCShadowView.h"
//#import "UIImage+Extensions.h"
//#import "UIView+PopUp.h"
//#import "HealthChatAppDelegate.h"
//#import "LoginEventHandlerViewController.h"
//#import "UIColor+UIColorExetnsion.h"
//#import "UIDevice+Extensions.h"
//
//@interface MCAlertContentView : UIView {
//    @public
//    UILabel *_titleLabel;
//}
//@property (nonatomic, unsafe_unretained) UIView *customView;
//@property (unsafe_unretained, nonatomic, readonly) UILabel *titleLabel;
//@property (nonatomic, strong) UIButton *cancelButton;
//@property (nonatomic, strong) NSArray *otherButtons;
//@end
//@implementation MCAlertContentView
//- (UILabel *)titleLabel {
//    if (!_titleLabel) {
//        _titleLabel = [[UILabel alloc] initWithFrame:CGRectZero];
//        _titleLabel.textAlignment = NSTextAlignmentCenter;
//        _titleLabel.lineBreakMode = NSLineBreakByTruncatingMiddle;
//        _titleLabel.backgroundColor = [UIColor clearColor];
//        _titleLabel.font = [UIFont systemFontOfSize:19];
//        _titleLabel.shadowColor = [UIColor whiteColor];
//        _titleLabel.shadowOffset = CGSizeMake(0, 1);
//        [self addSubview:_titleLabel];
//    }
//    return _titleLabel;
//}
//- (void)setCustomView:(UIView *)customView {
//    if (_customView != customView) {
//        [_customView removeFromSuperview];
//        _customView = customView;
//        if (customView) {
//            [self addSubview:customView];
//        }
//    }
//}
//
//- (void)drawRect:(CGRect)rect {
//    [MCAutoStretchIMG(@"custom_alert_view_background.png") drawInRect:rect];
//}
//
//- (NSInteger)numButtons {
//    if (self.cancelButton) {
//        return self.otherButtons.count + 1;
//    }
//    return self.otherButtons.count;
//}
//
//- (UIButton *)buttonAtIndex:(NSInteger)index {
//    if (self.cancelButton) {
//        if (index == 0) {
//            return self.cancelButton;
//        } else {
//            return [self.otherButtons objectAtIndex:index - 1];
//        }
//    } else {
//        return [self.otherButtons objectAtIndex:index];
//    }
//}
//
//- (NSInteger)indexForButton:(UIButton *)button {
//    if (self.cancelButton) {
//        if (button == self.cancelButton) {
//            return 0;
//        } else {
//            return [self.otherButtons indexOfObject:button] + 1;
//        }
//    } else {
//        return [[self otherButtons] indexOfObject:button];
//    }
//}
//
//- (void)layoutButtons:(NSInteger)count widthButtonHeight:(float)height {
//    CGRect frame = self.customView.frame;
//    float x = frame.origin.x;
//    float y = frame.origin.y + frame.size.height;
//    float width = frame.size.width + x * 2;
//    if (count == 2) {
//        float width_2 = width / 2;
//        for (int i = 0; i < 2; i++) {
//            [[self buttonAtIndex:i] setFrame:CGRectMake(0 + (width_2) * i, y + 5, width_2, height)];
//        }
//    } else {
//        for (int i = 0; i < count; i++) {
//            [[self buttonAtIndex:i] setFrame:CGRectMake(0, y + 5 + height * i , width , height)];
//        }
//    }
//}
//
//- (void)layoutSubviews {
//    CGRect frame = _customView.frame;
//    frame.origin.x = 10;
//    frame.origin.y = 37;
//    _customView.frame = frame;
//    
//    frame.size.width += 20;
//    frame.size.height += 40;
//    
//    NSInteger numButtons = [self numButtons];
//    if (numButtons) {
//        float buttonHeight = 47;
//        [self layoutButtons:numButtons widthButtonHeight:buttonHeight];
//        
//        if (numButtons > 2) {
//            buttonHeight *= numButtons;
//        }
//        frame.size.height += buttonHeight;
//    }
//    CGSize superSize = self.superview.frame.size;
//    frame.origin.x = (superSize.width - frame.size.width) * 0.5f;
//    frame.origin.y = (superSize.height - frame.size.height) * 0.5f;
//    self.frame = frame;
//    
//    if (_titleLabel) {
//        _titleLabel.frame = CGRectMake(10, 5, frame.size.width - 20, 30);
//    }
//}
//
//@end
//
//
//static __strong NSMutableArray *alert_queue;
//NSString *const ALERT_SUBMIT_DEFAULT = @"知道了";
//@interface MCAlertView ()<MCShadowViewDelegate> {
//    CGFloat _layoutOrigin;
//    UIWindow *_window;
//    BOOL _hasFirstResponsderContent;
////    MCAlertView __strong *_retainedSelf;
//}
//@property (nonatomic, strong) MCAlertContentView *contentView;
//@property (nonatomic, strong) MCShadowView *shadowView;
//- (id)initWithCustomView:(UIView *)view title:(NSString *)title cancelButtonTitle:(NSString *)cancelButtonTitle otherButton:(NSString *)otherButtonTitles list:(va_list)buttons;
//@end
//
//@implementation MCAlertView
//- (int)cancelButtonIndex {
//    if (_contentView.cancelButton) {
//        return 0;
//    } else {
//        return -1;
//    }
//}
//
//- (UIView *)customContentView {
//    return _contentView;
//}
//
//- (UIButton *)buttonWithTitle:(NSString *)title image:(UIImage *)image {
//    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
////    [button setBackgroundImage:image forState:UIControlStateNormal];
//    [button setTitle:title forState:UIControlStateNormal];
//    [button addTarget:self action:@selector(handleTaped:) forControlEvents:UIControlEventTouchUpInside];
//    [button setTitleColor:[UIColor colorWithHEX:0x136dd7] forState:UIControlStateNormal];
//    [self.contentView addSubview:button];
//    return button;
//}
//
//- (void)handleTaped:(id)sender {
//    MCAlertView *target = self;
//    [target shadowViewHasTouched:_shadowView];
//    if (target.clickButtonBlock) {
//        target.clickButtonBlock(target,[_contentView indexForButton:sender]);
//    }
//}
//
//- (UIButton *)cancelButton:(NSString *)title {
//    return [self buttonWithTitle:title image:nil];
//}
//
//- (UIButton *)submitButton:(NSString *)title {
//    return [self buttonWithTitle:title image:nil];
//}
//
//- (id)initWithCustomView:(UIView *)view title:(NSString *)title cancelButtonTitle:(NSString *)cancelButtonTitle otherButton:(NSString *)otherButtonTitles list:(va_list)buttons {
//    self = [super initWithFrame:[[UIScreen mainScreen] applicationFrame]];
//    if (self) {
//        _shadowView = [[MCShadowView alloc] initWithFrame:self.bounds];
//        [self addSubview:_shadowView];
//
//        _contentView = [[MCAlertContentView alloc] initWithFrame:CGRectZero];
//        if (title) {
//            _contentView.titleLabel.text = title;
//        } else {
//            _contentView.titleLabel.text = APPNAME;
//        }
//        _contentView.customView = view;
//        if (cancelButtonTitle) {
//            _contentView.cancelButton = [self cancelButton:cancelButtonTitle];
//        }
//        if (otherButtonTitles) {
//            NSMutableArray *array = [NSMutableArray array];
//            while (otherButtonTitles) {
//                [array addObject:[self submitButton:otherButtonTitles]];
//                otherButtonTitles = va_arg(buttons, id);
//            }
//            _contentView.otherButtons = array;
//        }
//        int count = 0;
//        if (_contentView.cancelButton) {
//            count = 1;
//        }
//        count += _contentView.otherButtons.count;
//        UIButton *button = nil;
//        BOOL hasOther = NO;
//        if (_contentView.cancelButton) {
//            if (_contentView.otherButtons.count == 1) {
//                button = [_contentView.otherButtons objectAtIndex:0];
//            }
//            hasOther = YES;
//        } else {
//            if (_contentView.otherButtons.count == 2) {
//                button = [_contentView.otherButtons objectAtIndex:1];
//            } else if (_contentView.otherButtons.count > 0) {
//                hasOther = YES;
//            }
//        }
//        if (button) {
//            UIImage *image = MCAutoStretchIMG(@"custom_alert_view_buttom_image_1.png");
//            [button setBackgroundImage:image forState:UIControlStateNormal];
//        }
//        if (hasOther) {
//            UIImage *image = MCAutoStretchIMG(@"custom_alert_view_buttom_image_2.png");
//            [_contentView.cancelButton setBackgroundImage:image forState:UIControlStateNormal];
//            for (UIButton *aButton in _contentView.otherButtons) {
//                if (aButton != button) {
//                    [aButton setBackgroundImage:image forState:UIControlStateNormal];
//                }
//            }
//        }
//        [_contentView setBackgroundColor:[UIColor clearColor]];
//        [self addSubview:_contentView];
//    }
//    return self;
//}
//
//
//- (void)registNotifications {
//    NSNotificationCenter *center = [NSNotificationCenter defaultCenter];
//    [center addObserver:self selector:@selector(handleKeyboardWillShow:) name:UIKeyboardWillShowNotification object:nil];
//    [center addObserver:self selector:@selector(handleKeyboardWillHide:) name:UIKeyboardWillHideNotification object:nil];
//}
//
//
//- (void)toRemoveAlertView:(id)sender {
//    if ([alert_queue lastObject] == self) {
//        [self dismissWithAnimate:YES removeStack:YES];
//    }
//    alert_queue = nil;
//}
//
//
//+ (MCAlertView *)viewWithTitle:(NSString *)title customView:(UIView *)customView cancelButtonTitle:(NSString *)cancelButtonTitle otherButtonTitles:(NSString *)otherButtonTitles, ... {
//    va_list args = nil;
//    if (otherButtonTitles) {
//        va_start(args, otherButtonTitles);
//    }
//    MCAlertView *alertView = [[self alloc] initWithCustomView:customView title:title cancelButtonTitle:cancelButtonTitle otherButton:otherButtonTitles list:args];
//    if (otherButtonTitles) {
//        va_end(args);
//    }
//    return alertView;
//}
//
//+ (MCAlertView *)viewWithTitle:(NSString *)title message:(NSString *)message cancelButtonTitle:(NSString *)cancelButtonTitle otherButtonTitles:(NSString *)otherButtonTitles, ... {
//    UIFont *font = [UIFont systemFontOfSize:15];
//    CGSize size = [message sizeWithFont:font constrainedToSize:CGSizeMake(250, NSIntegerMax) lineBreakMode:NSLineBreakByWordWrapping];
//    size.height = MAX(size.height, 40);
//    UIView *customView = nil;
//    if (size.height > 200) {
//        UITextView *textView = [[UITextView alloc] initWithFrame:CGRectMake(0, 0, 250, 200)];
//        textView.font = font;
//        textView.editable = NO;
//        textView.backgroundColor = [UIColor clearColor];
//        textView.text = message;
//        customView = textView;
//    } else {
//        UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 250, size.height)];
//        label.numberOfLines = 0;
//        label.font = font;
//        label.backgroundColor = [UIColor clearColor];
//        label.text = message;
//        label.textAlignment = NSTextAlignmentCenter;
//        customView = label;
//    }
//    va_list args = nil;
//    if (otherButtonTitles) {
//        va_start(args, otherButtonTitles);
//    }
//    MCAlertView *view = [[self alloc] initWithCustomView:customView title:title cancelButtonTitle:cancelButtonTitle otherButton:otherButtonTitles list:args];
//    if (otherButtonTitles) {
//        va_end(args);
//    }
//    return view;
//}
//
//- (void)shadowViewHasTouched:(id)shadowView {
//    if (!self.dismissByManul) {
//        [self dismiss];
//        
//    }
//}
//
//- (void)setTextAlignment:(NSTextAlignment)textAlignment {
//    id view = self.contentView.customView;
//    if ([view respondsToSelector:@selector(setTextAlignment:)]) {
//        [view setTextAlignment:textAlignment];
//    }
//}
//
//- (void)dismissWithAnimate:(BOOL)animate removeStack:(BOOL)removeStack {
//    if ([[UIApplication sharedApplication] keyWindow] == self) {
//        [[[UIApplication sharedApplication] applicationWindow] makeKeyWindow];
//        
//        trace(@"reset key window to application window");
//    }
//    
//    [self hideKeyboard:self];
//    if (removeStack) {
//        if ([alert_queue lastObject] == self) {
//            [alert_queue removeLastObject];
//            if (alert_queue.count) {
//                [(MCAlertView *)[alert_queue lastObject] showWithFirstTime:NO];
//            } else {
//                alert_queue = nil;
//            }
//        }
//    }
//    
//    if (animate) {
//        [UIView animateWithDuration:.25f animations:^{
//            [self setAlpha:0];
//        } completion:^(BOOL finished) {
//            [self dismissComplete];
//        }];
//    } else {
//        [self dismissComplete];
//    }
//    
//}
//
//- (void)dismissComplete {
//    if (self.completeMissBlock) {
//        self.completeMissBlock();
//    }
//    [self setHidden:YES];
//}
//
//- (void)dismissByRemoveStack : (BOOL)removeStack {
//    [self dismissWithAnimate:YES removeStack:removeStack];
//}
//
//- (void)dismiss {
//    [self dismissWithAnimate:YES removeStack:YES];
//}
//
//- (BOOL)hasInputTargetInView:(UIView *)view {
//    for (UIView *temp in [view subviews]) {
//        if ([temp conformsToProtocol:@protocol(UITextInput)]) {
//            return YES;
//        } else {
//            if ([self hasInputTargetInView:temp]) {
//                return YES;
//            }
//        }
//    }
//    return NO;
//}
//
//- (void)registDismissNotification {
//    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(toRemoveAlertView:) name:LoginPanelWillShowNotification object:nil];
//}
//
//- (id)showWithFirstTime:(BOOL)firstTime {
//    [self makeKeyAndVisible];
//    if (firstTime) {
//        [self registDismissNotification];
//        
//        [[alert_queue lastObject] dismissByRemoveStack:NO];
//        if (!alert_queue) {
//            alert_queue = [NSMutableArray array];
//        }
//        [alert_queue addObject:self];
//        
//        if (![self hasInputTargetInView:self]) {
//            [self setWindowLevel:UIWindowLevelStatusBar - 1];
//            _hasFirstResponsderContent = YES;
//        } else {
//            [self registNotifications];
//        }
//    } else {
//        [self setAlpha:1];
//        [self setHidden:NO];
//    }
//
//    if ([self.contentView.customView isKindOfClass:[UITextView class]]) {
//        [(UITextView *)self.contentView.customView flashScrollIndicators];
//    }
//    [self popupSubview:self.contentView atPosition:PopupCenterX | PopupCenterY];
//    return self;
//}
//
//- (id)show {
//    return [self showWithFirstTime:YES];
//}
//
//+ (MCAlertView *)alert:(NSString *)str {
//    return [[[self class] viewWithTitle:nil message:str cancelButtonTitle:nil otherButtonTitles:(NSString *)ALERT_SUBMIT_DEFAULT, nil] show];
//}
//
//+ (MCAlertView *)alert:(NSString *)str withCancel:(NSString *)cancel submit:(NSString *)submit {
//    return [[[self class] viewWithTitle:nil message:str cancelButtonTitle:cancel otherButtonTitles:submit, nil] show];
//}
//
//
//- (void)handleKeyboardWillShow:(NSNotification *)notification {
//    [self.contentView layoutIfNeeded];
//    _layoutOrigin = self.contentView.frame.origin.y;
//    NSDictionary *userInfo = [notification userInfo];
//    CGRect rect = [[userInfo objectForKey:UIKeyboardFrameEndUserInfoKey] CGRectValue];
//    [UIView animateWithDuration:[[userInfo objectForKey:UIKeyboardAnimationDurationUserInfoKey] floatValue] animations:^{
//        CGRect frame = self.contentView.frame;
//        frame.origin.y = rect.origin.y - frame.size.height - 20;
//        self.contentView.frame = frame;
//    }];
//}
//
//- (void)handleKeyboardWillHide:(NSNotification *)notification {
//    [UIView animateWithDuration:.25f animations:^{
//        CGRect frame = self.contentView.frame;
//        frame.origin.y = _layoutOrigin;
//        self.contentView.frame = frame;
//    }];
//}
//
//- (void)hideKeyboard:(UIView *)view {
//    for (UIView *temp in [view subviews]) {
//        if ([temp isFirstResponder]) {
//            [temp resignFirstResponder];
//            return;
//        } else {
//            [self hideKeyboard:temp];
//        }
//    }
//}
//
//- (NSString *)description {
//    return self.contentView.titleLabel.text;
//}
//
//- (void)dealloc {
//    [[NSNotificationCenter defaultCenter] removeObserver:self];
//}
//@end

@interface MCAlertView ()<UIAlertViewDelegate>

@end

@implementation MCAlertView
+ (MCAlertView *)alert:(NSString *)str {
    MCAlertView *alert = [[MCAlertView alloc] initWithTitle:@"" message:str delegate:nil cancelButtonTitle:nil otherButtonTitles:@"确定", nil];
    [alert setDelegate:alert];
    [alert show];
    return alert;
}
+ (MCAlertView *)alert:(NSString *)str title:(NSString *)title{
    MCAlertView *alert = [[MCAlertView alloc] initWithTitle:title message:str delegate:nil cancelButtonTitle:nil otherButtonTitles:@"确定", nil];
    [alert setDelegate:alert];
    [alert show];
    return alert;
}
+ (MCAlertView *)alert:(NSString *)str withCancel:(NSString *)cancel submit:(NSString *)submit {
    MCAlertView *alert = [[MCAlertView alloc] initWithTitle:@"" message:str delegate:nil cancelButtonTitle:cancel otherButtonTitles:submit, nil];
    [alert setDelegate:alert];
    [alert show];
    return alert;
}
+ (MCAlertView *)alert:(NSString *)str withCancel:(NSString *)cancel submit:(NSString *)submit title:(NSString*)title{
    MCAlertView *alert = [[MCAlertView alloc] initWithTitle:title message:str delegate:nil cancelButtonTitle:cancel otherButtonTitles:submit, nil];
    [alert setDelegate:alert];
    [alert show];
    return alert;
}

- (void)willMoveToWindow:(UIWindow *)newWindow {
    self.delegate = self;
}

//- (id)delegate {
//    return self;
//}

- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex {
    if (self.clickButtonBlock) {
        self.clickButtonBlock(self,buttonIndex);
    }
}

- (void)alertView:(UIAlertView *)alertView didDismissWithButtonIndex:(NSInteger)buttonIndex {
    if (self.completeMissBlock) {
        self.completeMissBlock();
    }
}

- (void)layoutSubviews {
    [super layoutSubviews];
    [self setDelegate:self];
}
@end
