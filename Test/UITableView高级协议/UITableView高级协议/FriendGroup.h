//
//  FriendGroup.h
//  UITableView高级协议
//
//  Created by Civet on 2019/9/29.
//  Copyright © 2019 yanghao. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface FriendGroup : NSObject

@property(copy ,nonatomic)NSString* name;
//数组存放在firends的实例对象
@property(copy,nonatomic)NSMutableArray* friends;
//判断分组是否打开（opened属性是实现l下拉列表的关键）
@property(assign,nonatomic,getter=isOpened)BOOL opened;

//使用自定义方法赋值
-(void)setFriendGroupDic:(NSMutableDictionary *)dic;

@end

NS_ASSUME_NONNULL_END
