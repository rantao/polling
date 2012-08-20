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
    //NSLog(@"calling cell for row");
    UITableViewCell *tableViewCell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:nil];
    tableViewCell.textLabel.text = [[parseResults objectAtIndex:[indexPath row]] objectForKey:@"question"];
    return tableViewCell;
}



-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    //NSLog(@"woo");
    QuestionTableViewController *qtvc = [[QuestionTableViewController alloc] initWithStyle:UITableViewStyleGrouped];
    qtvc.question = [[parseResults objectAtIndex:[indexPath row]] objectForKey:@"question"];
    qtvc.questionObject = [parseResults objectAtIndex:[indexPath row]];
    [self.navigationController pushViewController:qtvc animated:YES];
}

-(int)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    //NSLog(@"asking how many rows in table");
    return [parseResults count];
}

-(void)viewWillAppear:(BOOL)animated {
    //NSLog(@"view will appear");
    parseResults = [ParseStore getPollQuestions];
    //self.tableView.delegate = self;
    //self.tableView.dataSource = self;
    [self.tableView reloadData];
    //NSLog(@"end of view will appear");
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
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



/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    }   
    else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath
{
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

#pragma mark - Table view delegate


@end
