//
//  ChatViewController.m
//  ChatChat
//
//  Created by Civet on 2019/8/26.
//  Copyright © 2019 limeixiang. All rights reserved.
//
#import "ChatViewController.h"
#import "Contants.h"
#import "MeTableViewCell.h"
#import "OtherTableViewCell.h"
#import "ChatUserTableViewController.h"
#import "Masonry.h"
#import "Firebase.h"
#import "ApiAI.h"
#import "AppDelegate.h"
//@import FirebaseMLNLSmartReply;
@import Photos;
@import FirebaseMLCommon;

@implementation ChatViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    _msglength = 10;
    _messages = [[NSMutableArray alloc] init];
    _image=[[UIImage alloc] init];
    
    //设置表单信息
    _table = [[UITableView alloc] init];
    [self.view  addSubview:_table];
    _table.separatorColor=[UIColor clearColor];
    _table.delegate=self;
    _table.dataSource=self;
//    _table.rowHeight=UITableViewAutomaticDimension;
    //发送图片按钮
    _sendButton1= [UIButton buttonWithType:UIButtonTypeRoundedRect];
    _sendButton1.backgroundColor=[UIColor greenColor];
    [_sendButton1 setTitle:@"图片" forState:UIControlStateNormal];
    [_sendButton1 addTarget:self action:@selector(didTapAddPhoto:) forControlEvents:UIControlEventTouchUpInside];

    //消息文本
//    _textField=[[UITextView alloc] initWithFrame:CGRectMake(70, 820, 280, 50)];
    _textField=[[UITextView alloc] init];
    _textField.tintColor=[UIColor grayColor];
    _textField.layer.backgroundColor=[[UIColor clearColor] CGColor];
    _textField.layer.borderColor=[[UIColor grayColor] CGColor];
    _textField.layer.borderWidth=1.0;
    _textField.font=[UIFont systemFontOfSize:20];
    [_textField.layer setMasksToBounds:YES];

    //发送文字按钮
    _sendButton2= [UIButton buttonWithType:UIButtonTypeRoundedRect];
    _sendButton2.backgroundColor=[UIColor greenColor];
    [_sendButton2 setTitle:@"发送" forState:UIControlStateNormal];
    [_sendButton2 addTarget:self action:@selector(didSendMessage:) forControlEvents:UIControlEventTouchUpInside];
    
    [self.view addSubview:_textField];
    [self.view addSubview:_sendButton1];
    [self.view addSubview:_sendButton2];
    
    [_table mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.view.mas_top).with.offset(10);
        make.bottom.equalTo(self.view.mas_bottom).with.offset(-70);
        make.width.equalTo(self.view.mas_width);
//        make.height.equalTo(@600);
    }];

    [_sendButton1 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.equalTo(self.view.mas_bottom).with.offset(-15);
        make.left.equalTo(self.view.mas_left).with.offset(10);
        make.width.height.equalTo(@50);
    }];
    
    [_textField mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.equalTo(self.view.mas_bottom).with.offset(-15);
//        make.left.equalTo(self.view.mas_left).width.offset(60);
        make.left.equalTo(_sendButton1.mas_right).offset(10);
        make.right.equalTo(_sendButton2.mas_left).offset(-10);
        make.height.equalTo(@50);
    }];
    
    [self.view addSubview:_sendButton2];
    [_sendButton2 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.equalTo(self.view.mas_bottom).with.offset(-15);
        make.right.equalTo(self.view.mas_right).with.offset(-10);
        make.width.height.equalTo(@50);
    }];
    
    NSLog(@"所用的用户ID为%@",self.userId);
    self.title=@"聊天";
    
    self.view.backgroundColor=[UIColor whiteColor];
    
    //cell注册
    [_table registerClass:[MeTableViewCell class] forCellReuseIdentifier:NSStringFromClass([MeTableViewCell class])];
    [_table registerClass:[OtherTableViewCell class] forCellReuseIdentifier:NSStringFromClass([OtherTableViewCell class])];

    //方法调用
    [self configureDatabase];
    [self configureStorage];
    [self fetchConfig];
    [_table reloadData];
    //通知
    self.notiContent = [[UNMutableNotificationContent alloc] init];
    //引入代理
    [[UNUserNotificationCenter currentNotificationCenter] setDelegate:self];
}

