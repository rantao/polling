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
        // Custom initialization
    }
    return self;
}

-(IBAction)submitQuestion {
    if (self.questionText.text) {
        [ParseStore submitQuestion:self.questionText.text];
        self.questionText.text = @"";
    }
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField {
    [self.questionText resignFirstResponder];
    //[self submitQuestion];
    return YES;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    // Do any additional setup after loading the view from its nib.
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

@end
