//
//  NewAskViewController.h
//  HuaXiHospitalNew
//
//  Created by admin on 2019/3/17.
//  Copyright © 2019年 caolimin. All rights reserved.
//

#import "SubViewController.h"
#import "PatientModel.h"

NS_ASSUME_NONNULL_BEGIN

@interface NewAskViewController : SubViewController
@property(nonatomic,strong) NSString * scoreString;
@property(nonatomic,strong) NSArray * selectArray;
@property(nonatomic,strong) PatientModel * model;
@end

NS_ASSUME_NONNULL_END
