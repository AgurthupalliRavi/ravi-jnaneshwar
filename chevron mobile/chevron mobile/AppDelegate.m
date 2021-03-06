//
//  AppDelegate.m
//  chevron mobile
//
//  Created by Praveen Reddy Thatiguttla on 6/1/13.
//  Copyright (c) 2013 chevron. All rights reserved.
//

#import "AppDelegate.h"

#import "FirstViewController.h"
#import "InfoViewController.h"
#import "SecondViewController.h"
#import "UserViewController.h"
#import "GlobalSet.h"

@implementation AppDelegate
@synthesize tabBarController;

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
     [GlobalSet sharedInstance].UserData=[[NSMutableArray alloc]initWithObjects:@"Chevron",@"Chevron",@"Chevron Global1",@"Chevron GLobal2", nil];
    [GlobalSet sharedInstance].QueueData=[[NSMutableArray alloc]init];
    
    // Override point for customization after application launch.
    UIViewController *viewController1 = [[FirstViewController alloc] initWithNibName:@"FirstViewController" bundle:nil];
    
    UIViewController *viewController2 = [[UserViewController alloc] initWithNibName:@"UserViewController" bundle:nil];
    
    UIViewController *viewController3 = [[SecondViewController alloc] initWithNibName:@"SecondViewController" bundle:nil];
    
    UIViewController *viewController4 = [[InfoViewController alloc] initWithNibName:@"InfoViewController" bundle:nil];
    
    self.tabBarController = [[UITabBarController alloc] init];
    self.tabBarController.delegate=self;
    self.tabBarController.viewControllers = @[viewController1, viewController2,viewController3,viewController4];
    self.window.rootViewController = self.tabBarController;
    [self.window makeKeyAndVisible];
    return YES;
}
- (void)tabBarController:(UITabBarController *)tabBarController didSelectViewController:(UIViewController *)viewController
{
    if ([viewController.tabBarItem.title isEqualToString:@"User"] || [viewController.tabBarItem.title isEqualToString:@"Queue"])
         {
        UIAlertView *loginalert = [[UIAlertView alloc]
                                   initWithTitle: @"Message"
                                   message: @"Please verify login . . ."
                                   delegate: nil
                                   cancelButtonTitle:@"OK"
                                   otherButtonTitles:nil];
             if(![GlobalSet sharedInstance].loginflag){
                 [loginalert show];
                 self.tabBarController.selectedIndex=0;
             }
    }
    else
    {
        //your code
    }
}


- (void)applicationWillResignActive:(UIApplication *)application
{
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application
{
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later. 
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application
{
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application
{
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application
{
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

/*
// Optional UITabBarControllerDelegate method.
- (void)tabBarController:(UITabBarController *)tabBarController didSelectViewController:(UIViewController *)viewController
{
}
*/

/*
// Optional UITabBarControllerDelegate method.
- (void)tabBarController:(UITabBarController *)tabBarController didEndCustomizingViewControllers:(NSArray *)viewControllers changed:(BOOL)changed
{
}
*/

@end
