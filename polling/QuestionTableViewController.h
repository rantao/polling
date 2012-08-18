//
//  QuestionTableViewController.h
//  polling
//
//  Created by Maneesh Goel on 8/17/12.
//  Copyright (c) 2012 Maneesh Goel. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface QuestionTableViewController : UITableViewController
@property (nonatomic, strong) NSString *question;
@property (nonatomic, strong) NSString *questionID;
//@property (nonatomic, strong) IBOutlet UITableView *choicesTable;
@end
