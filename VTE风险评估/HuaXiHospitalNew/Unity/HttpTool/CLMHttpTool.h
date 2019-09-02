//
//  CLMHttpTool.h
//  HealthChat
//
//  Created by admin on 2018/11/8.
//  Copyright © 2018年 maomao. All rights reserved.
//

#import <Foundation/Foundation.h>
@interface CLMHttpTool : NSObject
/**
 get请求
 
 @param url 请求路径
 @param params 请求参数
 @param success 请求成功回调
 @param failure 请求失败回调
 */
+(void)getWithURL:(NSString *)url  params:(NSDictionary *)params success:(void (^)(id json))success
          failure:(void (^)(NSError *error))failure;

/**
 post请求

 @param url 请求路径
 @param params 请求参数
 @param success 请求成功回调
 @param failure 请求失败回调
 */
+(void)postWithURL:(NSString *)url  params:(NSDictionary *)params success:(void (^)(id json))success
           failure:(void (^)(NSError *error))failure;

/**
 post请求上传

 @param url 请求路径
 @param params 请求参数
 @param formDatas 文件参数
 @param success 请求成功回调
 @param failure 请求失败回调
 */
+(void)postWithURL:(NSString *)url  params:(NSDictionary *)params formData:(NSArray *)formDatas success:(void (^)(id json))success failure:(void (^)(NSError *error))failure;
@end

@interface CLMFormData : NSObject
@property(nonatomic,strong) NSData * data;
@property(nonatomic,copy)  NSString * name;
@property(nonatomic,copy)  NSString * fileName;
@property(nonatomic,copy)  NSString * mimeType;
@end
