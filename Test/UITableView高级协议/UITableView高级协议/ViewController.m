//
//  ViewController.m
//  UITableView高级协议
//
//  Created by Civet on 2019/7/31.
//  Copyright © 2019 yanghao. All rights reserved.
//

#import "ViewController.h"
#import "Friend.h"
#import "FriendGroup.h"
#import "Masonry.h"
#define KCNSSTRING_ISEMPTY(str) (str == nil || [str isEqual:[NSNull null]] || str.length <= 0)
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    //单元格允许多项编辑
    self.tableView.allowsMultipleSelectionDuringEditing = YES;
    //初始化数据源数组
    _arrayData =[[NSArray alloc]init];
    NSMutableArray *array= [NSMutableArray arrayWithContentsOfFile:[[NSBundle mainBundle]pathForResource:@"Data" ofType:@"plist"]];
    
    _allKeysDict =  [self createCharacter:array];
    NSLog(@"%@",_allKeysDict);
    _arrayData = [self.allKeysDict.allKeys sortedArrayUsingComparator:^NSComparisonResult(id obj1, id obj2) {
        NSString *letter1 = obj1;
        NSString *letter2 = obj2;
        if (KCNSSTRING_ISEMPTY(letter2)) {
            return NSOrderedDescending;
        }else if ([letter1 characterAtIndex:0] < [letter2 characterAtIndex:0]) {
            return NSOrderedAscending;
        }
        return NSOrderedDescending;
    }];
    
    _tableView=[[UITableView alloc] initWithFrame:self.view.bounds style:UITableViewStylePlain];
    
    //自动调整子视图的大小
    _tableView.autoresizingMask=UIViewAutoresizingFlexibleHeight|UIViewAutoresizingFlexibleWidth;
    //设置代理
    _tableView.delegate=self;
    _tableView.dataSource=self;
    //当前数据的数据源发生变化，更新数据视图时，重新加载数据
    [_tableView reloadData];
    
  [self.view addSubview:_tableView];
    [_tableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.view.mas_top).offset(70);
        make.left.equalTo(self.view .mas_left).offset(0);
        make.right.equalTo(self.view.mas_right).offset(0);
        make.bottom.equalTo(self.view.mas_bottom).offset(-10);
    }];
   [self createBtn];
}
-(void)getData
{
    NSString* filePath=[[NSBundle mainBundle] pathForResource:@"friend.plist" ofType:nil];
    NSArray * tempArray=[NSArray arrayWithContentsOfFile:filePath];
    for(NSMutableDictionary *dic in tempArray)
    {
        FriendGroup* friendGroup=[[FriendGroup alloc]init];
        [friendGroup setFriendGroupDic:dic];
//        [self.arrayData addObject:friendGroup];
    }
   [_tableView reloadData];
}
//创建按钮
-(void) createBtn
{
    _isEdit=NO;
    //创建功能按钮
    _btnEdit=[[UIBarButtonItem alloc] initWithTitle:@"删除" style:UIBarButtonItemStylePlain target:self action:@selector(pressEdit)];
    _btnFinish=[[UIBarButtonItem alloc] initWithTitle:@"完成" style:UIBarButtonItemStylePlain target:self  action:@selector(pressFinish)];
    _search=[[UISearchController alloc] initWithSearchResultsController:nil];
    _search.searchResultsUpdater=self;
    _search.dimsBackgroundDuringPresentation=true;
    _tableView.tableHeaderView = _search.searchBar;
    
    self.navigationItem.title=@"tableview操作";
    self.navigationItem.rightBarButtonItem=_btnEdit;
}
//编辑栏设置
-(void)  pressEdit
{
    _isEdit=YES;
    self.navigationItem.rightBarButtonItem=_btnFinish;
    [_tableView setEditing:YES];
}
//操作完成结束
-(void) pressFinish
{
    _isEdit=NO;

    self.navigationItem.rightBarButtonItem=_btnEdit;
    [_tableView setEditing:NO];
}
-(void)  pressDelete
{
    _isEdit=YES;
    self.navigationItem.leftBarButtonItem=_btnFinish;
    [_tableView setEditing:YES];
}
//section的titleHeader
- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section {
    if (!_search.active) {
        return self.arrayData[section];
    }
    else{
        return nil;
    }
}
- (NSArray *) sectionIndexTitlesForTableView:(UITableView *)tableView {
    if (!_search.active) {
        return self.arrayData;
    }
    else{
        return self.pinyinIndexArray;
    }
    
}
//每组section行数
-(NSInteger) tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if (!_search.active) {
        return [(NSArray*)self.allKeysDict[self.arrayData[section]] count];
    }
    else{
        
        if (_pinyinIndexArray.count!=0) {
            return [(NSArray*)self.allKeysDict[self.pinyinIndexArray[section]] count];
        }else{
            
            return 0;
        }
        
    }}
