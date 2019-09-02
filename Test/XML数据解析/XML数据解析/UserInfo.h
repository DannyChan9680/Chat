//
//  UserInfo.h
//  XML数据解析
//
//  Created by Civet on 2019/8/1.
//  Copyright © 2019 yanghao. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface UserInfo : NSObject
//创建用户信息
@property (retain,nonatomic) NSString*  mUserName; //用户名
@property (retain,nonatomic) NSString*  mUserID;//用户ID
@property (retain,nonatomic) NSString*  mUserCredit;//用户信用
@property (retain,nonatomic) NSString*  mUserExp;//用户经验值
@property (retain,nonatomic) NSString*  mUserNickName;//用户昵称
@property (retain,nonatomic) NSString*  mHeaderPath;//头像途径
@property (assign,nonatomic) NSInteger  mGroupID;//分组ID
@property (assign,nonatomic) NSInteger mFriendNum;//好友数量

@end

NS_ASSUME_NONNULL_END
