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
    appDelegate = [[UIApplication sharedApplication] delegate];
	// Do any additional setup after loading the view.

#pragma mark -
#pragma mark Bypass invalid server certificate for development
#if( DEBUG==1 )
    email.text = @"armando@cursa.me";
    password.text = @"123456";
#endif

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

	
	[[SlideNavigationController sharedInstance] HUD].labelText = @"Iniciando sesión";

	
	[[[SlideNavigationController sharedInstance] HUD] show:YES ];

    
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
             
             appDelegate.cursameResponse = [[CursameResponse alloc] initWithDictionary:JSONResponse];

             //appDelegate.cursameResponse = [appDelegate.cursameResponse initWithDictionary:JSONResponse];
             //appDelegate.cursameResponse.user = [ appDelegate.cursameResponse.user init initWithDictionary:appDelegate.cursameResponse.]

             NSUserDefaults *prefs = [NSUserDefaults standardUserDefaults];
             
             // saving an NSString
             [prefs setValue:[NSString stringWithString:appDelegate.cursameResponse.token] forKey:@"token"];
             [prefs synchronize];
             



             UIStoryboard *mainStoryboard = [UIStoryboard storyboardWithName:@"MainStoryboard_iPhone" bundle: nil];
             UIViewController *homeVC =[mainStoryboard instantiateViewControllerWithIdentifier: @"HomeViewController"];
             
             [[SlideNavigationController sharedInstance] switchToViewController:homeVC withCompletion:nil];
             
             [[SlideNavigationController sharedInstance] HUD].mode = MBProgressHUDModeText;
             [[SlideNavigationController sharedInstance] HUD].labelText = @"Bienvenido";
             [[[SlideNavigationController sharedInstance] HUD] hide:YES afterDelay:1.5];


         }
         else if ([data length] == 0 && error == nil)
         {
             [[SlideNavigationController sharedInstance] HUD].customView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"37x-Checkmark.png"]];
             [[SlideNavigationController sharedInstance] HUD].labelText = @"No se ha podido iniciar sesión, intenta de nuevo.";

             NSLog(@"Nothing was downloaded.");
         }
         else if (error != nil){
             [[SlideNavigationController sharedInstance] HUD].customView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"37x-Checkmark.png"]];
             [[SlideNavigationController sharedInstance] HUD].labelText = @"Hubo un error en la comunicación, intenta de nuevo.";

             NSLog(@"Error = %@", error);
         }
         
     }];
    
}


@end
