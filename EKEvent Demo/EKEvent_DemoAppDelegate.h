//
//  EKEvent_DemoAppDelegate.h
//  EKEvent Demo
//
//  Created by Ryan Murphy on 10/1/11.
//  Copyright 2011 RIT. All rights reserved.
//

#import <UIKit/UIKit.h>

@class EKEvent_DemoViewController;

@interface EKEvent_DemoAppDelegate : NSObject <UIApplicationDelegate>

@property (nonatomic, retain) IBOutlet UIWindow *window;

@property (nonatomic, retain) IBOutlet EKEvent_DemoViewController *viewController;

@end
