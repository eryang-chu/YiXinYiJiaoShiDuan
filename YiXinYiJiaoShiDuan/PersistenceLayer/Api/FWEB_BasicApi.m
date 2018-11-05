//
//  FWEB_BasicApi.m
//  fuwuEbao
//
//  Created by Jiao on 2018/8/7.
//  Copyright © 2018年 bornsoft. All rights reserved.
//

#import "FWEB_BasicApi.h"

BOOL GetSuccessInResp(id responseObject) {
    return ![[responseObject null_objectForKey:@"code"] boolValue];
}

NSString * GetCodeInResp(id responseObject) {
    return [responseObject null_objectForKey:@"code"];
}

NSString * GetMsgInResp(id responseObject) {
    return [responseObject null_objectForKey:@"message"];
}

id GetDataInResp(id responseObject) {
    return [responseObject null_objectForKey:@"rows"];
}

NSError * errorWithMsg(NSString *errorMsg, NSString *errorDomain, NSUInteger errorCode) {
    NSDictionary *userInfo = @{NSLocalizedDescriptionKey:errorMsg};
    return [NSError errorWithDomain:errorDomain code:errorCode userInfo:userInfo];
}

NSError * errorWithResp(id responseObject, NSString *errorDomain, NSUInteger errorCode) {
    NSString *apiCode = GetCodeInResp(responseObject);
    NSString *msg = GetMsgInResp(responseObject);
    NSDictionary *userInfo = @{NSLocalizedDescriptionKey:msg?msg:@"", @"errorCode":apiCode?apiCode:@""};
    return [NSError errorWithDomain:errorDomain code:errorCode userInfo:userInfo];
}

@implementation FWEB_BasicApi

@end
