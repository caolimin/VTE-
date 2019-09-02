//
//  PatientCellTableViewCell.m
//  HuaXiHospitalNew
//
//  Created by admin on 2019/3/11.
//  Copyright © 2019年 caolimin. All rights reserved.
//

#import "PatientCellTableViewCell.h"

@implementation PatientCellTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
//    UIView * lineView = [[UIView alloc] init];
//    lineView.backgroundColor = [UIColor lightGrayColor];
//    lineView.frame = CGRectMake(0, self.frame.size.height -0.5, WIDTH, 0.5);
//    [self addSubview:lineView];
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

-(void)setModel:(PatientModel *)model
{
    _model = model;
    self.nameLabel.text = [NSString stringWithFormat:@"姓名：%@",UnNil(model.PATIENT_NAME)];
    self.ageLabel.text = [NSString stringWithFormat:@"年龄：%@岁",UnNil(model.PATIENT_AGE)];
    self.sexLabel.text = [NSString stringWithFormat:@"性别：%@",UnNil(model.PATIENT_SEX)] ;
    self.officeLabel.text =[NSString stringWithFormat:@"科室：%@",UnNil(model.IN_OFFICE)] ;
    self.doctorLabel.text = [NSString stringWithFormat:@"主管医生：%@",UnNil(model.DOCTOR_NAME)] ;
    self.NurseLabel.text = [NSString stringWithFormat:@"主管护师：%@",UnNil(model.NURSE_NAME)] ;
    self.patient_idLabel.text =[NSString stringWithFormat:@"病历号：%@",UnNil(model.PATIENT_ID)] ;
    if ([model.ASSESS_FLAG integerValue]) {
        self.assess_flagLabel.text = @"评估状态：已评估";
    }else
    {
        self.assess_flagLabel.text = @"评估状态：未评估";
    }
}
@end
