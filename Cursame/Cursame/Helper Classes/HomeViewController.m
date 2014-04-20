//
//  HomeViewController.m
//  SlideMenu
//
//  Created by Aryan Gh on 4/24/13.
//  Copyright (c) 2013 Aryan Ghassemi. All rights reserved.
//

#import "HomeViewController.h"
#import "Constants.h"
#import "Publications.h"

@implementation HomeViewController


- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.appDelegate = (AppDelegate *) [[UIApplication sharedApplication] delegate];

    testLabel.text = @"TEST";
    //https://pruebas.cursa.me/api/api/publications.json?type=Network&auth_token=LvsBEYzoxWXokjwZZCY3&limit=20&page=3

}

-(void) viewWillAppear:(BOOL)animated
{
    [self getPublications];

}

-(void)getPublications
{
    NSUserDefaults *prefs = [NSUserDefaults standardUserDefaults];
    
    NSString *token = [prefs stringForKey:@"token"];
    
    
    [_appDelegate showGlobalProgressHUDWithTitle:@"Cargando publicaciones"];
    
	

    
    NSURLRequest *request = [NSURLRequest requestWithURL:[NSURL
                                                          URLWithString:[NSString stringWithFormat: @"%@/api/api/publications.json?type=Network&auth_token=%@&limit=20&page=1",kPruebas,token]]];
    
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
             _appDelegate.publicationsFeed = [JSONData objectForKey:@"publications"];

             [homeTableView reloadData];

             [_appDelegate dismissGlobalHUD];

             
             
             
         }
         else if ([data length] == 0 && error == nil)
         {
             [_appDelegate showGlobalProgressHUDWithTitle:@"No hay publicaciones, intenta de nuevo."];
             [_appDelegate dismissGlobalHUDWithDelay:1.5f];

             NSLog(@"Nothing was downloaded.");
         }
         else if (error != nil){

             [_appDelegate showGlobalProgressHUDWithTitle:@"Hubo un error en la comunicación, intenta de nuevo."];
             [_appDelegate dismissGlobalHUDWithDelay:1.5f];

             NSLog(@"Error = %@", error);
         }
         
     }];
    

}

#pragma mark - SlideNavigationController Methods -



- (BOOL)slideNavigationControllerShouldDisplayLeftMenu
{
	return YES;
}

#pragma mark - IBActions -

- (IBAction)bounceMenu:(id)sender
{
	static Menu menu = MenuLeft;
	
	[[SlideNavigationController sharedInstance] bounceMenu:menu withCompletion:nil];
	
	menu = (menu == MenuLeft) ? MenuRight : MenuLeft;
}



#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    // Return the number of sections.
    return [_appDelegate.publicationsFeed count];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    // Return the number of rows in the section.
    return 1;
}
- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 10;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 120;
}



- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    static NSString *CellIdentifier = @"customCommentCell";
    
    UITableViewCell *cell = [homeTableView
                             dequeueReusableCellWithIdentifier:CellIdentifier];
    
    if (cell == nil) {
        cell = [[UITableViewCell alloc]
                initWithStyle:UITableViewCellStyleDefault
                reuseIdentifier:CellIdentifier];
    }
    
    
    NSDictionary *publication = [_appDelegate.publicationsFeed objectAtIndex:[indexPath section]];
    
//    NSDictionary *publicationDetails = [publication objectForKey:@"publication"];
//    NSDictionary *user = [tweet objectForKey:@"user"];
    UILabel *labelPublication = (UILabel *)[cell viewWithTag:100];
    [labelPublication setText:[[publication objectForKey:@"publication"] objectForKey:@"comment"]];
//    //NSLog(@"profile_image_url :%@",user[@"profile_image_url"]);
//    UIImageView *profileImage = (UIImageView *)[cell viewWithTag:200];
//    //[self downloadImageWithURL:[NSURL URLWithString:user[@"profile_image_url"]] completionBlock:^(BOOL succeeded, UIImage *image) {
//        if (succeeded) {
//            // change the image in the cell
//            [profileImage setImage:image];
//            
//        }
//    }];

    return cell;
}



@end
