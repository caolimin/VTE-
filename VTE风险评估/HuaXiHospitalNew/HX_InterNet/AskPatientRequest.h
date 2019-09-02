//
//  AskPatientRequest.h
//  HuaXiHospitalNew
//
//  Created by admin on 2019/3/13.
//  Copyright © 2019年 caolimin. All rights reserved.
//

#import "CLMBaseRequest.h"

NS_ASSUME_NONNULL_BEGIN

@interface AskPatientRequest : CLMBaseRequest
@property(nonatomic,strong) NSString * PATIENT_ID;
@property(nonatomic,strong) NSString * Type;
@end

NS_ASSUME_NONNULL_END
