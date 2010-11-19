//
//  Chocolate.h
//  
//
//  Created by Hiroyuki Nakamura
//  Copyright 2010 Malon,Inc. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ChocolateProtocol.h"

@interface CHAppUpdateCheker : NSObject{
	id <CHAppUpdateCheckerDelegate, UIAlertViewDelegate> delegate;
	NSString *plist_url;
	BOOL forceUpdate;
}

@property (nonatomic, retain) id<CHAppUpdateCheckerDelegate> delegate;
- (void)checkUpdateWithURLString:(NSString*)url message:(NSString*)updateMsg forceUpdate:(BOOL)flag;

@end

