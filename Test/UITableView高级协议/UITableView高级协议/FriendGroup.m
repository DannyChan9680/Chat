//
//  FriendGroup.m
//  UITableView高级协议
//
//  Created by Civet on 2019/9/29.
//  Copyright © 2019 yanghao. All rights reserved.
//

#import "FriendGroup.h"
#import "Friend.h"
@implementation FriendGroup
-(void)setFriendGroupDic:(NSMutableDictionary *)dic
{
    //通过字典给FriendGroup的属性赋值
    [self setValuesForKeysWithDictionary:dic];
    NSMutableArray * tempArray=[NSMutableArray array];
    //遍历数组
    for(NSMutableDictionary * dic in self.friends)
    {
        Friend * friend=[[Friend alloc] init];
        [friend setValuesForKeysWithDictionary:dic];
        [tempArray addObject:friend];
    }
    //重新对friends属性数组赋值，此时存的是Friend对象
    self.friends=[NSMutableArray arrayWithArray:tempArray];
}

@end
