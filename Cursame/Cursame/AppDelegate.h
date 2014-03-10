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

@interface AppDelegate : UIResponder <UIApplicationDelegate>
{
    CursameResponse *cursameResponse;
    NSMutableArray *publicationsFeed;

}

@property (strong, nonatomic) UIWindow *window;
@property (strong, nonatomic) CursameResponse *cursameResponse;
@property (strong, nonatomic) NSMutableArray *publicationsFeed;

@end
