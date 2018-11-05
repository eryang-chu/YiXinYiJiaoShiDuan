//
//  Notification.h
//  fuwuEbao
//
//  Created by Jiao on 2018/8/8.
//  Copyright © 2018年 bornsoft. All rights reserved.
//

#ifndef Notification_h
#define Notification_h

#pragma mark ======= POST NOTIFICATIONS =======

static inline void POST_Notification_UserInfo(NSString *name, id object, NSDictionary *userInfo) {
    [[NSNotificationCenter defaultCenter] postNotificationName:name object:object userInfo:userInfo];
}



#pragma mark ======= ADD NOTIFICATION OBSERVERS =======

static inline void ADD_Notification_Observer(id observer, SEL action, NSString *name, id obj) {
    [[NSNotificationCenter defaultCenter] addObserver:observer selector:action name:name object:obj];
}


#pragma mark ======= REMOVE NOTIFICATION OBSERVERS =======

static inline void REMOVE_Notification_Observer(id observer, NSString *name, id obj) {
    if (!name || !name.length) {
        [[NSNotificationCenter defaultCenter] removeObserver:observer];
        return;
    }
    
    [[NSNotificationCenter defaultCenter] removeObserver:observer name:name object:obj];
    
}

static NSString *Notification_Prefix = @"com.iphone.www.fastfirewholesale.";

#pragma mark - log status change
#define Notification_User_Login [Notification_Prefix stringByAppendingString:@"Notification_User_Login"]

#define Notification_User_Logout [Notification_Prefix stringByAppendingString:@"Notification_User_Logout"]

#define Notification_User_LogChange [Notification_Prefix stringByAppendingString:@"Notification_User_LogChange"]

#define Notification_User_Change_Logo [Notification_Prefix stringByAppendingString:@"Notification_User_Change_Logo"]
#define Notification_Edit_Commodity_Success [Notification_Prefix stringByAppendingString:@"Notification_Edit_Commodity_Success"]
#define Notification_User_Complete_User_Information  [Notification_Prefix stringByAppendingString:@"Notification_User_Complete_User_Information"]


#endif /* Notification_h */
