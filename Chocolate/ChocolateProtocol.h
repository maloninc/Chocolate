//
//  ChocolateProtocol.h
//  
//
//  Created by Hiroyuki Nakamura
//  Copyright 2010 Malon,Inc. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Chocolate.h"

@class CHAppUpdateCheker;
@protocol CHAppUpdateCheckerDelegate

- (void)appUpdateChecker:(CHAppUpdateCheker*)checker didFailCheckWithError:(NSError*)error;

@end
