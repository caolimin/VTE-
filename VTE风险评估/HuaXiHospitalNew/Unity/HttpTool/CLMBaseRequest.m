//
//  CLMBaseRequest.m
//  HealthChat
//
//  Created by admin on 2018/11/23.
//  Copyright © 2018年 maomao. All rights reserved.
//

#import "CLMBaseRequest.h"

@implementation CLMBaseRequest

/**
 *  请求的参数设置
 *
 */
-(void)paramBuild
{
    if (!self.paramsDic) {
        self.paramsDic = [NSMutableDictionary dictionary];
    }
    
}

-(NSMutableDictionary *)paramsDic
{
    if (!_paramsDic) {
        _paramsDic = [NSMutableDictionary dictionary];
        
    }
    return _paramsDic;
}

/**
 *  单个参数为空时加入字典会导致崩溃，所以加以处理
 *
 *  @param param 单个参数
 *
 *  @return 这个参数的非空值
 */
-(id)paramEmptyHandle:(id)param
{
    
    if (param == nil || param == [NSNull null]) return @"";
    if ([param isKindOfClass:[NSString class]]) return param;
    if ([param isKindOfClass:[NSNumber class]]) return [param stringValue];
    return param;
    
}


/**
 *  给paramsDic添加参数
 *
 *  @param anObject 参数的value
 *  @param aKey     参数的key
 */
-(void)setParam:(id)anObject forKey:(NSString*)aKey
{
    [self.paramsDic setObject:[self paramEmptyHandle:anObject] forKey:aKey];
    
}

-(void)loadDataSuccess:(void(^)(id responseObject))successRef failure:(void(^)(id error))errorRef
{
    
}

-(void)loadDataCache:(void(^)(id cacheObject))cache success:(void(^)(id responseObject))successRef failure:(void(^)(id error))errorRef
{
    
}
@end
