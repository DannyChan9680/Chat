//
//  ViewController.h
//  UITableView高级协议
//
//  Created by Civet on 2019/7/31.
//  Copyright © 2019 yanghao. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController
<UITableViewDelegate,UITableViewDataSource,UISearchResultsUpdating>
{
    //添加导航按钮
    UIBarButtonItem* _btnEdit;
    UIBarButtonItem* _btnFinish;
    //设置编辑状态
    BOOL _isEdit;
}
@property(strong,nonatomic)UISearchController* search;
@property(strong,nonatomic)UITableView* tableView;
@property(strong,nonatomic)NSArray* arrayData;
@property (nonatomic,retain)NSDictionary *allKeysDict;
@property(strong,nonatomic)NSMutableArray* pinyinIndexArray;
@end

