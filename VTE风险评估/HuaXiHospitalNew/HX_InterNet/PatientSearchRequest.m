//
//  PatientSearchRequest.m
//  HuaXiHospitalNew
//
//  Created by admin on 2019/3/13.
//  Copyright © 2019年 caolimin. All rights reserved.
//

#import "PatientSearchRequest.h"
#import "PatientModel.h"
@implementation PatientSearchRequest

-(void)paramBuild
{
    //http://sr.second-vision.net/XiaoYiRobotSer/fileUpload?MERCHANT_ID=1000&SITE_ID=1000&PHYSICLAL_STATUS_CODE=1&PHYSICLAL_STATUS=血糖偏高&ARCHIVES_NAME=给哥哥&file=FileWrapper{file=/mnt/sdcard/headuser_head_icon.jpg, fileName='headuser_head_icon.jpg, contentType=image/jpeg, fileSize=67838}
    [super paramBuild];
}
-(void)loadDataSuccess:(void (^)(id _Nonnull))successRef failure:(void (^)(id _Nonnull))errorRef
{
    [self paramBuild];
    // //根据名称和病历号搜索患者（搜索全部就别传）
    NSString * urlString = [NSString stringWithFormat:@"%@RobotSer?Type=%@&PATIENT_ID=%@&PATIENT_NAME=%@&ASSESS_FLAG=%@&SEARCH=%@&STPATIENT_AGE=%@&ETPATIENT_AGE=%@&IN_OFFICE=%@&PATIENT_SEX=%@&DOCTOR_NAME=%@&NURSE_NAME=%@",LoacalBaseUrl,self.Type,self.PATIENT_ID,self.PATIENT_NAME,self.ASSESS_FLAG,self.SEARCH,self.STPATIENT_AGE,self.ETPATIENT_AGE,self.IN_OFFICE,self.PATIENT_SEX,self.DOCTOR_NAME,self.NURSE_NAME];
    urlString = [urlString stringByAddingPercentEncodingWithAllowedCharacters:[NSCharacterSet URLQueryAllowedCharacterSet]];//编码
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

- (NSDictionary *)dictionaryWithJsonString:(NSString *)jsonString
{
    if (jsonString == nil) {
        return nil;
    }
    
    NSData *jsonData = [jsonString dataUsingEncoding:NSUTF8StringEncoding];
    NSError *err;
    NSDictionary *dic = [NSJSONSerialization JSONObjectWithData:jsonData
                                                        options:NSJSONReadingMutableContainers
                                                          error:&err];
    if(err)
    {
        NSLog(@"json解析失败：%@",err);
        return nil;
    }
    return dic;
}
@end