//远程配置定义
- (void)fetchConfig {
    //设置过期时间
    long expirationDuration = 3600;
    
    //创建单例远程控制对象
    self.remoteConfig = [FIRRemoteConfig remoteConfig];
    FIRRemoteConfigSettings *remoteConfigSettings = [[FIRRemoteConfigSettings alloc] init];
    remoteConfigSettings.minimumFetchInterval = 0;
    self.remoteConfig.configSettings = remoteConfigSettings;
    [self.remoteConfig fetchWithExpirationDuration:expirationDuration completionHandler:^(FIRRemoteConfigFetchStatus status, NSError *error) {
        if (status == FIRRemoteConfigFetchStatusSuccess) {
            NSLog(@"Config fetched!");
            //远程配置消息长度
            FIRRemoteConfigValue *friendlyMsgLength = _remoteConfig[@"friendly_msg_length"];
            if (friendlyMsgLength.source != FIRRemoteConfigSourceStatic) {
                _msglength = friendlyMsgLength.numberValue.intValue;
                NSLog(@"Friendly msg length config: %d", _msglength);
            }
        } else {
            NSLog(@"Config not fetched");
            NSLog(@"Error %@", error);
        }

    }];
}
//- (IBAction)didPressFreshConfig:(id)sender {
//    [self fetchConfig];
//}
//使用ML KIT 进行智能回复
//-(void) SmartReply:(FIRSmartReply *)smartReply
//{
//    OtherTableViewCell *cell=[_table dequeueReusableCellWithIdentifier:NSStringFromClass([OtherTableViewCell class])];
//    FIRNaturalLanguage *naturalLanguage = [FIRNaturalLanguage naturalLanguage];
//    self.smartReply = [naturalLanguage smartReply];
//    [self.smartReply suggestRepliesForMessages:_messages
//                               completion:^(FIRSmartReplySuggestionResult * _Nullable result,
//                                            NSError * _Nullable error) {
//                                   if (error || !result) {
//                                       return;
//                                   }
//                                   if (result.status == FIRSmartReplyResultStatusNotSupportedLanguage) {
//                                       NSLog(@"The languge is not supported !");
//                                   } else if (result.status == FIRSmartReplyResultStatusSuccess) {
//                                       NSLog(@"successful !");
//                                   }
//                                   for (FIRSmartReplySuggestion *suggestion in result.suggestions) {
//                                       NSLog(@"Suggested reply: %@", suggestion.text);
//                                       cell.contentLabel.text = [NSString stringWithFormat:@"%@",suggestion.text];
//                                   }
//                               }];
//
//}
//上传消息
-(void)dealloc {
    [super dealloc];
    _ref = [[FIRDatabase database] reference];
    [[_ref child:@"messages"] removeObserverWithHandle:_refHandle];
}
//设置消息存储位置
- (void)configureDatabase {
    _ref = [[FIRDatabase database] reference];
    // 监听消息
    _refHandle = [[_ref child:@"messages"] observeEventType:FIRDataEventTypeChildAdded withBlock:^(FIRDataSnapshot *snapshot) {
        [_messages addObject:snapshot];
        [_table insertRowsAtIndexPaths:@[[NSIndexPath indexPathForRow:_messages.count-1 inSection:0]] withRowAnimation: UITableViewRowAnimationAutomatic];
    }];

}
//设置storage
- (void)configureStorage {
    self.storageRef = [[FIRStorage storage] referenceForURL:@"gs://chat-56f7e.appspot.com/"];
}
//发送文字消息
- (IBAction)didSendMessage:(UIButton *)sender {
    [self textFieldShouldReturn:_textField textId:self.userId];
}
//设置消息代理
- (BOOL)textFieldShouldReturn:(UITextField *)textField textId:(NSString*) userId {
    [self sendMessage:@{MessageFieldstext: textField.text,textId:userId}];
    textField.text = @"";
    [self.view endEditing:YES];
    return YES;
}
//本地通知
- (void)addInteractionLocalNotification{
    
    UNTextInputNotificationAction *action1 = [UNTextInputNotificationAction actionWithIdentifier:@"replyAction" title:@"文字回复" options:UNNotificationActionOptionNone];
    UNNotificationAction *action2 = [UNNotificationAction actionWithIdentifier:@"enterAction" title:@"进入应用" options:UNNotificationActionOptionForeground];
    
    UNNotificationAction *action3 = [UNNotificationAction actionWithIdentifier:@"cancelAction" title:@"取消" options:UNNotificationActionOptionDestructive];
    UNNotificationCategory *categroy = [UNNotificationCategory categoryWithIdentifier:@"Categroy" actions:@[action1,action2,action3] intentIdentifiers:@[] options:UNNotificationCategoryOptionCustomDismissAction];
    
    [[UNUserNotificationCenter currentNotificationCenter] setNotificationCategories:[NSSet setWithObject:categroy]];
    [[UNUserNotificationCenter currentNotificationCenter] setDelegate:self];
    self.notiContent.categoryIdentifier = @"Categroy";
    
    [self regiterLocalNotification:self.notiContent];
    
}
-(void) addImageLocalNotification {
    
    NSString *imageFile = [[NSBundle mainBundle] pathForResource:@"sport" ofType:@"png"];
    
    UNNotificationAttachment *imageAttachment = [UNNotificationAttachment attachmentWithIdentifier:@"iamgeAttachment" URL:[NSURL fileURLWithPath:imageFile] options:nil error:nil];
    self.notiContent.attachments = @[imageAttachment];

}
//设置通知消息内容
- (void)regiterLocalNotification:(UNMutableNotificationContent *)content{
    
    content.title = @"消息通知";
    content.body =self.textField.text;
    [self addImageLocalNotification];

    content.badge = @1;
    UNNotificationSound *sound = [UNNotificationSound defaultSound];
    content.sound = sound;
    
    //重复提醒，时间间隔要大于60s
    UNTimeIntervalNotificationTrigger *trigger1 = [UNTimeIntervalNotificationTrigger triggerWithTimeInterval:5 repeats:NO];
    NSString *requertIdentifier = @"RequestIdentifier";
    UNNotificationRequest *request = [UNNotificationRequest requestWithIdentifier:requertIdentifier content:content trigger:trigger1];
    [[UNUserNotificationCenter currentNotificationCenter] addNotificationRequest:request withCompletionHandler:^(NSError * _Nullable error) {
        NSLog(@"Error:%@",error);
    }];
    
}
//显示操作内容
- (void)userNotificationCenter:(UNUserNotificationCenter *)center didReceiveNotificationResponse:(UNNotificationResponse *)response withCompletionHandler:(void (^)())completionHandler{
    
    NSString *categoryIdentifier = response.notification.request.content.categoryIdentifier;
    NSLog(@"收到通知：%@",response.notification.request.content);
    
    if ([categoryIdentifier isEqualToString:@"Categroy"]) {
        //识别需要被处理的拓展
        if ([response.actionIdentifier isEqualToString:@"replyAction"]){
            //识别用户点击的是哪个 action
            _textResponse = (UNTextInputNotificationResponse*)response;
            //获取输入内容
            NSString *userText = _textResponse.userText;
            //发送 userText 给需要接收的方法
            NSLog(@"要发送的内容是：%@",userText);
            //[ClassName handleUserText: userText];
        }else if([response.actionIdentifier isEqualToString:@"enterAction"]){
            NSLog(@"点击了进入应用按钮");
        }else{
            NSLog(@"点击了取消");
        }
        
    }
    completionHandler();
}
//只有当前处于前台才会走，加上返回方法，使在前台显示信息
- (void)userNotificationCenter:(UNUserNotificationCenter *)center willPresentNotification:(UNNotification *)notification withCompletionHandler:(void (^)(UNNotificationPresentationOptions))completionHandler{
    
    NSLog(@"执行willPresentNotificaiton");
    completionHandler(UNNotificationPresentationOptionBadge|
                      UNNotificationPresentationOptionSound|
                      UNNotificationPresentationOptionAlert);
}

