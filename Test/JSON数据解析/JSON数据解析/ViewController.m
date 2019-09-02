//
//  ViewController.m
//  JSON数据解析
//
//  Created by Civet on 2019/7/31.
//  Copyright © 2019 yanghao. All rights reserved.
//

#import "ViewController.h"
#import "BookModel.h"
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    //创建数据视图
    _tableView=[[UITableView alloc] initWithFrame:self.view.bounds style:UITableViewStyleGrouped];
    
    _tableView.delegate=self;
    _tableView.dataSource=self;
    self.view.backgroundColor = [UIColor orangeColor];
    self.navigationItem.title = @"您好 Swift";

    [self.view addSubview:_tableView];
    [self parseData];
}
//每组数据个数
-(NSInteger) numberOfSectionsInTableView:(UITableView *)tableView
{
    return _arrayBooks.count;
}
-(UITableViewCell*) tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSString* strID=@"ID";
    UITableViewCell* cell=[_tableView dequeueReusableCellWithIdentifier:strID];
    if(cell==nil)
    {
        cell=[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:strID];
        
    }
    //获取对应的图书数据
    BookModel* book=[_arrayBooks objectAtIndex:indexPath.row];
    //获取数组名赋值为label
    cell.textLabel.text=book.mBookName;
    return cell;
}
//解析数据
-(void) parseData
{
    //获取json文件本地路径
    NSString * path=[[NSBundle mainBundle] pathForResource:@"douban" ofType:@"json"];
    //加载json文件为二进制文件
    NSData* data=[NSData dataWithContentsOfFile:path];
    
    //字典对象解析,将json数据解析为字典格式
    NSDictionary * dicRoot=[NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableContainers error:nil];
    //判断解析是否为字典
    if([dicRoot isKindOfClass:[NSDictionary class]])
    {
        //开始解析数据
        _arrayBooks=[[NSMutableArray alloc] init];
        //解析根数据
        NSArray* arrayEnter=[dicRoot objectForKey:@"enter"];
        //遍历数组对象
        for(int i=0; i< arrayEnter.count ;i++)
        {
            NSDictionary* dicBook=[arrayEnter objectAtIndex:i];
            //获取书籍名称
            NSString* bookName=[dicBook objectForKey:@"title"];
            BookModel* book=[[BookModel alloc] init];
            book.mBookName=bookName;
            
            NSArray * arrAttr=[dicRoot objectForKey:@"db:attribute"];
            for(int i=0 ;i<arrAttr.count;i++)
            {
                NSDictionary *dic=[arrAttr objectAtIndex:i];
                NSString* strName=[dic objectForKey:@"name"];
                if([strName isEqualToString:@"price"]==YES)
                {
                    NSString* price=[dic objectForKey:@"$t"];
                    book.mPrice=price;
                }
                else if([strName isEqualToString:@"publisher"]==YES)
                {
                    NSString* pub=[dic objectForKey:@"publisher"];
                    book.mPublisher=pub;
                }
            }
            //t添加到数组中
            [_arrayBooks addObject:book];
            
        }
    }
    
}

@end
