//
//  QuestionTableViewController.m
//  polling
//
//  Created by Maneesh Goel on 8/17/12.
//  Copyright (c) 2012 Maneesh Goel. All rights reserved.
//

#import "QuestionTableViewController.h"
#import <Parse/Parse.h>

@interface QuestionTableViewController () {
    int selectedRow;
}
@property (nonatomic,strong) NSArray *responseArray;
@end

@implementation QuestionTableViewController

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section {
    return self.question;
}

- (void)viewDidLoad
{
    selectedRow = -1;
    [super viewDidLoad];
    self.responseArray = [NSArray arrayWithObjects:@"strongly agree", @"agree", @"neutral", @"disagree", @"strongly disagree", nil];
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
 
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    // Return the number of rows in the section.
    return [self.responseArray count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{

    UITableViewCell *cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:nil];
    cell.textLabel.text = [self.responseArray objectAtIndex:indexPath.row];
    if (indexPath.row == selectedRow) {
        cell.accessoryType = UITableViewCellAccessoryCheckmark;
    }
  // Configure the cell...
    
    return cell;
}


#pragma mark - Table view delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSLog(@"called row");
    selectedRow = indexPath.row;
    PFQuery *query = [PFQuery queryWithClassName:@"vote"];
    //change to CFUUID create instead of unique identifier
    [query whereKey:@"voterID" equalTo:[[UIDevice currentDevice] uniqueIdentifier]];
    [query whereKey:@"questionID" equalTo:self.questionID];
    PFObject *result = [query getFirstObject];
    if (result) {
        [result setObject:[tableView cellForRowAtIndexPath:indexPath] forKey:@"response"];
        [result setObject:self.questionID forKey:@"questionID"];
        [result save];
    } else {
        //send to parse
        result = [PFObject objectWithClassName:@"vote"];
        [result setObject:[tableView cellForRowAtIndexPath:indexPath] forKey:@"response"];
        [result setObject:self.questionID forKey:@"questionID"];
        [result setObject:[[UIDevice currentDevice] uniqueIdentifier] forKey:@"voterID"];
        [result save];
    }
    [tableView reloadData];
}


@end
