//
//  CLMHttpTool.m
//  HealthChat
//
//  Created by admin on 2018/11/8.
//  Copyright © 2018年 maomao. All rights reserved.
//

#import "CLMHttpTool.h"
#import "AFNetworking.h"
@implementation CLMFormData

@end

@implementation CLMHttpTool

+(void)getWithURL:(NSString *)url  params:(NSDictionary *)params success:(void (^)(id json))success
           failure:(void (^)(NSError *error))failure
{
    AFHTTPSessionManager * manger = [AFHTTPSessionManager manager];
    [manger GET:url parameters:params progress:^(NSProgress * _Nonnull downloadProgress) {
        
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        if (success) {
            success(responseObject);
        }
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        if (failure) {
            failure(error);
        }
    }];
}

+(void)postWithURL:(NSString *)url  params:(NSDictionary *)params success:(void (^)(id json))success
           failure:(void (^)(NSError *error))failure
{

    AFHTTPSessionManager * manger = [AFHTTPSessionManager manager];
//    manger.responseSerializer=[AFHTTPResponseSerializer serializer];
//    manger.responseSerializer.acceptableContentTypes = [NSSet setWithObjects:@"application/json",@"multipart/form-data",
//                                                         @"text/html",
//                                                         @"image/jpeg",
//                                                         @"image/png",
//                                                         @"image/jpg",
//                                                         @"application/octet-stream",
//                                                         @"text/json",
//                                                         @"text/javascript",
//                                                         nil];
    [manger POST:url parameters:params progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        if (success) {
            success(responseObject);
        }
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        if (failure) {
            failure(error);
        }
    }];
}

+(void)postWithURL:(NSString *)url  params:(NSDictionary *)params formData:(NSArray *)formDatas success:(void (^)(id json))success failure:(void (^)(NSError *error))failure
{
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    manager.responseSerializer=[AFHTTPResponseSerializer serializer];
    manager.responseSerializer.acceptableContentTypes = [NSSet setWithObjects:@"application/json",@"multipart/form-data",
                                                         @"text/html",
                                                         @"image/jpeg",
                                                         @"image/png",
                                                         @"image/jpg",
                                                         @"application/octet-stream",
                                                         @"text/json",
                                                         @"text/javascript",
                                                         nil];
    [manager.requestSerializer setValue:@"multipart/form-data" forHTTPHeaderField:@"Content-Type"];
    [manager POST:url parameters:params constructingBodyWithBlock:^(id<AFMultipartFormData>  _Nonnull totalFormData) {
        for (CLMFormData * formData in formDatas) {
            [totalFormData appendPartWithFileData:formData.data name:formData.name fileName:formData.fileName mimeType:formData.mimeType];
        }
    } progress:^(NSProgress * _Nonnull uploadProgress) {
        NSLog(@"%f",1.0 * uploadProgress.completedUnitCount/uploadProgress.totalUnitCount);
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        if (success) {
            success(responseObject);
        }
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        if (failure) {
            failure(error);
        }
    }];
    
}

@end
