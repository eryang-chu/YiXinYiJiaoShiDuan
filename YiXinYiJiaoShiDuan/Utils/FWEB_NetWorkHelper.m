//
//  FWEB_NetWorkHelper.m
//  fuwuEbao
//
//  Created by Jiao on 2018/8/8.
//  Copyright © 2018年 bornsoft. All rights reserved.
//

#import <AFNetworking/AFNetworking.h>
#import "FWEB_NetWorkHelper.h"

@interface FWEB_NetWorkHelper ()
@property (nonatomic, strong) AFHTTPSessionManager *session;
@end

@implementation FWEB_NetWorkHelper
- (AFHTTPSessionManager *)session {
    if (!_session) {
        AFHTTPSessionManager *session = [AFHTTPSessionManager manager];
        
        AFSecurityPolicy *securityPolicy = [AFSecurityPolicy policyWithPinningMode:AFSSLPinningModeNone withPinnedCertificates:[NSSet new]];
        securityPolicy.allowInvalidCertificates = YES;
        securityPolicy.validatesDomainName = NO;
        session.securityPolicy = securityPolicy;
        session.responseSerializer.acceptableContentTypes=[NSSet setWithObjects:@"application/json", @"text/json", @"text/javascript",@"text/html",@"text/css",@"text/plain", @"application/javascript",@"application/json", @"application/x-www-form-urlencoded", nil];
        _session = session;
    }
    return _session;
}

#pragma mark - 网络是否可用
//+ (void)setNetworkEnable:(BOOL)enable {
//    [USER_DEFAULTS setBool:enable forKey:KNetworkEnable];
//}

// single object mothed
+ (instancetype)networkHelper {
    static FWEB_NetWorkHelper *networkHelper = nil;
    static dispatch_once_t predicate;
    dispatch_once(&predicate, ^{
        networkHelper = [[FWEB_NetWorkHelper alloc] init];
    });
    return networkHelper;
}

#pragma mark - 检查网络
+ (void)checkNetworkAvailable:(void (^)(BOOL))available {
    [[AFNetworkReachabilityManager sharedManager] startMonitoring];
    [[AFNetworkReachabilityManager sharedManager ] setReachabilityStatusChangeBlock:^(AFNetworkReachabilityStatus status) {
        
        if(status ==AFNetworkReachabilityStatusReachableViaWWAN || status == AFNetworkReachabilityStatusReachableViaWiFi) {
            //有网
//            [FWEB_NetWorkHelper setNetworkEnable:YES];
            available (YES);
        }else {
            //没有网
//            [FWEB_NetWorkHelper setNetworkEnable:NO];
            available (NO);
        }
    }];
}

- (NSURLSessionDataTask *)callApi:(NSString *)api
                             body:(NSData *)bodyData
                           option:(NetworkHelperOption)option
                          headers:(NSDictionary *)headers
                       parameters:(NSDictionary *)parameters
                          success:(void (^)(id responseObject))success
                          failure:(void (^)(NSError *error))failure {
    
    NSString *optionStr = nil;
    switch (option) {
        case NetworkHelperOptionGET:
            optionStr = @"GET";
            break;
        case NetworkHelperOptionPUT:
            optionStr = @"PUT";
            break;
        case NetworkHelperOptionPOST:
            optionStr = @"POST";
            break;
        case NetworkHelperOptionDELETE:
            optionStr = @"DELETE";
            break;
        default:
            break;
    }
    NSURL *url = [NSURL URLWithString:api];
//    NSURL *url = [api toUrl];
    NSMutableURLRequest *mRequest = [NSMutableURLRequest requestWithURL:url];
    
    [mRequest setHTTPMethod:optionStr];
    if(bodyData) {
        [mRequest setHTTPBody:bodyData];
    }
    
//    IJXF_User *user = [IJXF_UserApi userInfo];
    
    //设置token
//    [mRequest setValue:user.token?user.token:@"" forHTTPHeaderField:@"accessToken"];
    
    [mRequest setValue:@"application/json" forHTTPHeaderField:@"Content-Type"];
    NSURLSessionDataTask *dataTask = [self.session dataTaskWithRequest:mRequest completionHandler:^(NSURLResponse *response, id responseObject, NSError *error) {
        if (error) {
            failure(error);
        } else {
            success(responseObject);
        }
    }];
    [dataTask resume];
    return dataTask;
}

//- (BOOL)usePayAddressWithApi:(NSString *)api {
//    if ([api isEqualToString:IJXF_API_ALIPAY_SING_DEPOSIT]
//        || [api isEqualToString:IJXF_API_ALIPAY_SING_RETAINGE]
//        || [api isEqualToString:IJXF_API_ALIPAY_SING_RECHARGE]
//        || [api isEqualToString:IJXF_API_ALIPAY_SING_REPAYMENT]
//        || [api isEqualToString:IJXF_API_WECHART_REPAYMENT]
//        || [api isEqualToString:IJXF_API_WECHART_RECHARGE]
//        || [api isEqualToString:IJXF_API_WECHART_DEPOSIT]
//        || [api isEqualToString:IJXF_API_WECHART_RETAINGE]
//        ) {
//        return YES;
//    }
//    return NO;
//
//}