//发送消息内容
- (void)sendMessage:(NSDictionary *)data {
    NSMutableDictionary *mdata = [data mutableCopy];
    mdata[MessageFieldsname] = [FIRAuth auth].currentUser.displayName;
    mdata[textId]=[FIRAuth auth].currentUser.uid;
    NSURL *photoURL = [FIRAuth auth].currentUser.photoURL;
    if (photoURL) {
        mdata[MessageFieldsphotoURL] = [photoURL absoluteString];
    }
    // 向firebase数据库添加数据
    _ref=[[FIRDatabase database] reference];
    [[[_ref child:@"messages"] childByAutoId] setValue:mdata];
    //通知
    [self addInteractionLocalNotification];
 }
//消息长度变换
- (BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(nonnull NSString *)string {
    NSString *text = _textField.text;
    if (!text) {
        return YES;
    }
    long newLength = text.length + string.length - range.length;
    return (newLength <= _msglength);
}
//计算数据列表当中数据数量
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return _messages.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(nonnull NSIndexPath *)indexPath {
    //从firebase数据库当中回调数据
    FIRDataSnapshot *dic=_messages[indexPath.row];
    NSDictionary<NSString *, NSString *> *message=dic.value;
    NSString *imageURL=message[MessageFieldsimageURL];
    NSString *text=message[MessageFieldstext];
    if(imageURL){
        _table.rowHeight=200;
    }
    else{
        _table.rowHeight=100;
    }
if (indexPath.row%2==0)  {
    //我方信息显示
    MeTableViewCell *cell=[_table dequeueReusableCellWithIdentifier:NSStringFromClass([MeTableViewCell class])];
    if (imageURL) {
       
        if ([imageURL hasPrefix:@"gs://"]) {
            [[[FIRStorage storage] referenceForURL:imageURL] dataWithMaxSize:INT64_MAX
                                                                  completion:^(NSData *data, NSError *error) {
                                                                      if (error) {
                                                                          NSLog(@"Error downloading: %@", error);
                                                                          return;
                                                                      }
                                                                      dispatch_async(dispatch_get_main_queue(), ^{
                                                                          cell.bgImageView.image = [UIImage imageWithData:data];
                                                                          [cell setNeedsLayout];
                                                                      });
                                                                  }];
        } else {
            cell.bgImageView.image = [UIImage imageWithData:[NSData dataWithContentsOfURL:[NSURL URLWithString:imageURL]]];
            _image=[UIImage imageWithData:[NSData dataWithContentsOfURL:[NSURL URLWithString:imageURL]]];
        }
    }
    else {
        cell.contentLabel.text = [NSString stringWithFormat:@"%@",text];
        NSString *photoURL = message[MessageFieldsphotoURL];
        if (photoURL) {
            NSURL *URL = [NSURL URLWithString:photoURL];
            if (URL) {
                NSData *data = [NSData dataWithContentsOfURL:URL];
                if (data) {
                    cell.bgImageView.image= [UIImage imageWithData:data];
                }
            }
        }
      }
        return cell;
    }
else{
        //请求dialogflow实现智能回复
        OtherTableViewCell *cell=[_table dequeueReusableCellWithIdentifier:NSStringFromClass([OtherTableViewCell class])];
        //请求dialogflow实现智能回复
        ApiAI* apiai=[ApiAI sharedApiAI];;
        AppDelegate * appDelegate = (AppDelegate*)[UIApplication sharedApplication].delegate;
        apiai=appDelegate.apiai;
        _textRequest=[apiai textRequest];
        _textRequest.query=MessageFieldstext;
        [apiai enqueue:_textRequest];
        [_textRequest setMappedCompletionBlockSuccess:^(AIRequest *request, AIResponse* response) {
            AIResponseResult *textResponse;
            if(textResponse=response.result.fulfillment.speech)
            {
                _responseMsg=textResponse;
                cell.contentLabel.text= [NSString stringWithFormat:@"%@",_responseMsg];
            }
        } failure:^(AIRequest *request, NSError *error) {
            NSLog(@"无法响应,错误为：%@",error);
        }];
        return cell;
    }
}
//选择图片发送
- (IBAction)didTapAddPhoto:(id)sender {
    UIImagePickerController * picker = [[UIImagePickerController alloc] init];
    picker.delegate = self;
    if ([UIImagePickerController isSourceTypeAvailable:UIImagePickerControllerSourceTypeCamera]) {
        picker.sourceType = UIImagePickerControllerSourceTypeCamera;
    } else {
        picker.sourceType = UIImagePickerControllerSourceTypePhotoLibrary;
    }
    [self presentViewController:picker animated:YES completion:NULL];
}
//定义图片选择控制器
- (void)imagePickerController:(UIImagePickerController *)picker
didFinishPickingMediaWithInfo:(NSDictionary *)info {
    [picker dismissViewControllerAnimated:YES completion:NULL];
    
    NSURL *referenceURL = info[UIImagePickerControllerReferenceURL];
    // if it's a photo from the library, not an image from the camera
    if (referenceURL) {
        PHFetchResult* assets = [PHAsset fetchAssetsWithALAssetURLs:@[referenceURL] options:nil];
        PHAsset *asset = assets.firstObject;
        [asset requestContentEditingInputWithOptions:nil
                                   completionHandler:^(PHContentEditingInput *contentEditingInput, NSDictionary *info) {
                                       NSURL *imageFile = contentEditingInput.fullSizeImageURL;
                                       NSString *filePath = [NSString stringWithFormat:@"%@/%lld/%@",
                                                             [FIRAuth auth].currentUser.uid,
                                                             (long long)([NSDate date].timeIntervalSince1970 * 1000.0),
                                                             referenceURL.lastPathComponent];
                                       [[_storageRef child:filePath]
                                        putFile:imageFile metadata:nil
                                        completion:^(FIRStorageMetadata *metadata, NSError *error) {
                                            if (error) {
                                                NSLog(@"Error uploading: %@", error);
                                                return;
                                            }
                                            [self sendMessage:@{MessageFieldsimageURL:[_storageRef child:metadata.path].description,textId:_userId}];
                                        }
                                        ];
                                   }];
    } else {
        UIImage *image = info[UIImagePickerControllerOriginalImage];
        NSData *imageData = UIImageJPEGRepresentation(image, 0.8);
        NSString *imagePath =
        [NSString stringWithFormat:@"%@/%lld.jpg",
         [FIRAuth auth].currentUser.uid,
         (long long)([NSDate date].timeIntervalSince1970 * 1000.0)];
        FIRStorageMetadata *metadata = [FIRStorageMetadata new];
        metadata.contentType = @"image/jpeg";
        [[_storageRef child:imagePath] putData:imageData metadata:metadata
                                    completion:^(FIRStorageMetadata * _Nullable metadata, NSError * _Nullable error) {
                                        if (error) {
                                            NSLog(@"Error uploading: %@", error);
                                            return;
                                        }
                                        [self sendMessage:@{MessageFieldsimageURL:[_storageRef child:metadata.path].description,textId:_userId}];
                                    }];
    }
}
//选择图片完成以后进行返回
- (void)imagePickerControllerDidCancel:(UIImagePickerController *)picker {
    [picker dismissViewControllerAnimated:YES completion:NULL];
}

@end
