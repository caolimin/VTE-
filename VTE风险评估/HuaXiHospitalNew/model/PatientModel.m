//
//  PatientModel.m
//  HuaXiHospitalNew
//
//  Created by admin on 2019/3/13.
//  Copyright © 2019年 caolimin. All rights reserved.
//

#import "PatientModel.h"

@implementation PatientModel
-(void)setNURSE_NAME:(NSString *)NURSE_NAME
{
    if ([NURSE_NAME isEqualToString:@"王静"]) {
        _NURSE_NAME = @"王文静";
    }else
    {
        _NURSE_NAME = NURSE_NAME;
    }
}
@end
