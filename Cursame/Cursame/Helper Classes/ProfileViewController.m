//
//  ProfileViewController.m
//  SlideMenu
//
//  Created by Aryan Gh on 4/24/13.
//  Copyright (c) 2013 Aryan Ghassemi. All rights reserved.
//

#import "ProfileViewController.h"
#import "CursameUser.h"

@implementation ProfileViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    appDelegate = [[UIApplication sharedApplication] delegate];
}

- (void) viewWillAppear:(BOOL)animated
{
    nameLabel.text = (appDelegate.cursameResponse.user.firstName)?  appDelegate.cursameResponse.user.firstName : @"";
    lastNameLabel.text = (appDelegate.cursameResponse.user.lastName)?  appDelegate.cursameResponse.user.lastName : @"";
    emailLabel.text = (appDelegate.cursameResponse.user.email)?  appDelegate.cursameResponse.user.email : @"";
    bioLabel.text = (appDelegate.cursameResponse.user.bios)?  appDelegate.cursameResponse.user.bios : @"";
    twitterLabel.text = (appDelegate.cursameResponse.user.twitterLink)?  appDelegate.cursameResponse.user.twitterLink : @"";

    //appDelegate.cursameResponse.user.userDescription;
}

#pragma mark - SlideNavigationController Methods -

- (BOOL)slideNavigationControllerShouldDisplayLeftMenu
{
	return YES;
}

- (BOOL)slideNavigationControllerShouldDisplayRightMenu
{
	return YES;
}
#pragma mark - User changes Methods -

-(IBAction)changePictureProfile:(id)sender
{
    
}

-(IBAction)changePictureProfileCamera:(id)sender
{
    
}

-(IBAction)changePictureBackground:(id)sender
{
    
}

-(IBAction)changePictureBackgroundCamera:(id)sender
{
    
}

-(IBAction)sendChanges:(id)sender
{
    
}


@end
