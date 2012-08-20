//
//  QuestionTableViewController.m
//  polling
//
//  Created by Maneesh Goel on 8/17/12.
//  Copyright (c) 2012 Maneesh Goel. All rights reserved.
//

#import "QuestionTableViewController.h"
#import <Parse/Parse.h>
#import "ParseStore.h"

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
}

- (void)viewDidUnload
{
    [super viewDidUnload];
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [self.responseArray count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:nil];
    cell.textLabel.text = [self.responseArray objectAtIndex:indexPath.row];
    if (indexPath.row == selectedRow) {
        cell.accessoryType = UITableViewCellAccessoryCheckmark;
    }    
    return cell;
}


#pragma mark - Table view delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [ParseStore voteOnPoll:self.questionObject withResponse:[indexPath row]];
    selectedRow = indexPath.row;
    [tableView reloadData];
}


@end
