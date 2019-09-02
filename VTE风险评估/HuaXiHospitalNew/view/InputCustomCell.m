//
//  InputCustomCell.m
//  HuaXiHospitalNew
//
//  Created by admin on 2019/3/14.
//  Copyright © 2019年 caolimin. All rights reserved.
//

#import "InputCustomCell.h"

@implementation InputCustomCell

- (void)awakeFromNib {
    [super awakeFromNib];

}

-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    UILabel * titleLabel = [[UILabel alloc] init];
    CGFloat titleLabelX = 50;
    CGFloat titleLabelY = 100;
    CGFloat titleLabelW = 100;
    CGFloat titleLabelH = 40;
    CGFloat margin = 15;
    titleLabel.frame = CGRectMake(titleLabelX, titleLabelY, titleLabelW, titleLabelH);
    titleLabel.text = @"病历号:";
    titleLabel.font = [UIFont systemFontOfSize:20];
    titleLabel.textColor = [UIColor blackColor];
    [self.contentView addSubview:titleLabel];
    
    CGFloat textFieldW = 200;
    CGFloat textFieldH = 40;
    UITextField * textField = [[UITextField alloc] init];
   // textField.backgroundColor = [UIColor lightGrayColor];
   // textField.backgroundColor = [UIColor colorWithHEX:@"0xf2f2f2"];
    textField.delegate = self;
    textField.tag = 100;
    textField.borderStyle = UITextBorderStyleRoundedRect;
    textField.frame = CGRectMake(CGRectGetMaxX(titleLabel.frame) + margin, titleLabelY, textFieldW, textFieldH);
    [self.contentView addSubview:textField];
    
    UILabel * titleLabel1 = [[UILabel alloc] init];
    titleLabel1.frame = CGRectMake(WIDTH - titleLabelW - textFieldW - margin  -titleLabelX, titleLabelY, titleLabelW, titleLabelH);
    titleLabel1.text = @"患者姓名:";
    titleLabel1.font = [UIFont systemFontOfSize:20];
    titleLabel1.textColor = [UIColor blackColor];
    [self.contentView addSubview:titleLabel1];
    
    
    UITextField * textField1 = [[UITextField alloc] init];
    textField1.delegate = self;
    textField1.tag = 101;
    textField1.borderStyle = UITextBorderStyleRoundedRect;
    textField1.frame = CGRectMake(CGRectGetMaxX(titleLabel1.frame) + margin, titleLabelY, textFieldW, textFieldH);
    [self.contentView addSubview:textField1];
    
    
    UIButton * button = [UIButton buttonWithType:UIButtonTypeCustom];
    [button setTitle:@"搜索" forState:UIControlStateNormal];
    button.titleLabel.font = [UIFont systemFontOfSize:20];
    [button setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    CGFloat buttonW = 200;
    CGFloat buttonH = 50;
    button.frame = CGRectMake(([UIScreen mainScreen].bounds.size.width - buttonW)/2, 350 - buttonH - 20, buttonW, buttonH);
    [self.contentView addSubview:button];
    button.layer.cornerRadius = 7;
    button.layer.borderColor = [UIColor darkGrayColor].CGColor;
    button.layer.borderWidth = 1.0;
    [button addTarget:self action:@selector(btnClcik:) forControlEvents:UIControlEventTouchUpInside];
    
    //当前人数
    CGFloat textlabelW = 200;
    CGFloat textlabelH = 50;
    UILabel * textLabel = [[UILabel alloc] init];
    self.contentTitleLabel = textLabel;
    textLabel.textColor = [UIColor blackColor];
    textLabel.font = [UIFont systemFontOfSize:18];
    textLabel.frame = CGRectMake(CGRectGetMaxX(button.frame) + 20, CGRectGetMinY(button.frame), textlabelW, textlabelH);
    [self.contentView addSubview:textLabel];
    return self;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}
-(void)btnClcik:(UIButton *)btn
{
    self.searchBtnClick(self);
}

-(void)textFieldDidEndEditing:(UITextField *)textField
{
    if (textField.tag == 100) {
        NSString * str1 = textField.text;
        self.patient_idClick(str1);
    }else if (textField.tag == 101)
    {
        NSString * str2 = textField.text;
        self.Patient_nameClick(str2);
    }
}

@end
