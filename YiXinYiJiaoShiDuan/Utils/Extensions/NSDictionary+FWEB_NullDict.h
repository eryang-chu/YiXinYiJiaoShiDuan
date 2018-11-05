//
//  NSDictionary+FWEB_NullDict.h
//  fuwuEbao
//
//  Created by Jiao on 2018/8/8.
//  Copyright © 2018年 bornsoft. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSDictionary (FWEB_NullDict)
- (id)null_objectForKey:(id)aKey;

- (NSString *)toJsonString;
-(NSData *)toJSONData;
@end
