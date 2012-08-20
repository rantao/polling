//
//  PollResultsDisplayViewController.m
//  polling
//
//  Created by Maneesh Goel on 8/20/12.
//  Copyright (c) 2012 Maneesh Goel. All rights reserved.
//

#import "PollResultsDisplayTableViewController.h"
#import "ParseStore.h"

@interface PollResultsDisplayTableViewController ()
@property (nonatomic, strong) NSArray *responseArray;
@end

@implementation PollResultsDisplayTableViewController
@synthesize questionObject = _questionObject;
@synthesize question = _question;


- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section {
    return self.question;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [self.responseArray count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    UITableViewCell *cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:nil];
    cell.textLabel.text = [self.responseArray objectAtIndex:indexPath.row];
    NSArray *votingResults = [ParseStore getResultsForQuestion:self.questionObject andResponse:[indexPath row]];
    cell.detailTextLabel.text = [NSString stringWithFormat:@"%d votes, %d%%", [[votingResults objectAtIndex:0] intValue], [[votingResults objectAtIndex:1] intValue]];
    return cell;
}

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
    }
    return self;
}

- (void)viewDidLoad
{
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

@end
