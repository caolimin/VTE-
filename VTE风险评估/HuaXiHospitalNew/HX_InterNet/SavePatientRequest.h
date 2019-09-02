//
//  SavePatientRequest.h
//  HuaXiHospitalNew
//
//  Created by admin on 2019/3/13.
//  Copyright © 2019年 caolimin. All rights reserved.
//

#import "CLMBaseRequest.h"

NS_ASSUME_NONNULL_BEGIN

@interface SavePatientRequest : CLMBaseRequest
@property(nonatomic,strong) NSString * Type;
@property(nonatomic,strong) NSString * ASSESS_SCORE;
@property(nonatomic,strong) NSArray * FACTOR;
@property(nonatomic,strong) NSString * PATIENT_ID;

@end

NS_ASSUME_NONNULL_END
