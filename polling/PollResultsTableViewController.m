//
//  PollResultsTableViewController.m
//  polling
//
//  Created by Maneesh Goel on 8/17/12.
//  Copyright (c) 2012 Maneesh Goel. All rights reserved.
//

#import "PollResultsTableViewController.h"
#import "ParseStore.h"
#import "PollResultsDisplayTableViewController.h"

@interface PollResultsTableViewController () {
    NSArray *parseResults;
}
    
@end

@implementation PollResultsTableViewController

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *tableViewCell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:nil];
    tableViewCell.textLabel.text = [[parseResults objectAtIndex:[indexPath row]] objectForKey:@"question"];
    return tableViewCell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    PollResultsDisplayTableViewController *prdvc = [[PollResultsDisplayTableViewController alloc] initWithStyle:UITableViewStyleGrouped];
    prdvc.question = [[parseResults objectAtIndex:[indexPath row]] objectForKey:@"question"];
    prdvc.questionObject = [parseResults objectAtIndex:[indexPath row]];
    [self.navigationController pushViewController:prdvc animated:YES];
}

-(int)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [parseResults count];
}

-(void)viewWillAppear:(BOOL)animated {
    parseResults = [ParseStore getPollQuestions];
    [self.tableView reloadData];
}

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        self.tabBarItem.image = [UIImage imageNamed:@"graph_bar.png"];

    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
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


@end
