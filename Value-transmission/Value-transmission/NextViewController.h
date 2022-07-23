//
//  NextViewController.h
//  Value-transmission
//
//  Created by ZJH on 2022/7/23.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN


@interface NextViewController : UIViewController
  
@property (nonatomic, strong) NSString *str;

//定义一个block进行页面反向传值
// void:返回类型
// block:block的名字
// NSString *:block的参数
@property (copy) void (^block)(NSString *);


@end

NS_ASSUME_NONNULL_END
