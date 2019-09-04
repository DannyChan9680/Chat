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
@import FirebaseMLNLSmartReply;
@import Photos;
@import FirebaseMLCommon;

@implementation ChatViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    _msglength = 10;
    _messages = [[NSMutableArray alloc] init];
    
    //设置表单信息
    _table=[[UITableView alloc] initWithFrame:CGRectMake(0, 0, 430, 820)];
    _table.separatorColor=[UIColor clearColor];
    _table.delegate=self;
    _table.dataSource=self;

    _sendButton1= [UIButton buttonWithType:UIButtonTypeRoundedRect];
    _sendButton1.frame=CGRectMake(10, 820, 50, 50);
    _sendButton1.backgroundColor=[UIColor greenColor];
    [_sendButton1 setTitle:@"图片" forState:UIControlStateNormal];
    [_sendButton1 addTarget:self action:@selector(didTapAddPhoto:) forControlEvents:UIControlEventTouchUpInside];
    
    _textField=[[UITextView alloc] initWithFrame:CGRectMake(70, 820, 280, 50)];
    _textField.tintColor=[UIColor grayColor];
    _textField.layer.backgroundColor=[[UIColor clearColor] CGColor];
    _textField.layer.borderColor=[[UIColor grayColor] CGColor];
    _textField.layer.borderWidth=1.0;
    [_textField.layer setMasksToBounds:YES];
    
    _sendButton2= [UIButton buttonWithType:UIButtonTypeRoundedRect];
    _sendButton2.frame=CGRectMake(360, 820, 50, 50);
    _sendButton2.backgroundColor=[UIColor greenColor];
    [_sendButton2 setTitle:@"发送" forState:UIControlStateNormal];
    [_sendButton2 addTarget:self action:@selector(didSendMessage:) forControlEvents:UIControlEventTouchUpInside];
    
    
    [self.view addSubview:_sendButton1];
    [self.view addSubview:_sendButton2];
    [self.view addSubview:_textField];
    
    
    self.title=self.userId;
    
    self.view.backgroundColor=[UIColor whiteColor];
    [self.view addSubview:_table];
    [_table registerClass:[MeTableViewCell class] forCellReuseIdentifier:NSStringFromClass([MeTableViewCell class])];
    [_table registerClass:[OtherTableViewCell class] forCellReuseIdentifier:NSStringFromClass([OtherTableViewCell class])];
    
    
    //方法调用
    [self configureDatabase];
    [self configureStorage];
    [self fetchConfig];
   // [self smartReply];
    [_table reloadData];
    
   // [self smartReply];
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
          //  [_remoteConfig activateFetched];
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
//智能回复
-(void) smartReply{
    _messages = [NSMutableArray array];
    FIRTextMessage *message = [[FIRTextMessage alloc]
                               initWithText:@"How are you?"
                               timestamp:[NSDate date].timeIntervalSince1970
                               userID:_userId
                               isLocalUser:YES];
    [_messages addObject:message];    FIRNaturalLanguage *naturalLanguage = [FIRNaturalLanguage naturalLanguage];
    FIRSmartReply *smartReply = [naturalLanguage smartReply];
    [smartReply suggestRepliesForMessages:_textField.text
                               completion:^(FIRSmartReplySuggestionResult * _Nullable result,
                                            NSError * _Nullable error) {
                                   if (error || !result) {
                                       return;
                                   }
                                   if (result.status == FIRSmartReplyResultStatusNotSupportedLanguage) {
                                       NSLog(@"The language is not supported !");
                                   } else if (result.status == FIRSmartReplyResultStatusSuccess) {
                                       NSLog(@"I am fine!");
                                   }
                               }];
}
/*文本翻译*/
// 长按操作
-(void)handleLongPress:(UILongPressGestureRecognizer *)gesture
{
    if(gesture.state == UIGestureRecognizerStateBegan)
    {
        CGPoint point = [gesture locationInView:_table];
        NSIndexPath * indexPath = [_table indexPathForRowAtPoint:point];
        NSLog(@"%ld" ,indexPath.section);
    }
    if(gesture.state==UIGestureRecognizerStateEnded)
    {
        UIAlertView * alert=[[UIAlertView alloc] initWithTitle:@"翻译" message:nil delegate:self cancelButtonTitle:@"返回" otherButtonTitles:@"确定", nil];
        [alert show];
    }
    
//    //获得当前手势触发的在UITableView中的坐标
//    CGPoint location = [gesture locationInView:_table];
//    //获得当前坐标对应的indexPath
//    NSIndexPath *indexPath = [_table indexPathForRowAtPoint:location];
//
//    if (indexPath) {
//        //通过indexpath获得对应的Cell
//       MeTableViewCell *cell = [_table cellForRowAtIndexPath:indexPath];
//        //获得添加到cell.contentView中的UILabel
//        UILabel *label = nil;
//        for (UIView *view in cell.contentView.subviews) {
//            if ([view isKindOfClass:[cell.bgImageView class]]) {
//                if([view isKindOfClass:[cell.contentLabel class]]){
//                    label=(UILabel *)view;
//                }
//            }
//        }
//
//        //获得当前手势点击在UILabe中的坐标
//        CGPoint p = [gesture locationInView:label];
//        //看看手势点的坐标是不是在UILabel中
//        if (CGRectContainsPoint(label.frame, p)) {
//            NSLog(@"label text : %@", label.text);
//        }
//    }
}

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
    [self textFieldShouldReturn:_textField];
}
//设置消息代理
- (BOOL)textFieldShouldReturn:(UITextField *)textField {
    [self sendMessage:@{MessageFieldstext: textField.text}];
    textField.text = @"";
    [self.view endEditing:YES];
    return YES;
}
//发送消息内容
- (void)sendMessage:(NSDictionary *)data {
    NSMutableDictionary *mdata = [data mutableCopy];
    mdata[MessageFieldsname] = [FIRAuth auth].currentUser.displayName;
    NSURL *photoURL = [FIRAuth auth].currentUser.photoURL;
    if (photoURL) {
        mdata[MessageFieldsphotoURL] = [photoURL absoluteString];
    }
    // 向firebase数据库添加数据
    _ref=[[FIRDatabase database] reference];
    [[[_ref child:@"messages"] childByAutoId] setValue:mdata];
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
    NSString * id=nil;
    //我方信息显示
   if(id==self.userId)
   {
    MeTableViewCell *cell=[_table dequeueReusableCellWithIdentifier:NSStringFromClass([MeTableViewCell class])];
    FIRDataSnapshot *dic = _messages[indexPath.row];
    NSDictionary<NSString *, NSString *> *message = dic.value;
    NSString *imageURL = message[MessageFieldsimageURL];
    if (imageURL) {
        if ([imageURL hasPrefix:@"gs://"]) {
            [[[FIRStorage storage] referenceForURL:imageURL] dataWithMaxSize:INT64_MAX
                                                                  completion:^(NSData *data, NSError *error) {
                                                                      if (error) {
                                                                          NSLog(@"Error downloading: %@", error);
                                                                          return;
                                                                      }
                                                                      dispatch_async(dispatch_get_main_queue(), ^{
                                                                          cell.imageView.image = [UIImage imageWithData:data];
                                                                          [cell setNeedsLayout];
                                                                      });
                                                                  }];
        } else {
            cell.imageView.image = [UIImage imageWithData:[NSData dataWithContentsOfURL:[NSURL URLWithString:imageURL]]];
        }
    } else {
        NSString *text = message[MessageFieldstext];
        cell.contentLabel.text = [NSString stringWithFormat:@"%@",text];
        NSString *photoURL = message[MessageFieldsphotoURL];
        if (photoURL) {
            NSURL *URL = [NSURL URLWithString:photoURL];
            if (URL) {
                NSData *data = [NSData dataWithContentsOfURL:URL];
                if (data) {
                    cell.imageView.image = [UIImage imageWithData:data];
                }
            }
        }
    }
       //设置长按手势
       UILongPressGestureRecognizer *longPress=[[UILongPressGestureRecognizer alloc] initWithTarget:self action:@selector(handleLongPress:)];
       longPress.delegate=self;
       longPress.minimumPressDuration=1.0;
       [cell.contentView addGestureRecognizer:longPress];
       [longPress release];
    return cell;
   }
    //另一方回复信息显示
   else{
       OtherTableViewCell *cell=[_table dequeueReusableCellWithIdentifier:NSStringFromClass([OtherTableViewCell class])];
       FIRDataSnapshot *dic = _messages[indexPath.row];
       NSDictionary<NSString *, NSString *> *message = dic.value;
           NSString *text = message[MessageFieldstext];
           cell.contentLabel.text = [NSString stringWithFormat:@"%@",text];
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
                                            [self sendMessage:@{MessageFieldsimageURL:[_storageRef child:metadata.path].description}];
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
                                        [self sendMessage:@{MessageFieldsimageURL:[_storageRef child:metadata.path].description}];
                                    }];
    }
}
//选择图片完成以后进行返回
- (void)imagePickerControllerDidCancel:(UIImagePickerController *)picker {
    [picker dismissViewControllerAnimated:YES completion:NULL];
}

@end
