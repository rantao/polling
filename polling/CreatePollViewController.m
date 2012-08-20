//
//  CreatePollViewController.m
//  polling
//
//  Created by Maneesh Goel on 8/17/12.
//  Copyright (c) 2012 Maneesh Goel. All rights reserved.
//

#import "CreatePollViewController.h"
#import <Parse/Parse.h>
@interface CreatePollViewController ()
@property (nonatomic, strong) IBOutlet UITextField *questionText;
@property (nonatomic, strong) IBOutlet UIButton *submitButton;
-(IBAction)submitQuestion;
@end

@implementation CreatePollViewController


- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
    }
    return self;
}

-(IBAction)submitQuestion {
    if (![self.questionText.text isEqualToString:@""]) {
        [ParseStore submitQuestion:self.questionText.text];
        self.questionText.text = @"";
    }
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField {
    [self.questionText resignFirstResponder];
    return YES;
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
