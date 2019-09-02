//
//  AskPatientRequest.m
//  HuaXiHospitalNew
//
//  Created by admin on 2019/3/13.
//  Copyright © 2019年 caolimin. All rights reserved.
//

#import "AskPatientRequest.h"
#import "PatientModel.h"

@implementation AskPatientRequest

-(void)paramBuild
{
    //http://sr.second-vision.net/XiaoYiRobotSer/fileUpload?MERCHANT_ID=1000&SITE_ID=1000&PHYSICLAL_STATUS_CODE=1&PHYSICLAL_STATUS=血糖偏高&ARCHIVES_NAME=给哥哥&file=FileWrapper{file=/mnt/sdcard/headuser_head_icon.jpg, fileName='headuser_head_icon.jpg, contentType=image/jpeg, fileSize=67838}
    [super paramBuild];
}
-(void)loadDataSuccess:(void (^)(id _Nonnull))successRef failure:(void (^)(id _Nonnull))errorRef
{
    [self paramBuild];
    NSString * urlString = [NSString stringWithFormat:@"%@RobotSer?Type=%@&PATIENT_ID=%@",LoacalBaseUrl,self.Type,self.PATIENT_ID];
    [CLMHttpTool postWithURL:urlString params:nil success:^(id json) {
        NSArray * arr = [[NSArray alloc] init];
        arr = [PatientModel mj_objectArrayWithKeyValuesArray:json[@"server_params"]];
        if (successRef) {
            successRef(arr);
        }
    } failure:^(NSError *error) {
        if (errorRef) {
            errorRef(NetDisable);
        }
    }];
}
@end
