//
//  PatientModel.h
//  HuaXiHospitalNew
//
//  Created by admin on 2019/3/13.
//  Copyright © 2019年 caolimin. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface PatientModel : NSObject
@property(nonatomic,strong) NSString * PATIENT_ID;
@property(nonatomic,strong) NSString * PATIENT_NAME;
@property(nonatomic,strong) NSString * PATIENT_SEX;
@property(nonatomic,strong) NSString * PATIENT_AGE;
@property(nonatomic,strong) NSString * IN_OFFICE;
@property(nonatomic,strong) NSString * NURSE_NAME;
@property(nonatomic,strong) NSString * DOCTOR_NAME;
@property(nonatomic,strong) NSNumber* ASSESS_FLAG;
@property(nonatomic,strong) NSString * FACTOR;
@property(nonatomic,strong) NSString * ASSESS_SCORE;
@property(nonatomic,strong) NSString * RISK_LEVEL;
@property(nonatomic,strong) NSString * PATIENT_ADVICE;
@property(nonatomic,strong) NSString * DOCTOR_ADVICE;
@property(nonatomic,strong) NSString * NURSE_ADVICE;
@property(nonatomic,strong) NSString * IN_TIME;
@property(nonatomic,strong) NSString * DISEASE;
@end

NS_ASSUME_NONNULL_END
