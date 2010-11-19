//
//  SampleAppDelegate.m
//  Sample
//
//  Created by Hiroyuki Nakamura
//  Copyright 2010 Malon,Inc. All rights reserved.
//

#import "SampleAppDelegate.h"
#import "SampleViewController.h"

@implementation SampleAppDelegate

@synthesize window;
@synthesize viewController;
@synthesize appUpdater; /* CHOCOLATE: declare update object */


#pragma mark AppUpdater

/* CHOCOLATE: define update method */
- (void)checkUpdate {
	[appUpdater checkUpdateWithURLString:@"http://onimaru.local/apps/sample.plist"	// URL to manifest file
								 message:@"Update is found"							// Message when update is found
							 forceUpdate:NO];										// YES means to quit when update is found
}

/* CHOCOLATE: define error handler for updater */
- (void)appUpdateChecker:(CHAppUpdateCheker*)checker didFailCheckWithError:(NSError*)error {
	UIAlertView *alert = [[UIAlertView alloc] initWithTitle:nil message:[[error userInfo] objectForKey:@"msg"] 
												   delegate:nil 
										  cancelButtonTitle:@"OK" 
										  otherButtonTitles:nil];
	[alert show];
	[alert release];
	
}


#pragma mark -
#pragma mark Application lifecycle

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {    
    
    // Override point for customization after application launch.

    // Add the view controller's view to the window and display.
    [window addSubview:viewController.view];
    [window makeKeyAndVisible];

	/* CHOCOLATE: create updater object and check update */
	appUpdater = [[CHAppUpdateCheker alloc] init];
	appUpdater.delegate = self;
	[self checkUpdate];

    return YES;
}


- (void)applicationWillResignActive:(UIApplication *)application {
    /*
     Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
     Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
     */
}


- (void)applicationDidEnterBackground:(UIApplication *)application {
    /*
     Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later. 
     If your application supports background execution, called instead of applicationWillTerminate: when the user quits.
     */
}


- (void)applicationWillEnterForeground:(UIApplication *)application {
    /*
     Called as part of  transition from the background to the inactive state: here you can undo many of the changes made on entering the background.
     */

	/* CHOCOLATE: check update */
	[self checkUpdate];
}


- (void)applicationDidBecomeActive:(UIApplication *)application {
    /*
     Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
     */
}


- (void)applicationWillTerminate:(UIApplication *)application {
    /*
     Called when the application is about to terminate.
     See also applicationDidEnterBackground:.
     */
}


#pragma mark -
#pragma mark Memory management

- (void)applicationDidReceiveMemoryWarning:(UIApplication *)application {
    /*
     Free up as much memory as possible by purging cached data objects that can be recreated (or reloaded from disk) later.
     */
}


- (void)dealloc {
    [viewController release];
    [window release];
    [super dealloc];
}


@end
