//
//  HomeViewController.h
//  SlideMenu
//
//  Created by Aryan Gh on 4/24/13.
//  Copyright (c) 2013 Aryan Ghassemi. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SlideNavigationController.h"
#import "AppDelegate.h"

@interface HomeViewController : UIViewController <SlideNavigationControllerDelegate, UITableViewDataSource, UITableViewDelegate>
{
    IBOutlet UILabel * testLabel;
    IBOutlet UITableView *homeTableView;


}
@property (nonatomic, strong) AppDelegate *appDelegate;


-(IBAction)bounceMenu:(id)sender;
-(void)getPublications;
@end
