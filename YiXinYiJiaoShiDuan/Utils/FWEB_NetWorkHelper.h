//
//  FWEB_NetWorkHelper.h
//  fuwuEbao
//
//  Created by Jiao on 2018/8/8.
//  Copyright © 2018年 bornsoft. All rights reserved.
//

#import <Foundation/Foundation.h>

/**
 请求参数的类型
 
 - NetworkHelperRequestTypeNormal: 普通的https参数传递
 - NetworkHelperRequestTypeJSON: JSON方式的参数传递
 */
typedef NS_ENUM(NSUInteger, NetworkHelperRequestType) {
    NetworkHelperRequestTypeNormal,
    NetworkHelperRequestTypeJSON,
};

/**
 操作方式
 
 - NetworkHelperOptionGET: GET
 - NetworkHelperOptionPOST: POST
 - NetworkHelperOptionPUT: PUT
 - NetworkHelperOptionDELETE: DELETE
 
 */
typedef NS_ENUM(NSUInteger, NetworkHelperOption) {
    NetworkHelperOptionGET,
    NetworkHelperOptionPOST,
    NetworkHelperOptionPUT,
    NetworkHelperOptionDELETE,
};

@interface FWEB_NetWorkHelper : NSObject
/**
 初始化方法
 
 @return 单例实例对象
 */
+ (instancetype)networkHelper;


/**
 检查网络是否可用
 
 @param available 回调block YES --> 可用， NO --> 不可用
 */
+ (void)checkNetworkAvailable:(void(^)(BOOL isAvailable))available;

/**
 统一数据请求入口
 
 @param api api
 @param option 请求方式
 @param requestType 请求参数方式
 @param headers 额外的请求头 ， token 已带
 @param bodyData 采用body方式
 @param parameters 参数dict
 @return 任务主要用于取消操作
 */
- (NSURLSessionDataTask *)callApi:(NSString *)api
                           option:(NetworkHelperOption)option
                             type:(NetworkHelperRequestType)requestType
                          headers:(NSDictionary<NSString *, id> *)headers
                             body:(NSData *)bodyData
                       parameters:(NSDictionary *)parameters
                          success:(void (^)(id responseObject))success
                          failure:(void (^)(NSError *error))failure;
@end
