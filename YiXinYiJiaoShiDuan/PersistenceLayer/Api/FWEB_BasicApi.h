//
//  FWEB_BasicApi.h
//  fuwuEbao
//
//  Created by Jiao on 2018/8/7.
//  Copyright © 2018年 bornsoft. All rights reserved.
//

#import <Foundation/Foundation.h>

BOOL GetSuccessInResp(id responseObject); // 获取responseObject中的success
NSString * GetCodeInResp(id responseObject); // 获取responseObject中的code
NSString * GetMsgInResp(id responseObject); // 获取responseObject中的msg
id GetDataInResp(id responseObject); // 获取responseObject中的data

/**
 生成error
 
 @param errorMsg error的信息
 @param errorDomain error的标志
 @param errorCode 本地code
 @return error
 */
NSError * errorWithMsg(NSString *errorMsg, NSString *errorDomain, NSUInteger errorCode);


/**
 通过resp 自动生成error
 
 @param responseObject resp
 @param errorDomain error的标志
 @param errorCode 本地code
 @return error
 */
NSError * errorWithResp(id responseObject, NSString *errorDomain, NSUInteger errorCode);

@interface FWEB_BasicApi : NSObject

@end
