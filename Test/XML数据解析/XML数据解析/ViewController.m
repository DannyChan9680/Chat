//
//  ViewController.m
//  XML数据解析
//
//  Created by Civet on 2019/8/1.
//  Copyright © 2019 yanghao. All rights reserved.
//

#import "ViewController.h"
#import "GDataXMLNode.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    _tableView=[[UITableView alloc] initWithFrame:self.view.bounds style:UITableViewStyleGrouped];
    
    _tableView.delegate=self;
    
    _tableView.dataSource=self;
    
    [self.view addSubview:_tableView];
    
    _arrayData=[[NSMutableArray alloc] init];
}
-(NSInteger) numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}
-(NSInteger) tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return _arrayData;
}

-(void) parseXML
{
    //获取解析文件的全路径,txt格式，内容为XML格式
    NSString* path=[[NSBundle mainBundle] pathForResource:@"File" ofType:@"txt"];
    //将XML读入内存中，并且以二进制方式存储
    NSData* dataXML=[NSData dataWithContentsOfFile:path];
    //错误对象定义
    NSError* error=nil;
    //创建文档对象， 参数1为XML格式的二进制对象，参数2为选择性参数，参数3为错误对象
    //rootElement
    GDataXMLDocument* docXML=[[GDataXMLDocument alloc] initWithData:dataXML options:0 error:&error];
    //GDataXMLDocument* docXML=[[GDataDocument alloc] initWithData:dataXML options:0 error:&error];
    
    NSLog(@"error =%@",error);
    
    /*//获取根节点
    GDataXMLNode* elemRoot=[docXML rootElement];
    //搜素节点下的所有count元素
   NSArray* arrCount=[elemRoot elementsForName:@"count"];
   */
}
@end
