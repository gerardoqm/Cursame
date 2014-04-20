//
//  LoginViewController.m
//  Cursame
//
//  Created by Gerardo Quintanar Morales on 2/11/14.
//  Copyright (c) 2014 Gerardo Quintanar Morales. All rights reserved.
//

#import "LoginViewController.h"
#import "HomeViewController.h"
#import "Constants.h"
#import "CursameResponse.h"
#import "CursameUser.h"

@interface LoginViewController ()

@end

@implementation LoginViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    
    self.appDelegate = (AppDelegate *) [[UIApplication sharedApplication] delegate];
#pragma mark -
#pragma mark Bypass invalid server certificate for development
#if( DEBUG==1 )
    email.text = @"armando@cursa.me";
    password.text = @"123456";
#endif

    NSURL *url = [NSURL fileURLWithPath:[[NSBundle mainBundle] pathForResource:@"vertical" ofType:@"mp4"]];

    _mPlayer = [[AVPlayer alloc] init];
    //mPlayer = [mPlayer initWithURL:[NSURL URLWithString:@"http://devimages.apple.com/iphone/samples/bipbop/bipbopall.m3u8"]];
    _mPlayer = [_mPlayer initWithURL:url];
    AVPlayerLayer * playerLayer = [AVPlayerLayer playerLayerWithPlayer:_mPlayer];
    [[[self view] layer] insertSublayer:playerLayer atIndex:0];
    [playerLayer setFrame:CGRectMake(0, 0, [[UIScreen mainScreen] bounds].size.width, [[UIScreen mainScreen] bounds].size.height)];
    [_mPlayer play];
    
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(playerItemDidReachEnd:)
                                                 name:AVPlayerItemDidPlayToEndTimeNotification
                                               object:[_mPlayer currentItem]];

    NSLog(@"Playing video at: %@", url);
    
    

}


- (void)playerItemDidReachEnd:(NSNotification *)notification
{
    //Keeps looping the Idle video until another one is selected
    AVPlayerItem *p = [notification object];
    [p seekToTime:kCMTimeZero];
    [_mPlayer play];
}
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (BOOL)textFieldShouldReturn:(UITextField *)theTextField {
    if (theTextField == email)
    {
        [password becomeFirstResponder];
    }
    if (theTextField == password && [password.text length]!=0) {
        [theTextField resignFirstResponder];
        [self login:password];
    }
    return YES;
}


-(IBAction)login:(id)sender{
    
    // The hud will dispable all input on the window

	
	[self.appDelegate showGlobalProgressHUDWithTitle: @"Iniciando sesión"];

	

    
    NSURLRequest *request = [NSURLRequest requestWithURL:[NSURL
                                                          URLWithString:[NSString stringWithFormat: @"%@/api/tokens/create.json?email=%@&password=%@",kPruebas,email.text,password.text]]];
    
    [NSURLConnection
     sendAsynchronousRequest:request
     queue:[NSOperationQueue mainQueue]
     completionHandler:^(NSURLResponse *response,
                         NSData *data,
                         NSError *error)
     {
         
         if ([data length] >0 && error == nil)
         {
             

             
             // Received data
             
             NSError *jsonParsingError = nil;
             
    
             
             NSString *loginResponse = [[NSString alloc ] initWithData:data encoding:NSUTF8StringEncoding];
             //NSLog(@"loginResponse: %@",loginResponse);
             
             
             //TODO: Interpretar respuesta
             NSDictionary *JSONData = [NSJSONSerialization JSONObjectWithData:data options:0 error:&jsonParsingError];
             NSDictionary *JSONResponse = [JSONData objectForKey:@"response"];
             
             //self.appDelegate.cursameResponse = [[CursameResponse alloc] initWithDictionary:JSONResponse];
             self.appDelegate.mainFeed =JSONData;
             //self.appDelegate.cursameResponse = [self.appDelegate.cursameResponse initWithDictionary:JSONResponse];
             //self.appDelegate.cursameResponse.user = [ self.appDelegate.cursameResponse.user init initWithDictionary:self.appDelegate.cursameResponse.]

             NSUserDefaults *prefs = [NSUserDefaults standardUserDefaults];
             
             // saving an NSString
             [prefs setValue:[NSString stringWithString:[[self.appDelegate	.mainFeed objectForKey:@"response"] objectForKey:@"token"]] forKey:@"token"];
             [prefs synchronize];
             



             UIStoryboard *mainStoryboard = [UIStoryboard storyboardWithName:@"MainStoryboard_iPhone" bundle: nil];
             UIViewController *homeVC =[mainStoryboard instantiateViewControllerWithIdentifier: @"HomeViewController"];
             
             [[SlideNavigationController sharedInstance] switchToViewController:homeVC withCompletion:nil];
             
             [self.appDelegate showGlobalProgressHUDWithTitle: @"Bienvenido"];
             [self.appDelegate dismissGlobalHUDWithDelay:1.5f];

         }
         else if ([data length] == 0 && error == nil)
         {
             [self.appDelegate showGlobalProgressHUDWithTitle: @"No se ha podido iniciar sesión, intenta de nuevo."];
             [self.appDelegate dismissGlobalHUDWithDelay:1.5f];


             NSLog(@"Nothing was downloaded.");
         }
         else if (error != nil){
             [self.appDelegate showGlobalProgressHUDWithTitle: @"Hubo un error en la comunicación, intenta de nuevo."];
             [self.appDelegate dismissGlobalHUDWithDelay:1.5f];


             NSLog(@"Error = %@", error);
         }
         
     }];
    
}


@end
