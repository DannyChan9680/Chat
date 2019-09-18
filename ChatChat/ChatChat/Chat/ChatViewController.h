//
//  ChatViewController.h
//  ChatChat
//
//  Created by Civet on 2019/8/26.
//  Copyright © 2019 limeixiang. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Firebase.h"
#import "ApiAI.h"
//#import "Crashlytics.h"
NS_ASSUME_NONNULL_BEGIN
@interface ChatViewController :UIViewController <UITableViewDelegate,UITableViewDataSource,UITextFieldDelegate,UIImagePickerControllerDelegate,UINavigationControllerDelegate
,UIPickerViewDelegate,UIPickerViewDataSource,UITextViewDelegate,UIGestureRecognizerDelegate,UNUserNotificationCenterDelegate>
{
    int _msglength;
    NSString * _id;
    FIRDatabaseHandle _refHandle;
}
@property(nonatomic ,weak) UIImage * image;
@property(nonatomic, weak) UITextView *textField;
@property(nonatomic, weak)  UIButton *sendButton1;
@property(nonatomic, weak)  UIButton *sendButton2;
@property(weak ,nonatomic)  UITableView * table;

@property (strong ,nonatomic) NSString * userId;
@property (strong, nonatomic) FIRDatabaseReference *ref;
@property (strong, nonatomic) NSMutableArray<FIRTextMessage *> *messages;
@property (strong, nonatomic) FIRStorageReference *storageRef;
@property (nonatomic, strong) FIRRemoteConfig *remoteConfig;
@property (strong ,nonatomic) AITextRequest * textRequest;
@property (strong ,nonatomic) ApiAI * apiai;
@property (strong ,nonatomic) AIResponseResult * responseMsg;
//智能回复
//@property (strong ,nonatomic) FIRSmartReply * smartReply;
//翻译
//@property(nonatomic, strong) FIRTranslator *translator;
//@property(nonatomic, strong) NSArray<NSNumber *> *allLanguages;
//通知
@property (nonatomic, strong) UNMutableNotificationContent *notiContent;
//通知回复内容
@property(nonatomic, strong)UNTextInputNotificationResponse* textResponse;
@end
NS_ASSUME_NONNULL_END
