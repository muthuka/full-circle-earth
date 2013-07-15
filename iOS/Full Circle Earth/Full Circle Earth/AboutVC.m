//
//  AboutVC.m
//  iThottam
//
//  Created by marumugam on 7/9/13.
//  Copyright (c) 2013 MK Touch Apps. All rights reserved.
//

#import "AboutVC.h"

@interface AboutVC ()

@end

@implementation AboutVC

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
    
    NSDictionary *dict = [[NSBundle mainBundle] infoDictionary];
	self.verLabel.text = [NSString stringWithFormat:@"v %@", [dict objectForKey:@"CFBundleShortVersionString"]];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
