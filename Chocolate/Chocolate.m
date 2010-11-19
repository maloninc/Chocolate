//
//  Chocolate.m
//  
//
//  Created by Hiroyuki Nakamura
//  Copyright 2010 Malon,Inc. All rights reserved.
//

#import "Chocolate.h"


@implementation CHAppUpdateCheker

@synthesize delegate;

- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex {
	NSURL *url  = [NSURL URLWithString:[NSString stringWithFormat:@"itms-services://?action=download-manifest&url=%@",plist_url]];
	[[UIApplication sharedApplication] openURL:url];

	if (forceUpdate) {
		exit(0);
	}
}


- (void)checkUpdateWithURLString:(NSString*)url message:(NSString*)updateMsg forceUpdate:(BOOL)flag{
	plist_url = url;
	forceUpdate = flag;
	NSString *currentVer = [[[NSBundle mainBundle] infoDictionary] objectForKey:@"CFBundleVersion"];
	NSMutableDictionary *plist = [NSDictionary dictionaryWithContentsOfURL:[NSURL URLWithString:plist_url]];
	
	if (plist != nil) {
		NSArray *array = [plist objectForKey:@"items"];
		NSDictionary *dict = [[array objectAtIndex:0] objectForKey:@"metadata"];
		NSString *newVer = [dict objectForKey:@"bundle-version"];
		
		if([newVer compare:currentVer] == NSOrderedDescending){
			if(updateMsg) {
				UIAlertView *alert = [[UIAlertView alloc] initWithTitle:nil message:updateMsg 
															   delegate:self 
													  cancelButtonTitle:@"OK" 
													  otherButtonTitles:nil];
				[alert show];
				[alert release];
			}else {
				[self alertView:nil clickedButtonAtIndex:0];
			}

		}
	}else {
		NSString *errMsg = [NSString stringWithFormat:@"ERROR : can't access %@", plist_url];
		NSDictionary *dict = [NSDictionary dictionaryWithObject:errMsg forKey:@"msg"];
		NSError* error = [NSError errorWithDomain:@"Chocolate" code:-1 userInfo:dict];
		NSLog(@"%@", errMsg);
		
		if([delegate respondsToSelector:@selector(appUpdateChecker:didFailCheckWithError:)]) {
			[delegate appUpdateChecker:self didFailCheckWithError: error];
		}
	}
}
@end


