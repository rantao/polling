//
//  PollResultsDisplayViewController.h
//  polling
//
//  Created by Maneesh Goel on 8/20/12.
//  Copyright (c) 2012 Maneesh Goel. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Parse/Parse.h>

@interface PollResultsDisplayTableViewController : UITableViewController {
    
}
@property (nonatomic, strong) NSString *question;
@property (nonatomic, strong) PFObject *questionObject;
@end
