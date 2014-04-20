//
//  MenuViewController.m
//  SlideMenu
//
//  Created by Aryan Gh on 4/24/13.
//  Copyright (c) 2013 Aryan Ghassemi. All rights reserved.
//

#import "MenuViewController.h"
#import "SlideNavigationContorllerAnimatorFade.h"
#import "SlideNavigationContorllerAnimatorSlide.h"
#import "SlideNavigationContorllerAnimatorScale.h"
#import "SlideNavigationContorllerAnimatorScaleAndFade.h"
#import "SlideNavigationContorllerAnimatorSlideAndFade.h"

@implementation MenuViewController
@synthesize cellIdentifier;


- (void)viewDidLoad
{
    NSIndexPath *defaultIndexPath = [NSIndexPath indexPathForRow:0 inSection:0];
    [menuTableView selectRowAtIndexPath:defaultIndexPath animated:NO scrollPosition:UITableViewScrollPositionTop];

}
#pragma mark - UITableView Delegate & Datasrouce -

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
	return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
	return 11;
}

//- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
//{
//	return (section == 0) ? @"Navigation" : @"Menu Animation";
//}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
	UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:self.cellIdentifier];
    cell.selectedBackgroundView = [[UIView alloc] init];
    cell.selectedBackgroundView.backgroundColor = [UIColor colorWithRed:0.064 green:0.349 blue:0.745 alpha:1.000];
    switch (indexPath.row)
    {
        case 0:
            cell.textLabel.text = @"Perfil";
            break;
            
        case 1:
            cell.textLabel.text = @"Inicio";
            cell.imageView.image = [UIImage imageNamed:@"MenuInicio"];

            break;
            
        case 2:
            cell.textLabel.text = @"Tareas";
            break;
            
        case 3:
            cell.textLabel.text = @"Cuestionarios";
            break;
            
        case 4:
            cell.textLabel.text = @"Discusiones";
            break;
            
        case 5:
            cell.textLabel.text = @"Cursos";
            break;
            
        case 6:
            cell.textLabel.text = @"Calificaciones";
            break;
            
        case 7:
            cell.textLabel.text = @"Calendario";
            break;
            
        case 8:
            cell.textLabel.text = @"Comunidad";
            break;
            
        case 9:
            cell.textLabel.text = @"Chat";
            break;
            
        case 10:
            cell.textLabel.text = @"Cerrar sesión";
            break;
            
    }
	
	return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{


    
	UIStoryboard *mainStoryboard = [UIStoryboard storyboardWithName:@"MainStoryboard_iPhone"
															 bundle: nil];
	
	if (indexPath.section == 0)
	{
		UIViewController *vc ;
		
		switch (indexPath.row)
		{
			case 0:
				vc = [mainStoryboard instantiateViewControllerWithIdentifier: @"ProfileViewController"];
				break;
				
			case 1:
				vc = [mainStoryboard instantiateViewControllerWithIdentifier: @"HomeViewController"];
				break;
				
			case 2:
				vc = [mainStoryboard instantiateViewControllerWithIdentifier: @"FriendsViewController"];
				break;
				
			case 7:
				vc = [mainStoryboard instantiateViewControllerWithIdentifier: @"EventViewController"];
				break;
			case 10:
				[[SlideNavigationController sharedInstance] popToRootViewControllerAnimated:YES];
				return;
				break;
		}
		
		[[SlideNavigationController sharedInstance] switchToViewController:vc withCompletion:nil];
	}
	else
	{
		id <SlideNavigationContorllerAnimator> revealAnimator;
		
		switch (indexPath.row)
		{
			case 0:
				revealAnimator = nil;
				break;
				
			case 1:
				revealAnimator = [[SlideNavigationContorllerAnimatorSlide alloc] init];
				break;
				
			case 2:
				revealAnimator = [[SlideNavigationContorllerAnimatorFade alloc] init];
				break;
				
			case 3:
				revealAnimator = [[SlideNavigationContorllerAnimatorSlideAndFade alloc] initWithMaximumFadeAlpha:.7 fadeColor:[UIColor purpleColor] andSlideMovement:100];
				break;
				
			case 4:
				revealAnimator = [[SlideNavigationContorllerAnimatorScale alloc] init];
				break;
				
			case 5:
				revealAnimator = [[SlideNavigationContorllerAnimatorScaleAndFade alloc] initWithMaximumFadeAlpha:.6 fadeColor:[UIColor blueColor] andMinimumScale:.7];
				break;
				
			default:
				return;
		}
		
		[[SlideNavigationController sharedInstance] closeMenuWithCompletion:^{
			[SlideNavigationController sharedInstance].menuRevealAnimator = revealAnimator;
		}];
	}
}

@end
