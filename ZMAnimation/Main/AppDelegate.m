//
//  AppDelegate.m
//  ZMAnimation
//
//  Created by 圣光大人 on 2017/7/6.
//  Copyright © 2017年 圣光大人. All rights reserved.
//

#import "AppDelegate.h"
#import "ZMHead.h"
#import <Lottie/Lottie.h>
@interface AppDelegate ()

@end

@implementation AppDelegate

-(void)changeRootController{
    self.window.rootViewController = [[UINavigationController alloc]initWithRootViewController:[VC_Main new]];
    
    [self.window makeKeyAndVisible];
}
-(void)showAnimation{
    LOTAnimationView * v_animation = [LOTAnimationView animationNamed:@"servishero_loading"];
    v_animation.bounds = CGRectMake(0, 0, MainScreen_Width, MainScreen_Width);
    v_animation.center = self.window.center;
    v_animation.animationSpeed = 0.5;
    v_animation.loopAnimation = YES;
    [self.window addSubview:v_animation];
    [v_animation play];
}
- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    
    self.window = [[UIWindow alloc]initWithFrame:[UIScreen mainScreen].bounds];
    
    self.window.rootViewController = [ZMLaunchController new];
    
    [self.window makeKeyAndVisible];

    LOTAnimationView * v_animation = [LOTAnimationView animationNamed:@"servishero_loading"];
    v_animation.bounds = CGRectMake(0, 0, MainScreen_Width, MainScreen_Width);
    v_animation.center = self.window.center;
    v_animation.animationSpeed = 0.5;
    v_animation.loopAnimation = YES;
    [self.window addSubview:v_animation];
    [v_animation play];
    
    [self performSelector:@selector(changeRootController) withObject:nil afterDelay:4];
    
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
