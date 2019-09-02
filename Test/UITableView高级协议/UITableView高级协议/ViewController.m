//
//  ViewController.m
//  UITableView高级协议
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
    _tableView=[[UITableView alloc] initWithFrame:self.view.bounds style:UITableViewStylePlain];
    
    //自动调整子视图的大小
    _tableView.autoresizingMask=UIViewAutoresizingFlexibleHeight|UIViewAutoresizingFlexibleWidth;
    //设置代理
    _tableView.delegate=self;
    _tableView.dataSource=self;
    //数据视图的尾部视图的设定
    _tableView.tableFooterView=nil;
    //数据视图的头部视图的设定
    _tableView.tableHeaderView=nil;
    
    //初始化数据源数组
    _arrayData=[[NSMutableArray alloc] init];
    for(int i=1;i<=10;i++)
    {
        NSString * str=[NSString stringWithFormat:@"A %d",i];
        [_arrayData addObject:str];
    }
    //当前数据的数据源发生变化，更新数据视图时，重新加载数据
    [_tableView reloadData];
    
  [self.view addSubview:_tableView];
   [self createBtn];
}
//创建按钮
-(void) createBtn
{
    _isEdit=NO;
    //创建功能按钮
    _btnEdit=[[UIBarButtonItem alloc] initWithTitle:@"编辑" style:UIBarButtonItemStylePlain target:self action:@selector(pressEdit)];
    _btnFinish=[[UIBarButtonItem alloc] initWithTitle:@"完成" style:UIBarButtonItemStylePlain target:self  action:@selector(pressFinish)];
    _btnDelete=[[UIBarButtonItem alloc] initWithTitle:@"删除" style:UIBarButtonItemStylePlain target:self action:@selector(pressDelete)];
    
    self.navigationItem.rightBarButtonItem=_btnEdit;
}
//编辑栏设置
-(void)  pressEdit
{
    _isEdit=YES;
    self.navigationItem.rightBarButtonItem=_btnFinish;
    [_tableView setEditing:YES];
    self.navigationItem.leftBarButtonItem=_btnDelete;
}
//操作完成结束
-(void) pressFinish
{
    _isEdit=NO;

    self.navigationItem.rightBarButtonItem=_btnEdit;
    [_tableView setEditing:NO];
    self.navigationItem.leftBarButtonItem=nil ;
}
//返回组数
-(NSInteger) tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return _arrayData.count;
}
-(UITableViewCell*) tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSString *strID=@"ID";
    //尝试获取可以复用的的单元格
    //如果获取不了，返回为空
    UITableViewCell* cell=[_tableView dequeueReusableCellWithIdentifier:strID];
    if(cell==nil)
    {
      cell=[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:strID];
        
    }
    //单元格文字符值
    cell.textLabel.text=[_arrayData objectAtIndex:indexPath.row];
    return cell;
}
//-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
//{
//    [_tableView setEditing:YES animated:YES];
//}
//-(BOOL) tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
//{
//    return YES;
//}
//-(UITableViewCellEditingStyle) tableView:(UITableView *)tableView editingStyleForRowAtIndexPath:(NSIndexPath *)indexPath
//{
//    //支持默认操作
//    return UITableViewCellEditingStyleNone;
//    //支持删除操作
//    return UITableViewCellEditingStyleDelete;
//    //支持新增操作
//    return UITableViewCellEditingStyleInsert;
//}
//-(void) tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
//{
//    //刷新方式 ，设置tableView带动画效果 删除数据
//    [_tableView deleteRowsAtIndexPaths:[NSArray arrayWithObject:indexPath] withRowAnimation:UITableViewRowAnimationFade];
//   //取消编辑状态
//   [_tableView setEditing:NO animated:YES];
//}
@end
