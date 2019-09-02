//
//  KtextFieldView.m
//  HuaXiHospitalNew
//
//  Created by admin on 2019/3/14.
//  Copyright © 2019年 caolimin. All rights reserved.
//

#import "KtextFieldView.h"

@implementation KtextFieldView

- (instancetype)initWithFrame:(CGRect)frame title:(NSString *)title
{
    self = [super initWithFrame:frame];
    if (self) {

    UILabel * titleLabel = [[UILabel alloc] init];
    CGSize size = frame.size;
    CGFloat titleLabelW = 120;
    CGFloat titleLabelH = 40;
    titleLabel.frame = CGRectMake(20, (size.height - titleLabelH)/2, titleLabelW, titleLabelH);
    titleLabel.text = title;
    titleLabel.font = [UIFont systemFontOfSize:20];
    titleLabel.textColor = [UIColor blackColor];
    [self addSubview:titleLabel];
    
    CGFloat textFieldW = 300;
    CGFloat textFieldH = 40;
    UITextField * textField = [[UITextField alloc] init];
        self.textField = textField;
    textField.frame = CGRectMake(CGRectGetMaxX(titleLabel.frame) + 5,(size.height - textFieldH)/2 , textFieldW, textFieldH);
        textField.backgroundColor = [UIColor contentLightColor];
    self.textField = textField;
    [self addSubview:textField];
        
    }
    return self;
}

@end
