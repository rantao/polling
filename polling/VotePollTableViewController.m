//
//  VotePollTableViewController.m
//  polling
//
//  Created by Maneesh Goel on 8/17/12.
//  Copyright (c) 2012 Maneesh Goel. All rights reserved.
//

#import "VotePollTableViewController.h"
#import "QuestionTableViewController.h"
#import "ParseStore.h"
@interface VotePollTableViewController () {
    NSArray *parseResults;
}
@end

@implementation VotePollTableViewController


-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *tableViewCell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:nil];
    tableViewCell.textLabel.text = [[parseResults objectAtIndex:[indexPath row]] objectForKey:@"question"];
    return tableViewCell;
}



-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    QuestionTableViewController *qtvc = [[QuestionTableViewController alloc] initWithStyle:UITableViewStyleGrouped];
    qtvc.question = [[parseResults objectAtIndex:[indexPath row]] objectForKey:@"question"];
    qtvc.questionObject = [parseResults objectAtIndex:[indexPath row]];
    [self.navigationController pushViewController:qtvc animated:YES];
}

-(int)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [parseResults count];
}

-(void)viewWillAppear:(BOOL)animated {
    parseResults = [ParseStore getPollQuestions];
    [self.tableView reloadData];
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

@end
