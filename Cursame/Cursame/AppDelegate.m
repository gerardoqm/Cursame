//
//  AppDelegate.m
//  Cursame
//
//  Created by Gerardo Quintanar Morales on 2/10/14.
//  Copyright (c) 2014 Gerardo Quintanar Morales. All rights reserved.
//

#import "AppDelegate.h"

// How to apply color formatting to your log statements:
//
// To set the foreground color:
// Insert the ESCAPE into your string, followed by "fg124,12,255;" where r=124, g=12, b=255.
//
// To set the background color:
// Insert the ESCAPE into your string, followed by "bg12,24,36;" where r=12, g=24, b=36.
//
// To reset the foreground color (to default value):
// Insert the ESCAPE into your string, followed by "fg;"
//
// To reset the background color (to default value):
// Insert the ESCAPE into your string, followed by "bg;"
//
// To reset the foreground and background color (to default values) in one operation:
// Insert the ESCAPE into your string, followed by ";"

#define XCODE_COLORS_ESCAPE @"\033["

#define XCODE_COLORS_RESET_FG  XCODE_COLORS_ESCAPE @"fg;" // Clear any foreground color
#define XCODE_COLORS_RESET_BG  XCODE_COLORS_ESCAPE @"bg;" // Clear any background color
#define XCODE_COLORS_RESET     XCODE_COLORS_ESCAPE @";"   // Clear any foreground or background color


#define LogBlue(frmt, ...) NSLog((XCODE_COLORS_ESCAPE @"fg0,0,255;" frmt XCODE_COLORS_RESET), ##__VA_ARGS__)
#define LogRed(frmt, ...) NSLog((XCODE_COLORS_ESCAPE @"fg255,0,0;" frmt XCODE_COLORS_RESET), ##__VA_ARGS__)


@implementation AppDelegate


@synthesize cursameResponse=_cursameResponse;
@synthesize publicationsFeed=_publicationsFeed;
@synthesize eventsFeed=_eventsFeed;



- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    cursameResponse =[[CursameResponse alloc]init];
    publicationsFeed =[[NSMutableArray alloc]init];
    eventsFeed =[[NSMutableArray alloc]init];

    UIStoryboard *mainStoryboard = [UIStoryboard storyboardWithName:@"MainStoryboard_iPhone"
															 bundle: nil];
	
	MenuViewController *rightMenu = (MenuViewController*)[mainStoryboard
                                                          instantiateViewControllerWithIdentifier: @"MenuViewController"];
	rightMenu.cellIdentifier = @"rightMenuCell";
	
	MenuViewController *leftMenu = (MenuViewController*)[mainStoryboard
                                                         instantiateViewControllerWithIdentifier: @"MenuViewController"];
	leftMenu.cellIdentifier = @"leftMenuCell";
	
	[SlideNavigationController sharedInstance].rightMenu = rightMenu;
	[SlideNavigationController sharedInstance].leftMenu = leftMenu;
	
	// Creating a custom bar button for right menu
	UIButton *button  = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, 30, 30)];
	[button setImage:[UIImage imageNamed:@"menu-button"] forState:UIControlStateNormal];
	[button addTarget:[SlideNavigationController sharedInstance] action:@selector(toggleRightMenu) forControlEvents:UIControlEventTouchUpInside];
	UIBarButtonItem *rightBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:button];
	[SlideNavigationController sharedInstance].rightBarButtonItem = rightBarButtonItem;
	

    LogBlue(@"Algo");
    LogRed(@"ERROR!");
    // Override point for customization after application launch.
    return YES;
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

@end

#pragma mark -
#pragma mark Bypass invalid for server certificate for development
#if( DEBUG==1 )

@implementation NSURLRequest(DataController)
+ (BOOL)allowsAnyHTTPSCertificateForHost:(NSString *)host
{
    return YES;
}
@end
#endif