//section个数
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    if (!_search.active) {
        return self.arrayData.count;
    }
//    else if (_btnEdit)
//    {
//        return self.arrayData.count;
//    }
    else{
        return 1;
        
    }
}

////列表视图代理
//-(UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
//{
//    FriendGroup * friendGroup=[self.allArray objectAtIndex:section];
//    return 0;
//}

-(UITableViewCell*) tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSString *strID=@"ID";
    //尝试获取可以复用的的单元格
    //如果获取不了，返回为空
    UITableViewCell* cell=[tableView dequeueReusableCellWithIdentifier:strID];
    if(cell==nil)
    {
      cell=[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:strID];
        
    }
    if (!_search.active) {
        cell.textLabel.text = [self.allKeysDict[self.arrayData[indexPath.section]] objectAtIndex:indexPath.row];
    }else{
        cell.textLabel.text = [self.allKeysDict[self.pinyinIndexArray[indexPath.section]] objectAtIndex:indexPath.row];
    }
    //设置长按手势
    UILongPressGestureRecognizer * longPressGesture=[[UILongPressGestureRecognizer alloc] initWithTarget:self  action:@selector(longPress:)];
    [cell addGestureRecognizer:longPressGesture];
    return cell;
}
-(void)longPress:(UILongPressGestureRecognizer *) gestureRecognizer
{
    if(gestureRecognizer.state==UIGestureRecognizerStateBegan)
    {
        UITableViewCell *cell=(UITableViewCell *)gestureRecognizer.view;
        [cell becomeFirstResponder];
        //定义菜单
        UIMenuController *menu = [UIMenuController sharedMenuController];
        
        UIMenuItem *copy = [[UIMenuItem alloc] initWithTitle:@"拷贝" action:@selector(copyAction:)];
        UIMenuItem *forward = [[UIMenuItem alloc] initWithTitle:@"转发" action:@selector(forwardAction:)];
        UIMenuItem *withDraw = [[UIMenuItem alloc] initWithTitle:@"撤回" action:@selector(withDrawAction:)];
        UIMenuItem *delete = [[UIMenuItem alloc] initWithTitle:@"删除" action:@selector(deleteAction:)];
        //设定菜单显示的区域，显示再Rect的最上面居中
        [menu setTargetRect:cell.frame inView:self.view];
        [menu setMenuItems:@[copy,forward,withDraw,delete]];
        [menu setMenuVisible:YES animated:YES];
    }
}
- (BOOL)canBecomeFirstResponder {
    return YES;
}
//拷贝
- (void)copyAction:(id)sender {
    NSLog(@"copy");
    //拷贝操作
    UIPasteboard *pasteboard = [UIPasteboard generalPasteboard];
    [pasteboard setString:self.arrayData];
}
//转发
- (void)forwardAction:(id)sender {
    NSLog(@"forward");
}
//撤回
- (void)withDrawAction:(id)sender {
    NSLog(@"withDraw");
}
//删除
- (void)deleteAction:(id)sender {
    NSLog(@"delete");
}

