//
//  EKEvent_DemoViewController.m
//  EKEvent Demo
//
//  Created by Ryan Murphy on 10/1/11.
//  Copyright 2011 RIT. All rights reserved.
//

#import "EKEvent_DemoViewController.h"
#import <EventKit/EventKit.h>

static NSString * const kDateFormat = @"d LLLL yyyy hh:mm a";

@implementation EKEvent_DemoViewController

- (void)didReceiveMemoryWarning
{
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    // Release any cached data, images, etc that aren't in use.
}

#pragma mark - Helper Methods

- (void)addEventWithDate:(NSDate *)theDate {

//    NSLog(@"addEventWithDate");
    EKEventStore *eventStore = [[EKEventStore alloc] init];
    
    EKEvent *myEvent  = [EKEvent eventWithEventStore:eventStore];
    
	myEvent.title = @"Test Event";
    myEvent.notes = @" Got Milk?";
    NSDate *startDate = theDate;
    
    [myEvent setStartDate:startDate];
    
    NSTimeInterval secondsInOneHour = 60 * 60;
    
    [myEvent setEndDate:[startDate dateByAddingTimeInterval:secondsInOneHour]];  
    
    [myEvent setCalendar:[eventStore defaultCalendarForNewEvents]];
    
    NSError *err;
    [eventStore saveEvent:myEvent span:EKSpanFutureEvents error:&err];
    
    if(err) {
//       Do Something
    }
    [eventStore release];
}

- (NSString *)stringFromDate:(NSDate *)theDate {
    
//    NSLog(@"stringFromDate");
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    [formatter setDateFormat:kDateFormat];
    
    //Optionally for time zone converstions
    [formatter setTimeZone:[NSTimeZone timeZoneWithName:@"..."]];
    
    NSString *stringFromDate = [formatter stringFromDate:theDate];
    return stringFromDate;
}


#pragma mark - IBAction

- (IBAction)addSelectedEventToiCal {
    
//    NSLog(@"addSelectedEventToiCal");
    [self addEventWithDate:[datePicker date]];
}

- (IBAction)datePickerChangedSelection {
    
//    NSLog(@"datePickerChangedSelection");
    
    [label setText:[self stringFromDate:[datePicker date]]];
}

#pragma mark - View lifecycle


- (void)viewDidLoad
{
    [super viewDidLoad];
    [datePicker setDate:[NSDate date]];
    [label setText:[self stringFromDate:[datePicker date]]];
}


- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

@end
