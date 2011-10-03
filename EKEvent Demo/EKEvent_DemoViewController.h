//
//  EKEvent_DemoViewController.h
//  EKEvent Demo
//
//  Created by Ryan Murphy on 10/1/11.
//  Copyright 2011 RIT. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface EKEvent_DemoViewController : UIViewController {
    
    IBOutlet UILabel *label;
    IBOutlet UIDatePicker *datePicker;
}

- (IBAction)addSelectedEventToiCal;
- (IBAction)datePickerChangedSelection;

@end
