//
//  PatientCellTableViewCell.h
//  HuaXiHospitalNew
//
//  Created by admin on 2019/3/11.
//  Copyright © 2019年 caolimin. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "PatientModel.h"

NS_ASSUME_NONNULL_BEGIN

@interface PatientCellTableViewCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UILabel *stateLabel;
@property(nonatomic,strong) PatientModel * model;
@property (weak, nonatomic) IBOutlet UILabel *nameLabel;
@property (weak, nonatomic) IBOutlet UILabel *ageLabel;
@property (weak, nonatomic) IBOutlet UILabel *sexLabel;
@property (weak, nonatomic) IBOutlet UILabel *officeLabel;
@property (weak, nonatomic) IBOutlet UILabel *doctorLabel;
@property (weak, nonatomic) IBOutlet UILabel *NurseLabel;
@property (weak, nonatomic) IBOutlet UILabel *patient_idLabel;
@property (weak, nonatomic) IBOutlet UILabel *assess_flagLabel;

@end

NS_ASSUME_NONNULL_END
