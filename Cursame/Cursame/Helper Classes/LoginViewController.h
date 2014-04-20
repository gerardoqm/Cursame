//
//  LoginViewController.h
//  Cursame
//
//  Created by Gerardo Quintanar Morales on 2/11/14.
//  Copyright (c) 2014 Gerardo Quintanar Morales. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AppDelegate.h"
#import <MediaPlayer/MPMoviePlayerController.h>
#import <AVFoundation/AVFoundation.h>
#import <AVFoundation/AVPlayer.h>

@interface LoginViewController : UIViewController <NSURLConnectionDelegate, NSURLConnectionDataDelegate, UITextFieldDelegate> {
    
    IBOutlet UITextField * email;
    IBOutlet UITextField * password;
}

@property (nonatomic, strong) AppDelegate *appDelegate;
@property (strong, nonatomic) IBOutlet UIView *controlView;
@property (strong, nonatomic) AVPlayer *mPlayer;
-(IBAction)login:(id)sender;
@end
