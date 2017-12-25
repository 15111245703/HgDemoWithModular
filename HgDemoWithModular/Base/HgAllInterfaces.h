//
//  HgAllInterfaces.h
//  HGBasicFramework
//
//  Created by RicardoM Lu on 2017/8/18.
//  Copyright © 2017年 RicardoM Lu. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "BADataEntity.h"
/**定义请求成功的block*/
typedef void(^requestSuccess)( NSDictionary * object);

/**定义请求失败的block*/
typedef void(^requestFailure)( NSError *error);

/**定义上传进度block*/
typedef void(^uploadProgress)(float progress);

@interface HgAllInterfaces : NSObject
+(void)post:(BADataEntity *)baDataEntity success:(void (^)(id))success failure:(void (^)(NSError *))failure progresss:(void (^)(float))progresss;
+ (void)get:(BADataEntity *)baDataEntity success:(void (^)(id json))success failure:(void (^)(NSError *error))failure progresss:(void (^)(float progress))progresss;
@end

