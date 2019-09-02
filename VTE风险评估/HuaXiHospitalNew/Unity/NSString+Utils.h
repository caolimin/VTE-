//
//  NSString+Utils.h
//  HealthChat
//
//  Created by 苗宁 on 12-3-13.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "sys/xattr.h"

#define UnNil(str) str == nil?@"":str

#define Trim(str) (str == nil || (id)str == [NSNull null])?@"":[str stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]]

#define MCSTR(...) [NSString stringWithFormat:__VA_ARGS__]

#define MCSTRD(data) [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding]

#define SYSTEM_VERSION_LESS_THAN(except_version) [[[UIDevice currentDevice] systemVersion] compare:[NSString stringWithFormat:@"%.1f",except_version] options:NSNumericSearch] == NSOrderedAscending
#define RegisterServer [[UIDevice currentDevice] isAixinhui] ?@"RegistServlet300AXH":@"HZRegistServlet"
#define ValidMark @"60"
#define Client_Type @"60"
#define ConsultationCenterId @"6"
#define CheckSelfPerfet @"CheckSelfPerfet" 
#define Consultation_Center_Id @"6"

@interface NSString (Utils)

@property (nonatomic, readonly) BOOL isValidate;
@property (nonatomic, readonly) BOOL isPhoneNumber;
@property (nonatomic, readonly) BOOL isIntegerNumber;
@property (nonatomic, readonly) BOOL isEmail;
@property (nonatomic, readonly) BOOL isTelephone;
@property (nonatomic, readonly) BOOL isContainsChinese;
@property (nonatomic, readonly) BOOL isPostcode;
//@property (nonatomic, readonly) BOOL isWebSite;
@property (nonatomic, readonly) NSString *toMD5;
@property (nonatomic, readonly) BOOL isMD5;
@property (nonatomic, readonly) NSString *libraryCachePath;
@property (nonatomic, readonly) NSString *bundlePath;
@property (nonatomic, readonly) NSString *temporaryPath;
@property (nonatomic, readonly) NSString *documentPath;
@property (nonatomic, readonly) BOOL isServerPath;
@property (nonatomic, readonly) NSInteger count;
@property (nonatomic, readonly) NSString *adaptationServer;
@property (nonatomic, readonly) NSString *adaptationCall;
@property (nonatomic, readonly) NSString *adaptationFriendCall;


+ (NSString *)uuid;

- (NSString *)adaptationNameWithKey:(NSString *)key;
- (NSString *)adaptationCAllWithDomeyNumber;
- (NSString *)adaptationCallWithProjectName;

- (BOOL)validateWithReg:(NSString *)regular;

+ (NSString *)deflatedString:(NSString *)path;

- (CGSize)sizeWithFont:(UIFont *)font constrainedToSize:(CGSize)size lineBreakMode:(NSLineBreakMode)lineBreakMode textAligment:(NSTextAlignment)aligment;
@end


@interface NSMutableString (Extensions)
- (NSMutableString *)deleteLastCharacter;
@end
