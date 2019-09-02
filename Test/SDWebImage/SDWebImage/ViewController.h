//
//  ViewController.h
//  SDWebImage
//
//  Created by Civet on 2019/8/1.
//  Copyright © 2019 yanghao. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController

<UITextViewDelegate, UITableViewDataSource>
//协议函数
{
    //创建数据视图
    UITableView* _tableView;
    //创建数据源对象
    NSMutableArray * _arrayData;
    //加载视图
    UIBarButtonItem* _btnLoadData;
    //编辑按钮
    UIBarButtonItem* _btnEdit;
}
@end

