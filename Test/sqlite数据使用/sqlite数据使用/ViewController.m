//
//  ViewController.m
//  sqlite数据使用
//
//  Created by Civet on 2019/8/8.
//  Copyright © 2019 yanghao. All rights reserved.
//

#import "ViewController.h"
#import "FMDatabase.h"
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    //设置按钮标题
    NSArray*  arrTitle=[NSArray arrayWithObjects:@"创建数据",@"插入数据",@"删除数据",@"查找显示", nil];
    //循环输出按钮
    for(int i=0;i<4;i++)
    {
        UIButton* btn=[UIButton buttonWithType:UIButtonTypeRoundedRect];
        
        btn.frame=CGRectMake(100, 100+80*i, 80, 40);
        
        [btn addTarget:self action:@selector(pressBtn:) forControlEvents:UIControlEventTouchUpInside];
        
        btn.tag=100+i;
        
        [btn setTitle:arrTitle[i] forState:UIControlStateNormal];
        
        [self.view addSubview:btn];
    }
}
//按钮按下时调用的函数
-(void) pressBtn:(UIButton *) btn
{
    //创建打开数据库
    if(btn.tag==100)
    {
        //获取数据库的创建路径
        //NSHomeDirectory()：获取手机软件的沙盒路径
        NSString* strPath=[NSHomeDirectory() stringByAppendingString:@"/db01.db"];
        //创建并且打开数据库
        //如果路径下不存在数据库，则创建指定数据库
        //如果路径下已经存在数据库，则直接访问，加载数据库到内存
        _mDB=[FMDatabase databaseWithPath:strPath];
        
        if(_mDB!=nil)
        {
            NSLog(@"数据库创建成功");
        }
        //打开数据库
        [_mDB open];
        
        BOOL isOpen=[_mDB open];
        if(isOpen)
        {
            NSLog(@"打开数据库成功");
        }
        //创建一个字符串
        //将sql创建语句写到字符串当中
        NSString* strCreateTable=@"create table if not exists stu(id integer primary key,age integer,name varchar(20)) ;";
        //执行sql语句，sql语句有效
        //如果执行成功，返回yes结果
        //反之返回no
        BOOL isCreate=[_mDB executeUpdate:strCreateTable];
        
        if(isCreate==YES)
        {
            NSLog(@"创建时数据表成功");
        }
        BOOL isClose=[_mDB close];
        if(isClose)
        {
            NSLog(@"关闭数据库成功");
        }
    }
    //插入数据
    else if(btn.tag==101)
    {
        //获取数据库的创建路径
        //NSHomeDirectory()：获取手机软件的沙盒路径
        NSString* strPath=[NSHomeDirectory() stringByAppendingString:@"/db01.db"];
        //创建并且打开数据库
        //如果路径下不存在数据库，则创建指定数据库
        //如果路径下已经存在数据库，则直接访问，加载数据库到内存
        _mDB=[FMDatabase databaseWithPath:strPath];
        //确保数据库被加载
        if(_mDB!=nil)
        {
            //打开数据库
            if([_mDB open])
            {
                NSString* strInsert=@"insert into stu values(3,19,'Daniel');";
                BOOL isOK=[_mDB executeUpdate:strInsert];
                if(isOK==YES)
                {
                    NSLog(@"加载成功");
                }
            }
        }
    }
    //删除数据
    else if(btn.tag==102)
    {
        NSString* strPath=[NSHomeDirectory() stringByAppendingString:@"/db01.db"];
        //创建并且打开数据库
        //如果路径下不存在数据库，则创建指定数据库
        //如果路径下已经存在数据库，则直接访问，加载数据库到内存
        _mDB=[FMDatabase databaseWithPath:strPath];
        
        NSString* strDelete=@" delete from stu where id=1; ";
        BOOL * isOpen=[_mDB open];
        [_mDB executeUpdate:strDelete];
    }
    //查找显示
    else
    {
        NSString* strPath=[NSHomeDirectory() stringByAppendingString:@"/db01.db"];
        //创建并且打开数据库
        //如果路径下不存在数据库，则创建指定数据库
        //如果路径下已经存在数据库，则直接访问，加载数据库到内存
        _mDB=[FMDatabase databaseWithPath:strPath];

        NSString * strQuery=@" select * from stu;";
        
        BOOL isOpen=[_mDB open];
        
        if(isOpen)
        {
            //执行查找语句
            //将查找结果用ResultSet返回
            FMResultSet * result=[_mDB executeQuery:strQuery];
            //遍历所有结果
            while([result next])
            {
                //获取id字段内容
               NSInteger stuID=[result intForColumn:@"id"];
                //获取名称字段内容
               NSString* strName=[result stringForColumn:@"name"];
                //获取年龄字段内容
                NSInteger stuAge=[result intForColumn:@"age"];
                NSLog(@"stu id = %d,name= %@,age =%d",stuID,strName,stuAge);
            }
            
        }
    }
}

@end