//对cell进行编辑操作，删除cell
-(void) tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSMutableArray* copy=[self.arrayData mutableCopy];
    //删除
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        //通过获取的索引值删除数组的值
        [copy removeObjectAtIndex:indexPath.row];
        [_tableView beginUpdates];
        if(copy.count==0)
        {
            [_tableView deleteSections:[NSIndexSet indexSetWithIndex:indexPath.section] withRowAnimation:UITableViewRowAnimationLeft];
        }
        //删除单元的某一行时，使用动画实现删除的过程
        [_tableView deleteRowsAtIndexPaths:[NSArray arrayWithObject:indexPath]
                         withRowAnimation:UITableViewRowAnimationAutomatic];
        self.arrayData=[copy mutableCopy];
        [_tableView endUpdates];
    }
}
//是否可以移动移动cell
-(BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath
{
    return YES;
}
//cell执行移动操作
-(void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)sourceIndexPath toIndexPath:(NSIndexPath *)destinationIndexPath
{
    //需要移动的行
    NSUInteger fromRow = [sourceIndexPath row];
    //获取移动某处的位置
    NSUInteger toRow = [destinationIndexPath row];
    //从数组中获取需要移动行的数据
    id object = [_arrayData objectAtIndex:fromRow];
    //在数组中移动需要的移动的行数据
//    [_arrayData removeObjectAtIndex:fromRow];
    //把需要移动的单元格数据在数组中，移动到想要移动的数组的前面
//    [_arrayData insertObject:object atIndex:toRow];
}
- (NSDictionary *)createCharacter:(NSMutableArray *)strArr
{
    NSMutableDictionary *dict = [NSMutableDictionary dictionary];
    for (NSDictionary *stringdict in strArr) {
        NSString *string = stringdict[@"name"];
        if ([string length]) {
            NSMutableString *mutableStr = [[NSMutableString alloc] initWithString:string];
            
            if (CFStringTransform((__bridge CFMutableStringRef)mutableStr, 0, kCFStringTransformMandarinLatin, NO)) {
            }
            if (CFStringTransform((__bridge CFMutableStringRef)mutableStr, 0, kCFStringTransformStripDiacritics, NO)) {
                NSString *str = [NSString stringWithString:mutableStr];
                str = [str uppercaseString];
                NSMutableArray *subArray = [dict objectForKey:[str substringToIndex:1]];
                if (!subArray) {
                    subArray = [NSMutableArray array];
                    [dict setObject:subArray forKey:[str substringToIndex:1]];
                }
                [subArray addObject:string];
            }
        }
    }
    return dict;
}
//searchController代理设置
-(void)updateSearchResultsForSearchController:(UISearchController *)searchController
{
    NSPredicate *searchPredicate = [NSPredicate predicateWithFormat:@"SELF CONTAINS[c] %@",searchController.searchBar.text];
    self.pinyinIndexArray = [[self.arrayData filteredArrayUsingPredicate:searchPredicate] mutableCopy];
    dispatch_async(dispatch_get_main_queue(), ^{
        [self.tableView reloadData];
    });

}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [_tableView setEditing:YES animated:YES];
}
//设置列表单元格的编辑状态
-(BOOL) tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    return YES;
}
-(UITableViewCellEditingStyle) tableView:(UITableView *)tableView editingStyleForRowAtIndexPath:(NSIndexPath *)indexPath
{
//    //支持默认操作
//    return UITableViewCellEditingStyleNone;
    //支持删除操作
    return UITableViewCellEditingStyleDelete;
//    //支持新增操作
//    return UITableViewCellEditingStyleInsert;
}
//-(void) tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
//{
//    //刷新方式 ，设置tableView带动画效果 删除数据
//    [_tableView deleteRowsAtIndexPaths:[NSArray arrayWithObject:indexPath] withRowAnimation:UITableViewRowAnimationFade];
//   //取消编辑状态
//   [_tableView setEditing:NO animated:YES];
//}
@end
