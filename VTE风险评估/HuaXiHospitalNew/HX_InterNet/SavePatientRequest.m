//
//  SavePatientRequest.m
//  HuaXiHospitalNew
//
//  Created by admin on 2019/3/13.
//  Copyright © 2019年 caolimin. All rights reserved.
//

#import "SavePatientRequest.h"

@implementation SavePatientRequest

-(void)paramBuild
{
    //http://sr.second-vision.net/XiaoYiRobotSer/fileUpload?MERCHANT_ID=1000&SITE_ID=1000&PHYSICLAL_STATUS_CODE=1&PHYSICLAL_STATUS=血糖偏高&ARCHIVES_NAME=给哥哥&file=FileWrapper{file=/mnt/sdcard/headuser_head_icon.jpg, fileName='headuser_head_icon.jpg, contentType=image/jpeg, fileSize=67838}
    [super paramBuild];
}
-(void)loadDataSuccess:(void (^)(id _Nonnull))successRef failure:(void (^)(id _Nonnull))errorRef
{
    [self paramBuild];
    // //根据名称和病历号搜索患者（搜索全部就别传）
//    保存风险选项
//http://localhost:9090/XiaoYiRobotSer/RobotSer?Type=savePingguBG&ASSESS_SCORE=(评分)&FACTOR=(危险因素，用json打包成数组，按照顺序传过来)&PATIENT_ID=
    NSError *error = nil;
    NSData *jsonData = [NSJSONSerialization dataWithJSONObject:self.FACTOR
                                                       options:kNilOptions
                                                         error:&error];
    
    NSString *jsonString = [[NSString alloc] initWithData:jsonData
                                                 encoding:NSUTF8StringEncoding];
    NSString * urlString = [NSString stringWithFormat:@"%@RobotSer?Type=%@&PATIENT_ID=%@&ASSESS_SCORE=%@&FACTOR=%@",LoacalBaseUrl,self.Type,self.PATIENT_ID,self.ASSESS_SCORE,jsonString];
    
   urlString = [urlString stringByAddingPercentEncodingWithAllowedCharacters:[NSCharacterSet URLQueryAllowedCharacterSet]];
    //编码
    [CLMHttpTool postWithURL:urlString params:nil success:^(id json) {
        if (successRef) {
            successRef(json);
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
