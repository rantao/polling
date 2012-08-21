//
//  AppDelegate.m
//  polling
//
//  Created by Maneesh Goel on 8/17/12.
//  Copyright (c) 2012 Maneesh Goel. All rights reserved.
//

#import "AppDelegate.h"

@implementation AppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    [PFUser enableAutomaticUser];
    [[PFUser currentUser] saveInBackground];
    [Parse setApplicationId:@"rMPgN5PDNKXoOlhRmR3bmwldfTyBgXvzgmxACBKh"
                  clientKey:@"iD5pVTkjFHFbptO6ubB38k00YeFLNCWJHychs7fg"];
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    UITabBarController *pollingViewController = [UITabBarController new];
    CreatePollViewController *cpvc = [[CreatePollViewController alloc] init];
    VotePollTableViewController *vptvc = [[VotePollTableViewController alloc] init];
    UINavigationController *votingNavigationController = [[UINavigationController alloc] initWithRootViewController:vptvc];
    PollResultsTableViewController *prtvc = [[PollResultsTableViewController alloc] init];
    UINavigationController *pollResultsNavigationController = [[UINavigationController alloc] initWithRootViewController:prtvc];
    cpvc.title = @"Create Poll!";
    vptvc.title = @"Vote!";
    prtvc.title = @"Results!";
    NSArray *viewControllers = [NSArray arrayWithObjects:cpvc, votingNavigationController, pollResultsNavigationController, nil];
    [pollingViewController setViewControllers:viewControllers];
    self.window.rootViewController = pollingViewController;
    self.window.backgroundColor = [UIColor whiteColor];
    [self.window makeKeyAndVisible];
    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application
{
}

- (void)applicationDidEnterBackground:(UIApplication *)application
{
}

- (void)applicationWillEnterForeground:(UIApplication *)application
{
}

- (void)applicationDidBecomeActive:(UIApplication *)application
{
}

- (void)applicationWillTerminate:(UIApplication *)application
{
}

@end
