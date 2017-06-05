//
//  AppDelegate.m
//  AnimationTest
//
//  Created by iOS-School-1 on 03.06.17.
//  Copyright © 2017 user. All rights reserved.
//

#import "AppDelegate.h"
#import "ViewController.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    UIWindow *window = [[UIWindow alloc] initWithFrame:UIScreen.mainScreen.bounds];
    
    ViewController *vc = [ViewController new];
    
    window.rootViewController = vc;
    
    self.window = window;
    
    [self.window makeKeyAndVisible];
    
    return YES;

}

@end
