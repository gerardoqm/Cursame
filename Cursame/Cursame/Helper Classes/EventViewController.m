//
//  EventViewController.m
//  Cursame
//
//  Created by Gerardo Quintanar Morales on 3/19/14.
//  Copyright (c) 2014 Gerardo Quintanar Morales. All rights reserved.
//

#import "EventViewController.h"
#import "NSDate+convenience.h"
#import "Constants.h"

@interface EventViewController ()

@end

@implementation EventViewController

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
    self.appDelegate = [[UIApplication sharedApplication] delegate];

    
    self.navigationController.title = @"Eventos";
    
    self.calendar = [[VRGCalendarView alloc] init];
    self.calendar.delegate=self;
    [self.view addSubview:self.calendar];
    
    
}


-(void) viewWillAppear:(BOOL)animated
{
    [self getEventsWithDate:[NSDate date]];
    
}

-(void)getEventsWithDate:(NSDate *)theDate
{
    NSUserDefaults *prefs = [NSUserDefaults standardUserDefaults];
    
    NSString *token = [prefs stringForKey:@"token"];
    
    
	[self.appDelegate showGlobalProgressHUDWithTitle: @"Cargando eventos..."];
    
    
    NSDate *today = [NSDate date];
    NSDateFormatter *dateFormat = [[NSDateFormatter alloc] init];
    [dateFormat setDateFormat:@"yyyy-MM"];
    NSString *dateString = [dateFormat stringFromDate:theDate];
    NSLog(@"date: %@", dateString);
    
    
    
    NSURLRequest *request = [NSURLRequest requestWithURL:[NSURL
                                                          URLWithString:[NSString stringWithFormat: @"%@/api/api/native_list_events.json?date=%@&auth_token=%@",kPruebas,dateString,token]]];
    
    
    
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
             
             NSString *response           = [[NSString alloc ] initWithData:data encoding:NSUTF8StringEncoding];
             NSLog(@"response: %@",response);
             
             NSError *jsonParsingError    = nil;
             
             //TODO: Interpretar respuesta
             NSDictionary *JSONData       = [NSJSONSerialization JSONObjectWithData:data options:0 error:&jsonParsingError];
             self.appDelegate.eventsFeed = [JSONData objectForKey:@"results"];
             
             [self.appDelegate dismissGlobalHUDWithDelay:1.0f];
             
             NSMutableArray *dates = [[NSMutableArray alloc] init];
             
             
             for (int i=0; i<[self.appDelegate.eventsFeed count]; i++) {
                 NSString *dateString = [[self.appDelegate.eventsFeed objectAtIndex:i] objectForKey:@"start"];
                 
                 NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
                 // this is imporant - we set our input date format to match our input string
                 // if format doesn't match you'll get nil from your string, so be careful
                 [dateFormatter setDateFormat:@"EEE, dd MMM yyyy HH:mm:ss ZZZ"];
                 [dateFormatter setLocale:[[NSLocale alloc] initWithLocaleIdentifier:@"en_US_POSIX"]];
                 
                 NSDate *dateFromString = [[NSDate alloc] init];
                 // voila!
                 
                 dateFromString = [dateFormatter dateFromString:dateString];
                 
                 [dates addObject:[NSNumber numberWithInt:[dateFromString day]]];
                 
                 dateFromString = nil;
                 
             }
             [self.calendar markDates:dates];
             
             
             
             
             
         }
         else if ([data length] == 0 && error == nil)
         {
             [self.appDelegate showGlobalProgressHUDWithTitle:@"No hay eventos, intenta de nuevo."];
             [self.appDelegate dismissGlobalHUDWithDelay:1.5f];
             
             NSLog(@"Nothing was downloaded.");
         }
         else if (error != nil)
         {
             [self.appDelegate showGlobalProgressHUDWithTitle:@"Hubo un error en la comunicación, intenta de nuevo."];
             [self.appDelegate dismissGlobalHUDWithDelay:1.5f];
             
             NSLog(@"Error = %@", error);
         }
         
     }];
    
}




- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (BOOL)slideNavigationControllerShouldDisplayLeftMenu
{
	return YES;
}


-(void)calendarView:(VRGCalendarView *)calendarView switchedToMonth:(NSDate *)monthDate targetHeight:(float)targetHeight animated:(BOOL)animated {
    self.tempTargetHeight = targetHeight;
    [self getEventsWithDate:monthDate];
    
    
    
}

//TODO: Update event list with new month and new alert with event details
-(void)calendarView:(VRGCalendarView *)calendarView dateSelected:(NSDate *)date {
    
    NSLog(@"Selected date = %@",date);
    UIAlertView *alert;
    
    for (int i=0; i<[self.appDelegate.eventsFeed count]; i++) {
        NSString *dateString = [[self.appDelegate.eventsFeed objectAtIndex:i] objectForKey:@"start"];
        
        NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
        // this is imporant - we set our input date format to match our input string
        // if format doesn't match you'll get nil from your string, so be careful
        [dateFormatter setDateFormat:@"EEE, dd MMM yyyy HH:mm:ss ZZZ"];
        [dateFormatter setLocale:[[NSLocale alloc] initWithLocaleIdentifier:@"en_US_POSIX"]];
        
        NSDate *dateFromString = [[NSDate alloc] init];
        // voila!
        
        dateFromString = [dateFormatter dateFromString:dateString];
        
        if ([date day]==[dateFromString day]) {
            alert = [[UIAlertView alloc] initWithTitle:[[self.appDelegate.eventsFeed objectAtIndex:i] objectForKey:@"title"]  message:[[self.appDelegate.eventsFeed objectAtIndex:i] objectForKey:@"description"]  delegate:self cancelButtonTitle:nil otherButtonTitles:@"Ok", nil];
            [alert show];

        }
        
        dateFromString = nil;
        
    }
}


@end