//
//  AskViewController.h
//  HuaXiHospitalNew
//
//  Created by admin on 2019/3/12.
//  Copyright © 2019年 caolimin. All rights reserved.
//

#import "SubViewController.h"
#import "PatientModel.h"
NS_ASSUME_NONNULL_BEGIN

@interface AskViewController : SubViewController
@property(nonatomic,strong) NSString * scoreString;
@property(nonatomic,strong) NSString * factorStr;
@property(nonatomic,strong) PatientModel * model;
@property(nonatomic,strong) NSArray * selectArray;
@end

NS_ASSUME_NONNULL_END
