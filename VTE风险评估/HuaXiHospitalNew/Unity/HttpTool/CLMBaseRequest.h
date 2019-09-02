//
//  CLMBaseRequest.h
//  HealthChat
//
//  Created by admin on 2018/11/23.
//  Copyright © 2018年 maomao. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "CLMHttpTool.h"
#define NetDisable @"连接服务器失败"
NS_ASSUME_NONNULL_BEGIN

@interface CLMBaseRequest : NSObject
@property(nonatomic,strong) NSMutableDictionary * paramsDic;//请求参数

/**
 请求的参数设置(进行paramsDic的初始化，并设置公用参数)
 */
-(void)paramBuild;

/**
 *  给paramsDic添加参数
 *
 *  @param anObject 参数的value
 *  @param aKey     参数的key
 */
-(void)setParam:(id)anObject forKey:(NSString*)aKey;

/**
 *  网络请求
 *
 *  @param successRef 成功的block
 *  @param errorRef   失败或返回错误码的block
 */
-(void)loadDataSuccess:(void(^)(id responseObject))successRef failure:(void(^)(id error))errorRef;


-(void)loadDataCache:(void(^)(id cacheObject))cache success:(void(^)(id responseObject))successRef failure:(void(^)(id error))errorRef;
@end

NS_ASSUME_NONNULL_END
