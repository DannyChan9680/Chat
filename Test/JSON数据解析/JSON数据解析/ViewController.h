//
//  ViewController.h
//  JSON数据解析
//
//  Created by Civet on 2019/7/31.
//  Copyright © 2019 yanghao. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController

< UITableViewDelegate,UITableViewDataSource>
{
    //数据视图定义
    UITableView* _tableView;
    //书籍数组
      NSMutableArray* _arrayBooks;
}
@end

