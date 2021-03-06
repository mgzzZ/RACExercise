//
//  AppDelegate.m
//  RACExercise
//
//  Created by YPC on 16/11/25.
//  Copyright © 2016年 mgzzZ. All rights reserved.
//

#import "AppDelegate.h"
#import "ViewController.h"
#import "YPCNetworking.h"
@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    
    ViewController *rootVC = [[ViewController alloc]init];
    UINavigationController *rootNav = [[UINavigationController alloc]initWithRootViewController:rootVC];
    self.window.rootViewController = rootNav;
#pragma mark - 本地服务器
    NSString *url = @"https://test.gongchangtemai.com/index.php?url=";
    //    NSString *url = @"http://192.168.1.54/ypcang-api/api/ecapi/index.php?url=";
    //    NSString *url = @"http://192.168.1.56/ypcang-api/api/ecapi/index.php?url=";
    //   NSString *url = @"http://192.168.0.104/ypcang-api/api/ecapi/index.php?url=";
#pragma mark - 外网服务器
    //   NSString *url = @"https://api.gongchangtemai.com/index.php?url=";
#pragma mark - 外网服务器
    [YPCNetworking updateBaseUrl:url];
    [YPCNetworking setTimeout:15.f];
    //    [YPCNetworking enableInterfaceDebug:YES];
    [YPCNetworking obtainDataFromLocalWhenNetworkUnconnected:YES];
    [YPCNetworking cacheGetRequest:YES shoulCachePost:NO];
    
    return YES;
}


- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
}


- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}


- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
}


- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}


- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}


@end
