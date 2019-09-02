//
//  ViewController.m
//  UITableView协议
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
    
    _tableView=[[UITableView alloc] initWithFrame:CGRectMake(0, 50, 400, 800) style:UITableViewStyleGrouped];
    
    //设置代理对象
    _tableView.delegate=self;
    
    _tableView.dataSource=self;
    
    [self.view addSubview:_tableView];
    //定义可变数组
    _arrayData=[[NSMutableArray alloc] init];
    
    for(int i='A';i<='Z';i++)
    {
        //定义小数组
        NSMutableArray * arraySmall=[[NSMutableArray alloc] init];
        for(int j=1;j<=5;j++)
        {
          NSString* str=[NSString stringWithFormat:@"%c%d",i,j];
            [arraySmall addObject:str];
        }
        //生成一个二维数组
        [_arrayData addObject:arraySmall];
    }
    [_tableView reloadData];
}
//获取组数
-(NSInteger) numberOfSectionsInTableView:(UITableView *)tableView
{
    return _arrayData.count;
}
//获取每组元素
-(NSInteger) tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    NSInteger numRow=[[_arrayData objectAtIndex:section] count];
    return numRow;
}
//
-(UITableViewCell*) tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSString* str=@"cell";
    UITableViewCell* cell=[_tableView dequeueReusableCellWithIdentifier:str];
    if(cell==nil)
    {
    cell=[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:str];
    }
    cell.textLabel.text=_arrayData[indexPath.section][indexPath.row];
    
    return cell;
}
//获取高度
-(CGFloat) tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 100;
}
//获取每组头部标题
-(NSString*) tableView:(UITableView *)tableView titleForFooterInSection:(NSInteger)section
{
    return  @"尾部标题\n";
}
//获取每组尾部标题
-(NSString*) tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
{
    return @"头部标题";
}
//获取头部高度
-(CGFloat) tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section
{
    return 40;
}
//获取尾部高度
-(CGFloat) tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 10;
}
@end
