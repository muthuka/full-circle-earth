//
//  UIWebView+JavaScriptAlert.h
//  WebviewTest1
//
//  Created by marumugam on 7/30/13.
//  Copyright (c) 2013 Nexage. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <objc/runtime.h>

@class WebView;
@class WebFrame;
@class WebScriptCallFrame;

@interface UIWebView_JavaScriptAlert : UIWebView

- (void)webView:(UIWebView *)sender runJavaScriptAlertPanelWithMessage:(NSString *)message initiatedByFrame:(WebFrame *)frame;

@end
