//
//  ViewController.h
//  XML数据解析
//
//  Created by Civet on 2019/8/1.
//  Copyright © 2019 yanghao. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController
<UITabBarDelegate,UITableViewDataSource>
{
    //数据视图
    UITableView* _tableView;
    //数据数组
    NSMutableArray * _arrayData;
}
@end

