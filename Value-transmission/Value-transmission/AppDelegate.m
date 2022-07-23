//
//  AppDelegate.m
//  Value-transmission
//
//  Created by ZJH on 2022/7/23.
//

#import "AppDelegate.h"
#import "ViewController.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    
    
    //设置默认显示界面
    ViewController *controller = [ViewController new];
    
    UINavigationController * naVC = [[UINavigationController alloc]initWithRootViewController:controller];
    self.window = [[UIWindow alloc] initWithFrame:[UIScreen mainScreen].bounds];
    
    self.window.rootViewController = naVC;
    [self.window makeKeyAndVisible];
    
    
    
    return YES;
}




@end
