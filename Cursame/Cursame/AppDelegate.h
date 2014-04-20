//
//  AppDelegate.h
//  Cursame
//
//  Created by Gerardo Quintanar Morales on 2/10/14.
//  Copyright (c) 2014 Gerardo Quintanar Morales. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SlideNavigationController.h"
#import "MenuViewController.h"
#import "CursameResponse.h"
#import "Publications.h"
#import "CursameEvents.h"
#import <MBProgressHUD.h>

@interface AppDelegate : UIResponder <UIApplicationDelegate, MBProgressHUDDelegate>
{
    CursameResponse *cursameResponse;
    NSMutableArray *publicationsFeed;
    NSMutableArray *eventsFeed;
    

}

@property (strong, nonatomic) UIWindow *window;
@property (strong, nonatomic) CursameResponse *cursameResponse;
@property (strong, nonatomic) NSMutableArray *publicationsFeed;
@property (strong, nonatomic) NSMutableArray *eventsFeed;
@property (strong, nonatomic) NSMutableDictionary *mainFeed;

- (MBProgressHUD *)showGlobalProgressHUDWithTitle:(NSString *)title;
- (void)dismissGlobalHUD;
- (void)dismissGlobalHUDWithDelay:(float)delay;

@end
