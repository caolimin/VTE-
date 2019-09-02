//
//  PatientSearchRequest.h
//  HuaXiHospitalNew
//
//  Created by admin on 2019/3/13.
//  Copyright © 2019年 caolimin. All rights reserved.
//

#import "CLMBaseRequest.h"

NS_ASSUME_NONNULL_BEGIN

@interface PatientSearchRequest : CLMBaseRequest
@property(nonatomic,strong) NSString * Type;
@property(nonatomic,strong) NSString * PATIENT_ID;
@property(nonatomic,strong) NSString * PATIENT_NAME;
@property(nonatomic,strong) NSString * ASSESS_FLAG;
@property(nonatomic,strong) NSString * SEARCH;
@property(nonatomic,strong) NSString * STPATIENT_AGE;
@property(nonatomic,strong) NSString * ETPATIENT_AGE;
@property(nonatomic,strong) NSString * IN_OFFICE;
@property(nonatomic,strong) NSString * PATIENT_SEX;
@property(nonatomic,strong) NSString * DOCTOR_NAME;
@property(nonatomic,strong) NSString * NURSE_NAME;

@end

NS_ASSUME_NONNULL_END
