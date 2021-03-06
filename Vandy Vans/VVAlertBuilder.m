//
//  VVAlertBuilder.m
//  Vandy Vans
//
//  Created by Seth Friedman on 3/13/13.
//  Copyright (c) 2013 VandyApps. All rights reserved.
//

#import "VVAlertBuilder.h"

@implementation VVAlertBuilder

+ (NSString *)vanArrivingAlertMessageWithRouteName:(NSString *)routeName andStopName:(NSString *)stopName {
    return [NSString stringWithFormat:@"The %@ Route will be arriving at %@ in 2 minutes!", routeName, stopName];
}

+ (UIAlertView *)vanArrivingAlertWithRouteName:(NSString *)routeName andStopName:(NSString *)stopName {
    return [[UIAlertView alloc] initWithTitle:@"Van Arriving"
                                      message:[self vanArrivingAlertMessageWithRouteName:routeName andStopName:stopName]
                                     delegate:nil
                            cancelButtonTitle:@"OK"
                            otherButtonTitles:nil];
}

+ (UIAlertView *)reminderSetAlertWithRouteName:(NSString *)routeName andStopName:(NSString *)stopName {\
    NSString *reminderSetMessage = [NSString stringWithFormat:@"You will be reminded when the %@ Route is 2 minutes away from %@.", routeName, stopName];
    
    return [[UIAlertView alloc] initWithTitle:@"Reminder Set"
                                      message:reminderSetMessage
                                     delegate:nil
                            cancelButtonTitle:@"OK"
                            otherButtonTitles:nil];
}

+ (UIAlertView *)reminderAlreadyExistsAlertForStopName:(NSString *)stopName newStopName:(NSString *)newStopName delegate:(id)delegate {
    NSString *reminderAlreadyExistsMessage = [NSString stringWithFormat:@"You already have a reminder set for %@. Do you want to delete this and replace it with a reminder for %@?", stopName, newStopName];
    
    return [[UIAlertView alloc] initWithTitle:@"Reminder Already Exists"
                                      message:reminderAlreadyExistsMessage
                                     delegate:delegate
                            cancelButtonTitle:@"Cancel"
                            otherButtonTitles:@"Replace", nil];
}

+ (UIAlertView *)vansNotRunningAlertWithDelegate:(id)delegate {
    return [[UIAlertView alloc] initWithTitle:@"Vandy Vans Unavailable"
                                      message:@"The Vandy Vans are not currently running. Please try again after 5 PM."
                                     delegate:delegate
                            cancelButtonTitle:@"OK"
                            otherButtonTitles:nil];
}

+ (UIAlertView *)noArrivalPredictionsAlertWithDelegate:(id)delegate {
    return [[UIAlertView alloc] initWithTitle:@"No Predictions"
                                      message:@"There are no arrival predictions at this time."
                                     delegate:delegate
                            cancelButtonTitle:@"OK"
                            otherButtonTitles:nil];
}

+ (UIAlertController *)locationRequestAlertControllerWithGrantHandler:(void (^)(UIAlertAction *))grantHandler {
    UIAlertController *alertController = [UIAlertController alertControllerWithTitle:@"Location Permission Request"
                                                                             message:@"Vandy Vans needs to access your current location to help show you the stops around you. Your location will never be stored or saved anywhere."
                                                                      preferredStyle:UIAlertControllerStyleAlert];
    
    UIAlertAction *grantAction = [UIAlertAction actionWithTitle:@"Grant"
                                                             style:UIAlertActionStyleDefault
                                                           handler:grantHandler];
    UIAlertAction *denyAction = [UIAlertAction actionWithTitle:@"Deny"
                                                         style:UIAlertActionStyleDestructive
                                                       handler:nil];
    
    [alertController addAction:grantAction];
    [alertController addAction:denyAction];
    
    return alertController;
}

+ (UIAlertController *)locationAuthorizationDeniedAlertController {
    UIAlertController *alertController = [UIAlertController alertControllerWithTitle:@"Location Permission Denied"
                                                                             message:@"Vandy Vans does not have your permission to show your current location on the map. To fix this, tap Settings."
                                                                      preferredStyle:UIAlertControllerStyleAlert];
    
    UIAlertAction *settingsAction = [UIAlertAction actionWithTitle:@"Settings"
                                                             style:UIAlertActionStyleDefault
                                                           handler:^(UIAlertAction *action) {
                                                               NSURL *settingsURL = [NSURL URLWithString:UIApplicationOpenSettingsURLString];
                                                               
                                                               [[UIApplication sharedApplication] openURL:settingsURL];
                                                           }];
    
    [alertController addAction:settingsAction];
    
    return alertController;
}

@end
