//
//  DefaultInstance.h
//  单例类
//
//  Created by ZJH on 2022/7/23.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface DefaultInstance : NSObject

+(instancetype)sharedInstance;

@property (nonatomic, strong) NSString *str;

@end

NS_ASSUME_NONNULL_END
