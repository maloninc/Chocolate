//
//  SampleAppDelegate.h
//  Sample
//
//  Created by Hiroyuki Nakamura
//  Copyright 2010 Malon,Inc. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Chocolate.h"

@class SampleViewController;

/* CHOCOLATE: add updater protocol */
@interface SampleAppDelegate : NSObject <UIApplicationDelegate, CHAppUpdateCheckerDelegate> {
    UIWindow *window;
    SampleViewController *viewController;
	
	/* CHOCOLATE: add update object as a member */
	CHAppUpdateCheker *appUpdater;
}

@property (nonatomic, retain) IBOutlet UIWindow *window;
@property (nonatomic, retain) IBOutlet SampleViewController *viewController;
@property (nonatomic, retain) CHAppUpdateCheker *appUpdater; /* CHOCOLATE: add update object as a property */

@end

