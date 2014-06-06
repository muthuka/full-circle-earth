//
//  UIWebView+JavaScriptAlert.m
//  WebviewTest1
//
//  Created by marumugam on 7/30/13.
//  Copyright (c) 2013 Nexage. All rights reserved.
//

#import "UIWebView+JavaScriptAlert.h"

@implementation UIWebView_JavaScriptAlert

- (void)webView:(UIWebView *)sender runJavaScriptAlertPanelWithMessage:(NSString *)message initiatedByFrame:(WebFrame *)frame {
//    UIAlertView *dialogue = [[UIAlertView alloc] initWithTitle:@"My Alert Title" message:message delegate:self cancelButtonTitle:@"Okay" otherButtonTitles:nil];
//    [dialogue show];
    NSLog(@"Skipping any potential log for iOS");
}

@end
