//
//  DefaultInstance.m
//  Value-transmission
//
//  Created by ZJH on 2022/7/23.
//

#import "DefaultInstance.h"

@implementation DefaultInstance

// 通过类方法创建单例对象
+(instancetype)sharedInstance{
    
    static DefaultInstance *sharedVC = nil;
    
    if (sharedVC == nil) {
        sharedVC = [[DefaultInstance alloc] init];
    }
    
    return sharedVC;
}

@end
