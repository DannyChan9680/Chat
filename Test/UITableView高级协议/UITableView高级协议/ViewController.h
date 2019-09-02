//
//  ViewController.h
//  UITableView高级协议
//
//  Created by Civet on 2019/7/31.
//  Copyright © 2019 yanghao. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController
<UITableViewDelegate,UITableViewDataSource>
{
    //创建数据视图
    UITableView* _tableView;
    //创建数据源
    NSMutableArray* _arrayData;
    //添加导航按钮
    UIBarButtonItem* _btnEdit;
    UIBarButtonItem* _btnFinish;
    UIBarButtonItem* _btnDelete;
    //设置编辑状态
    BOOL _isEdit;
}

@end

