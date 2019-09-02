//
//  VCFirst.m
//  分栏控制器基础
//
//  Created by Civet on 2019/7/30.
//  Copyright © 2019 yanghao. All rights reserved.
//

#import "VCFirst.h"

@interface VCFirst ()

@end

@implementation VCFirst

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    //创建一个分栏对象
    //方法一
    /*UITabBarItem* tabBarItem=[[UITabBarItem alloc] initWithTitle:@"111" image:nil tag:101];
    
    self.tabBarItem=tabBarItem;*/
    
    UITabBarItem* tabBarItem=[[UITabBarItem alloc] initWithTabBarSystemItem:UITabBarSystemItemContacts tag:101];
    //按钮右上角的提示消息
    tabBarItem.badgeValue=@"222";
    self.tabBarItem=tabBarItem;
    
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
