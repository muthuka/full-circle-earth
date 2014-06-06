//
//  BlogItemsViewController.m
//  Full Circle Earth
//
//  Created by marumugam on 6/5/13.
//  Copyright (c) 2013 MK Touch Apps. All rights reserved.
//

#import "BlogItemsViewController.h"
#import "MWFeedParser.h"
#import "DetailViewController.h"
#import "UAInboxUI.h"

@interface BlogItemsViewController () <MWFeedParserDelegate>

@property (nonatomic, retain) MWFeedParser *feedParser;

@end

@implementation BlogItemsViewController

@synthesize feedParser;

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
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
    
    // If the application gets an UAInbox message id on launch open it up immediately.
    // Only works for the default inbox
    [UAInboxUI shared].inboxParentController = self;

    list = [[NSMutableArray alloc] initWithCapacity:0];
    
    // Get all feed items
    NSURL *feedURL = [NSURL URLWithString:@"http://www.fullcircleearth.org/?feed=rss"];
    feedParser = [[MWFeedParser alloc] initWithFeedURL:feedURL];
    feedParser.delegate = self;
    feedParser.feedParseType = ParseTypeFull;
    feedParser.connectionType = ConnectionTypeSynchronously;
    [feedParser parse];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [list count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"ArticleTitle";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier forIndexPath:indexPath];
    
    // Configure the cell...
    MWFeedItem *item = [list objectAtIndex:indexPath.row];
    if (item) {
        cell.textLabel.text = item.title ? item.title : @"[No Title]";;
    }
    
    return cell;
}

#pragma mark - Segue

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
	if ([segue.identifier isEqualToString:@"Detail"])
	{
		DetailViewController *detail = segue.destinationViewController;;
        detail.passedItem = [list objectAtIndex:self.tableView.indexPathForSelectedRow.row];
	}
}

#pragma mark - MWFeedparser Delegate

- (void)feedParserDidStart:(MWFeedParser *)parser
{
    
}

- (void)feedParser:(MWFeedParser *)parser didParseFeedInfo:(MWFeedInfo *)info
{
    
}

- (void)feedParser:(MWFeedParser *)parser didParseFeedItem:(MWFeedItem *)item
{
    [list addObject:item];
}

- (void)feedParserDidFinish:(MWFeedParser *)parser
{
    [self.tableView reloadData];
}

- (void)feedParser:(MWFeedParser *)parser didFailWithError:(NSError *)error
{
    
}

@end
