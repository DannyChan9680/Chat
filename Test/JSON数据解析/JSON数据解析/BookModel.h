//
//  BookModel.h
//  JSON数据解析
//
//  Created by Civet on 2019/7/31.
//  Copyright © 2019 yanghao. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN
//书籍的数组模型
@interface BookModel : NSObject

{
    //书籍名称
    NSString *_bookName;
    //书籍出版社名称
    NSString *_publisher;
    //书籍价格
    NSString *_price;
    //作者数组
    NSMutableArray * _authorArray;
}
//
@property (retain,nonatomic) NSString*  mBookName;
@property (retain,nonatomic) NSString*  mPublisher;
@property (retain,nonatomic) NSString*  mPrice;
@property (retain,nonatomic) NSMutableArray * mAuthorArray;
@end

NS_ASSUME_NONNULL_END
