//
//  PollResultsTableViewController.h
//  polling
//
//  Created by Maneesh Goel on 8/17/12.
//  Copyright (c) 2012 Maneesh Goel. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Parse/Parse.h>

@interface PollResultsTableViewController : UITableViewController
@property (nonatomic, strong) NSString *question;
@property (nonatomic, strong) PFObject *questionObject;
@end
