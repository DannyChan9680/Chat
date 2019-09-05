//
//  ChatViewController.h
//  ChatChat
//
//  Created by Civet on 2019/8/26.
//  Copyright © 2019 limeixiang. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Firebase.h"
//#import "Crashlytics.h"
NS_ASSUME_NONNULL_BEGIN
@interface ChatViewController :UIViewController <UITableViewDelegate,UITableViewDataSource,UITextFieldDelegate,UIImagePickerControllerDelegate,UINavigationControllerDelegate
     ,UIPickerViewDelegate,UIPickerViewDataSource,UITextViewDelegate,UIGestureRecognizerDelegate>
{
    int _msglength;
    NSString * _id;
    FIRDatabaseHandle _refHandle;
}
@property(nonatomic, weak) IBOutlet UITextView *textField;
@property(nonatomic, weak) IBOutlet UIButton *sendButton1;
@property(nonatomic, weak) IBOutlet UIButton *sendButton2;
@property(weak ,nonatomic)  UITableView * table;

@property (strong ,nonatomic) NSString * userId;
@property (strong, nonatomic) FIRDatabaseReference *ref;
@property (strong, nonatomic) NSMutableArray<FIRTextMessage *> *messages;
@property (strong, nonatomic) FIRStorageReference *storageRef;
@property (nonatomic, strong) FIRRemoteConfig *remoteConfig;
//智能回复
@property (strong ,nonatomic) FIRSmartReply * smartReply;
@property(strong, nonatomic) UIStackView *smartReplyView;
//翻译
@property(nonatomic, strong) FIRTranslator *translator;
@property(nonatomic, strong) NSArray<NSNumber *> *allLanguages;


@end
NS_ASSUME_NONNULL_END
