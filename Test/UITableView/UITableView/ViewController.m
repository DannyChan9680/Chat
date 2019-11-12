//
//  ViewController.m
//  UITableView
//
//  Created by Civet on 2019/7/31.
//  Copyright © 2019 yanghao. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    //创建数据视图
    _tableView=[[UITableView alloc] initWithFrame:self.view.bounds style:UITableViewStyleGrouped];
    //设置数据视图的代理对象
    _tableView.delegate=self;
    //设置数据视图的数据源对象
    _tableView.dataSource=self;
    //显示数据视图
    [self.view addSubview:_tableView];
    
    
    
}
//获取每组数据元素的个数，必须要实现的数据函数，返回值为每组元素的个数
-(NSInteger) tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 5;
}
//
-(NSInteger) numberOfSectionsInTableView:(UITableView *)tableView
{
    return 3;
}
-(UITableViewCell*) tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSString* cellStr=@"cell";
    
    UITableViewCell* cell=[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellStr];
    
    if(cell==nil)
    {
        //创建单元格对象，参数1为单元格的样式，参数2 为单元格的复用标记
        cell=[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellStr];
    }
    NSString* str =[NSString stringWithFormat:@"第%ld组，第%ld行",indexPath.section,indexPath.row+1];
    //将单元格的主文字内容z赋值
    cell.textLabel.text=str;
    return  cell;
}
@end
