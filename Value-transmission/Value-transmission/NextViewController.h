//
//  NextViewController.h
//  Value-transmission
//
//  Created by ZJH on 2022/7/23.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

// 委托方-创建一个协议
@protocol passValueDelegate <NSObject>

// 协议定义一个传值的方法
- (void)passValue:(NSString *)str;

@end
@interface NextViewController : UIViewController
  
@property (nonatomic, strong) NSString *str;

// 定义一个id指针,他持有协议,指针的名字叫delegate
@property (weak)id<passValueDelegate>delegate;

@end

NS_ASSUME_NONNULL_END
