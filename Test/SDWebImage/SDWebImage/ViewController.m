//
//  ViewController.m
//  SDWebImage
//
//  Created by Civet on 2019/8/1.
//  Copyright © 2019 yanghao. All rights reserved.
//

#import "ViewController.h"
#import "AFNetworking.h"
#import "UIImageView+WebCache.h"
#import "BookModel.h"
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.title=@"加载网络视图Demo";

    _tableView=[[UITableView alloc] initWithFrame:self.view.bounds style:UITableViewStyleGrouped];
    //设置数据视图代理协议
    //_tableView.delegate=self;
    _tableView.dataSource=self;
    //自动调整试图大小属性
    _tableView.autoresizingMask=UIViewAutoresizingFlexibleHeight|UIViewAutoresizingFlexibleWidth;
    
    [self.view addSubview:_tableView];
    
    _arrayData=[[NSMutableArray alloc] init];
    
   /* for(int i=0;i<10;i++)
    {
        NSString* str =[NSString stringWithFormat:@"数据%d",i+1];
        [_arrayData addObject:str];
    }*/
    _btnLoadData=[[UIBarButtonItem alloc] initWithTitle:@"加载" style:UIBarButtonItemStylePlain target:self action:@selector(pressLoad)];
    self.navigationItem.rightBarButtonItem=_btnLoadData;
}
//加载新的数据刷新显示的视图
-(void) pressLoad
{
   /* static int i=0;
    for(int j=0;j<10;j++,i++)
   {
        NSString* str=[NSString stringWithFormat:@"数据%d",i+1];
        [_arrayData addObject:str];
    }*/
    [self loadDataFromNet];
}
//下载数据
-(void) loadDataFromNet
{
    //获取AFHTTPSession 对象
    AFHTTPSessionManager *session=[AFHTTPSessionManager manager];
    NSArray* arrayG=[NSArray arrayWithObjects:@"ios",@"Android",@"C++", nil];
    
    static int counter=0;
    
    NSString* path=[NSString stringWithFormat:@"https://api.douban.com/book/subjects?q=ios&alt=json&apikey=01987f93c544bbfb04c97ebb4fce33f1",arrayG[counter]];
    counter++;
    if(counter>=3)
    {
        counter=0;
    }
    //下载网络数据
    [session GET:path parameters:nil progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        NSLog(@"下载成功");
        if([responseObject isKindOfClass:[NSDictionary class]])
        {
            NSLog(@"dic =%@",responseObject);
            [self parseData:responseObject];
        }
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        NSLog(@"下载失败");
    }];
    
}
//解析数据函数
-(void) parseData:(NSDictionary* )dicData
{
    NSArray* arrEntry =[dicData objectForKey:@"entry"];
    for(NSDictionary *dicBook in arrEntry)
    {
        NSDictionary * dicTitle=[dicBook objectForKey:@"title"];
        NSString* strTitle=[dicTitle objectForKey:@"$t"];
        
        BookModel* bModel=[[BookModel alloc] init];
        
        bModel.mBookName=strTitle;
        
        NSArray* arrLink=[dicBook objectForKey:@"link"];
        
        for(NSDictionary *dicLink in arrLink)
        {
            NSString* sValue=[dicLink objectForKey:@"rel"];
            
            if([sValue isEqualToString:@"image"])
            {
                bModel.mImageURL=[dicLink objectForKey:@"href"];
            }
        }
        [_arrayData addObject:bModel];
    }
    [_tableView reloadData];
}
//组数
-(NSInteger) numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}
//组数的个数
-(NSInteger) tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return _arrayData.count;
}
//设置单元格高度
-(CGFloat) tableView:(UITableView *)tableView heightForRowAtIndexPath:(nonnull NSIndexPath *)indexPath
{
    return 80;
}
//数据个数
-(UITableViewCell*) tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSString * strID=@"ID";
    UITableViewCell* cell=[_tableView dequeueReusableCellWithIdentifier:strID];
    
    if(cell==nil)
    {
        cell=[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:strID];
        
    }
    BookModel* bModel=_arrayData[indexPath.row];
    cell.textLabel.text=bModel.mBookName;
    //使用webImage加载网络图片
    [cell.imageView sd_setImageWithURL:[NSURL URLWithString:bModel.mImageURL] placeholderImage:[UIImage imageNamed:@"1.jpg"]];
    
   // SDWebImageManager* mgr=[SDWebImageManager sharedManager];
    return  cell;
}
@end