- (NSURLSessionDataTask *)callApi:(NSString *)api option:(NetworkHelperOption)option type:(NetworkHelperRequestType)requestType headers:(NSDictionary<NSString *,id> *)headers body:(NSData *)bodyData parameters:(NSDictionary *)parameters success:(void (^)(id))success failure:(void (^)(NSError *))failure {
    NSString *service = nil;
//    if ([self usePayAddressWithApi:api])
//        service = [ALIPAY_SIGN_ADDR stringByAppendingString:api];
//    else
//        service = [SERVICE_ADDR stringByAppendingString:api];
    service = [BaseURL stringByAppendingString:api];
    NSURLSessionDataTask *task;
    if (bodyData) {
        task = [self callApi:service body:bodyData option:option headers:headers parameters:parameters success:^(id responseObject) {
            success (responseObject);
        } failure:^(NSError *error) {
            failure(error);
        }];
        return task;
    }
    
    switch (requestType) {
        case NetworkHelperRequestTypeJSON:
            self.session.requestSerializer = [AFJSONRequestSerializer new];
            self.session.requestSerializer = [AFJSONRequestSerializer serializer];
            break;
        case NetworkHelperRequestTypeNormal:
            self.session.requestSerializer = [AFHTTPRequestSerializer new];
            self.session.requestSerializer = [AFHTTPRequestSerializer serializer];
            break;
        default:
            break;
    }
    
    //设置token
//    IJXF_User *user = [IJXF_UserApi userInfo];
//    NSLog(@"accessToken == %@", user.token);
//    [self.session.requestSerializer setValue:user.token?user.token:@"" forHTTPHeaderField:@"accessToken"];
    
    for (NSString *key in headers.allKeys) {
        [self.session.requestSerializer setValue:key forHTTPHeaderField:[headers null_objectForKey:key]];
    }
    NSLog(@"----%@\n%@----", service, parameters);
    switch (option) {
        case NetworkHelperOptionGET: {
            task = [self GETApi:service Parameters:parameters Success:^(id responseObject) {
                //                CFShow((__bridge CFTypeRef)(responseObject));
                NSLog(@"返回的数据---= %@ ",(__bridge CFTypeRef)(responseObject));
                success(responseObject);
            } Failure:^(NSError *error) {
                NSLog(@"错误---= %@ ",(__bridge CFTypeRef)(error));
                failure(error);
            }];
        }
            break;
        case NetworkHelperOptionPOST: {
            task = [self POSTApi:service Parameters:parameters Success:^(id responseObject) {
                NSLog(@"返回的数据---= %@ ",(__bridge CFTypeRef)(responseObject));
                success(responseObject);
            } Failure:^(NSError *error) {
                NSLog(@"错误---= %@ ",(__bridge CFTypeRef)(error));
                failure(error);
            }];
        }
            break;
        case NetworkHelperOptionPUT: {
            task = [self PUTApi:service Parameters:parameters Success:^(id responseObject) {
                NSLog(@"返回的数据---= %@ ",(__bridge CFTypeRef)(responseObject));
                success(responseObject);
            } Failure:^(NSError *error) {
                NSLog(@"错误---= %@ ",(__bridge CFTypeRef)(error));
                failure(error);
            }];
            
        }
            break;
        case NetworkHelperOptionDELETE: {
            task = [self DELETEApi:service Parameters:parameters Success:^(id responseObject) {
                NSLog(@"返回的数据---= %@ ",(__bridge CFTypeRef)(responseObject));
                success(responseObject);
            } Failure:^(NSError *error) {
                NSLog(@"错误---= %@ ",(__bridge CFTypeRef)(error));
                failure(error);
            }];
        }
            break;
        default:
            break;
    }
    
    return task;
}

- (NSURLSessionDataTask *)DELETEApi:(NSString *)api
                         Parameters:(NSDictionary *)parameters
                            Success:(void(^)(id responseObject ))success
                            Failure:(void (^)(NSError * error))failure {
    NSURLSessionDataTask *task = [self.session DELETE:api parameters:parameters success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        success(responseObject);
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        failure(error);
    }];
    
    return task;
}

- (NSURLSessionDataTask *)PUTApi:(NSString *)api
                      Parameters:(NSDictionary *)parameters
                         Success:(void(^)(id responseObject ))success
                         Failure:(void (^)(NSError * error))failure{
    NSURLSessionDataTask *task = [self.session PUT:api parameters:parameters success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        success(responseObject);
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        failure(error);
    }];
    return task;
}

- (NSURLSessionDataTask *)GETApi:(NSString *)api
                      Parameters:(NSDictionary *)parameters
                         Success:(void(^)(id responseObject ))success
                         Failure:(void (^)(NSError * error))failure {
    
    NSURLSessionDataTask *task = [self.session GET:api
                                        parameters:parameters
                                          progress:nil
                                           success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
                                               success (responseObject);
                                           }
                                           failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
                                               failure (error);
                                           }];
    return task;
}

- (NSURLSessionDataTask *)POSTApi:(NSString *)api
                       Parameters:(NSDictionary *)parameters
                          Success:(void(^)(id responseObject))success
                          Failure:(void (^)(NSError * error))failure {
    NSURLSessionDataTask *task = [self.session POST:api
                                         parameters:parameters
                                           progress:nil
                                            success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
                                                success (responseObject);
                                            }
                                            failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
                                                failure(error);
                                            }];
    return task;
}
@end
