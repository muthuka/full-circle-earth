//
//  DetailViewController.m
//  iThottam
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
	
    if (self.passedItem) {
//        NSLog(@"Showing content: %@", self.passedItem.content);
        NSString *adjustedContent = [NSString stringWithFormat:@"<html><head><title>iThottam</title><meta name = 'viewport' content = 'width = device-width;initial-scale = 1.0'></head><body><div>%@</div></body></html>", self.passedItem.content];
        [self.wv loadHTMLString:adjustedContent baseURL:[NSURL URLWithString:@"http://fullcircleearth.org"]];
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
