//
//  KtextFieldView.h
//  HuaXiHospitalNew
//
//  Created by admin on 2019/3/14.
//  Copyright © 2019年 caolimin. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface KtextFieldView : UIView
@property(nonatomic,strong) UITextField * textField;
- (instancetype)initWithFrame:(CGRect)frame title:(NSString *)title;
@end

NS_ASSUME_NONNULL_END
