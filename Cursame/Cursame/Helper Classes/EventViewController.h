//
//  EventViewController.h
//  Cursame
//
//  Created by Gerardo Quintanar Morales on 3/19/14.
//  Copyright (c) 2014 Gerardo Quintanar Morales. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SlideNavigationController.h"
#import "VRGCalendarView.h"
#import "AppDelegate.h"

@interface EventViewController : UIViewController <SlideNavigationControllerDelegate,VRGCalendarViewDelegate>

{
    
}
@property (nonatomic,strong) AppDelegate *appDelegate;
@property (nonatomic,strong) VRGCalendarView *calendar;
@property (nonatomic) float tempTargetHeight;
@end
