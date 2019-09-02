//
//  ViewController.h
//  UITableView
//
//  Created by Civet on 2019/7/31.
//  Copyright © 2019 yanghao. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController

<
//实现数据视图的普通协议
UITableViewDelegate,
//实现视图的数据代理协议
UITableViewDataSource>
{
    //定义一个数据视图对象， 用来显示大量相同格式的信息的视图
    UITableView *_tableView;
}
@end

