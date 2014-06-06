//
//  AppDelegate.m
//  Full Circle Earth
//
//  Created by marumugam on 6/5/13.
//  Copyright (c) 2013 MK Touch Apps. All rights reserved.
//

#import "AppDelegate.h"
#import "mtiks.h"
#import "UAInbox.h"
#import "UAInboxUI.h"

@implementation AppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
//    [[UIApplication sharedApplication] setStatusBarHidden:NO withAnimation:UIStatusBarAnimationFade];
    [[UIApplication sharedApplication] setStatusBarHidden:NO];
    
    // Populate AirshipConfig.plist with your app's info from https://go.urbanairship.com
    // or set runtime properties here.
    UAConfig *config = [UAConfig defaultConfig];
    
    [UAPush shared].notificationTypes = (UIRemoteNotificationTypeBadge |
                                         UIRemoteNotificationTypeSound |
                                         UIRemoteNotificationTypeAlert );
    
    // Call takeOff (which creates the UAirship singleton)
    [UAirship takeOff:config];
    
    //Init the UI
    [UAInbox useCustomUI:[UAInboxUI class]];//sample UI implementation
    [UAInbox shared].pushHandler.delegate = [UAInboxUI shared];
    
    return YES;
}

- (void)applicationDidEnterBackground:(UIApplication *)application
{
    [[mtiks sharedSession] stop];
}

- (void)applicationDidBecomeActive:(UIApplication *)application
{
    [[mtiks sharedSession] start:@"2da96a64638fae41febea387f"];
    [[UAPush shared] resetBadge];
}

- (void)applicationWillTerminate:(UIApplication *)application
{
    [[mtiks sharedSession] stop];
}

- (void)application:(UIApplication *)application didReceiveRemoteNotification:(NSDictionary *)userInfo {
    [UAInboxPushHandler handleNotification:userInfo];
}

@end
