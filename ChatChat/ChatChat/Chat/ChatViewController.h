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
@property (strong, nonatomic) NSMutableArray<FIRDataSnapshot *> *messages;
@property (strong, nonatomic) FIRStorageReference *storageRef;
@property (nonatomic, strong) FIRRemoteConfig *remoteConfig;

@property (weak ,nonatomic) IBOutlet UITextView *outputTextView;
@property(weak, nonatomic) IBOutlet UIPickerView *inputPicker;
@property(weak, nonatomic) IBOutlet UIPickerView *outputPicker;
@property(weak, nonatomic) IBOutlet UITextView *statusTextView;
@property(weak, nonatomic) IBOutlet UIButton *sourceDownloadDeleteButton;
@property(weak, nonatomic) IBOutlet UIButton *targetDownloadDeleteButton;

@property(nonatomic, strong) FIRTranslator *translator;
@property(nonatomic, strong) NSArray<NSNumber *> *allLanguages;


@end
NS_ASSUME_NONNULL_END
