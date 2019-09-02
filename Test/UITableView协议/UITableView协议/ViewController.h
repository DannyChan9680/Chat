//
//  ViewController.h
//  UITableView协议
//
//  Created by Civet on 2019/7/31.
//  Copyright © 2019 yanghao. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController
//普通代理协议与数据代理协议
<UITableViewDelegate,UITableViewDataSource>
{
    //定义数据视图对象
    UITableView* _tableView;
    //声明一个数组
    NSMutableArray* _arrayData;
}
@end

