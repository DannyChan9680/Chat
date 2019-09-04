//
//  ChatUserTableViewController.m
//  ChatChat
//
//  Created by Civet on 2019/8/27.
//  Copyright © 2019 limeixiang. All rights reserved.
//

#import "ChatUserTableViewController.h"
#import "ChatViewController.h"
#import "Firebase.h"
@interface ChatUserTableViewController ()


@end

@implementation ChatUserTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    ChatViewController * chatView=[[ChatViewController alloc] init];
    chatView.userId=_textField.text;
    _textField=[[UITextField alloc] initWithFrame:CGRectMake(50, 95, 250, 30)];
    [_textField setBorderStyle:UITextBorderStyleRoundedRect];
    _textField.placeholder=@"请输入名称";
    _textField.tintColor=[UIColor grayColor];
    
    _btn= [UIButton buttonWithType:UIButtonTypeRoundedRect];
    _btn.frame=CGRectMake(320, 90, 80, 40);
    _btn.backgroundColor=[UIColor greenColor];
    [_btn setTitle:@"添加" forState:UIControlStateNormal];
    [_btn addTarget:self action:@selector(createUser) forControlEvents:UIControlEventTouchUpInside];
    
    [self.view addSubview:_btn];
    [self.view addSubview:_textField];
    _tableview=[[UITableView alloc] initWithFrame:CGRectMake(0, 130, 450, 800)];
    
    //设置代理对象
    _tableview.delegate=self;
    _tableview.dataSource=self;
    [self.view addSubview:_tableview];
    
    _arrayData=[[NSMutableArray alloc] init];
    
    self.title= @"用户列表";
    UIBarButtonItem *cancelBtn=[[UIBarButtonItem alloc] initWithTitle:@"退出" style:UIBarButtonItemStyleDone target:self action:@selector(signOut:)];
    self.navigationItem.rightBarButtonItem=cancelBtn;
    _senderDisplayName=_textField.text;
}
- (IBAction)signOut:(UIButton *)sender {
    FIRAuth *firebaseAuth = [FIRAuth auth];
    NSError *signOutError;
    BOOL status = [firebaseAuth signOut:&signOutError];
    if (!status) {
        NSLog(@"Error signing out: %@", signOutError);
        return;
    }
    [self.navigationController popToRootViewControllerAnimated:YES];
}
//列表分组
-(NSInteger) numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}
//获取每组元素
-(NSInteger) tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return _arrayData.count;
}
//设置列表单元格的高度
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return _tableview.frame.size.height/20;
}
//
-(UITableViewCell*) tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell * cell = [_tableview dequeueReusableCellWithIdentifier:@"cellID"];
    if(cell == nil){
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:@"cellID"];
    }
    
    cell.textLabel.text = [NSString stringWithFormat:@"%@",[_arrayData objectAtIndex:indexPath.row]] ;
    cell.textLabel.textColor = [UIColor blueColor];
    
    return cell;
}
-(void) tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    //跳转聊天界面；
    ChatViewController *chatView=[[ChatViewController alloc] init];
    //如果包含导航栏的话，需要使用如下方式进行界面跳转；不能使用presentViewController进行跳转;
    [self.navigationController pushViewController:chatView animated:true];
}
-(void)createUser
{
    [_arrayData addObject:_textField.text];
    _textField.text=@"";
    [_tableview reloadData];
}
/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
