//
//  DetailViewController.h
//  Full Circle Earth
//
//  Created by marumugam on 6/5/13.
//  Copyright (c) 2013 MK Touch Apps. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MWFeedItem.h"

@interface DetailViewController : UIViewController

@property (nonatomic, retain) MWFeedItem *passedItem;
@property (weak, nonatomic) IBOutlet UIWebView *wv;

- (IBAction)clickBrowser:(id)sender;

@end
