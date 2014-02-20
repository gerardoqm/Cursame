//
//  LoginViewController.h
//  Cursame
//
//  Created by Gerardo Quintanar Morales on 2/11/14.
//  Copyright (c) 2014 Gerardo Quintanar Morales. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface LoginViewController : UIViewController <NSURLConnectionDelegate, NSURLConnectionDataDelegate, UITextFieldDelegate> {
    
    IBOutlet UITextField * email;
    IBOutlet UITextField * password;
}
-(IBAction)login:(id)sender;
@end
