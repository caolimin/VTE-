//
//  NewPatientCellTableViewCell.h
//  HuaXiHospitalNew
//
//  Created by admin on 2019/3/16.
//  Copyright © 2019年 caolimin. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "PatientModel.h"

NS_ASSUME_NONNULL_BEGIN

@interface NewPatientCellTableViewCell : UITableViewCell
@property(nonatomic,strong) NSMutableArray * labelArr;
@property(nonatomic,strong) PatientModel * model;
@end

NS_ASSUME_NONNULL_END
