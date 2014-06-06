//
//  DetailViewController.m
//  Full Circle Earth
//
//  Created by marumugam on 6/5/13.
//  Copyright (c) 2013 MK Touch Apps. All rights reserved.
//

#import "DetailViewController.h"

@interface DetailViewController ()

@end

@implementation DetailViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    if(__IPHONE_OS_VERSION_MAX_ALLOWED <= __IPHONE_6_1) {
        self.navigationController.navigationBar.translucent = NO;
        self.navigationController.toolbar.translucent = NO;
    }
	
    if (self.passedItem) {
        NSString *adjustedContent = [NSString stringWithFormat:@"<html><head><title>Full Circle Earth</title><meta name = 'viewport' content = 'width = device-width;initial-scale = 1.0'></head><body><div>%@</div></body></html>", self.passedItem.content];
        [self.wv loadHTMLString:adjustedContent baseURL:[NSURL URLWithString:@"http://www.fullcircleearth.org"]];
    }
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)clickBrowser:(id)sender {
    if (self.passedItem) {
        NSURL *url = [NSURL URLWithString:self.passedItem.link];
        if (![[UIApplication sharedApplication] openURL:url])
            NSLog(@"%@%@",@"Failed to open url:",[url description]);
    }
}

@end
