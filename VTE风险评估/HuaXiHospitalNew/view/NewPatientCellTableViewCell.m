//
//  NewPatientCellTableViewCell.m
//  HuaXiHospitalNew
//
//  Created by admin on 2019/3/16.
//  Copyright © 2019年 caolimin. All rights reserved.
//

#import "NewPatientCellTableViewCell.h"

@implementation NewPatientCellTableViewCell
-(NSMutableArray *)labelArr
{
    if (!_labelArr) {
        _labelArr = [[NSMutableArray alloc] init];
    }
    return _labelArr;
}
-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        //CGFloat labelW = 30;
        CGFloat labelH = 40;
       // CGFloat marginX = (WIDTH - 8*labelW)/9;
        CGFloat marginX = 10;
        CGFloat labelW  = (WIDTH - marginX * 9)/8;
        labelW = floor(labelW);
        CGFloat marginY = (self.frame.size.height -labelH)/2;
        [self.labelArr removeAllObjects];
        for (int i = 0; i<8; i++) {
            UILabel * label = [[UILabel alloc] init];
            label.backgroundColor  = [UIColor contentLightColor];
            label.textAlignment = NSTextAlignmentCenter;
            label.frame = CGRectMake(marginX + (labelW + marginX) * i, marginY, labelW, labelH);
            [self addSubview:label];
            [self.labelArr addObject:label];
        }
        
    }
    return self;
}

-(void)setModel:(PatientModel *)model
{
    _model = model;
    NSMutableArray * arr = [[NSMutableArray alloc] init];
    [arr addObject:model.PATIENT_NAME];
    [arr addObject:model.PATIENT_SEX];
    [arr addObject:model.PATIENT_AGE];
    [arr addObject:model.IN_OFFICE];
    [arr addObject:model.DOCTOR_NAME];
    [arr addObject:model.NURSE_NAME];
    [arr addObject:model.PATIENT_ID];
    if ([model.ASSESS_FLAG integerValue]) {
        [arr addObject:@"已评估"];
    }else
    {
        [arr addObject:@"未评估"];
    }
    for (int i=0; i<self.labelArr.count; i++) {
        UILabel * label = self.labelArr[i];
        label.text = arr[i];
    }
}

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
