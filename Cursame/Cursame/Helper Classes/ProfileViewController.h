//
//  ProfileViewController.h
//  SlideMenu
//
//  Created by Aryan Gh on 4/24/13.
//  Copyright (c) 2013 Aryan Ghassemi. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SlideNavigationController.h"
#import "AppDelegate.h"

@interface ProfileViewController : UIViewController <SlideNavigationControllerDelegate>
{
    AppDelegate *appDelegate;
    IBOutlet UILabel *emailLabel;
    IBOutlet UILabel *nameLabel;
    IBOutlet UILabel *lastNameLabel;
    IBOutlet UILabel *bioLabel;
    IBOutlet UILabel *twitterLabel;
    
    IBOutlet UIImageView *profileImage;
    IBOutlet UIImageView *backgroundImage;
    
    IBOutlet UIButton *buttonPictureProfile;
    IBOutlet UIButton *buttonPictureProfileCamera;
    IBOutlet UIButton *buttonPictureBackground;
    IBOutlet UIButton *buttonPictureBackgroundCamera;
    IBOutlet UIButton *buttonSend;

}

-(IBAction)changePictureProfile:(id)sender;
-(IBAction)changePictureProfileCamera:(id)sender;
-(IBAction)changePictureBackground:(id)sender;
-(IBAction)changePictureBackgroundCamera:(id)sender;
-(IBAction)sendChanges:(id)sender;
@end
