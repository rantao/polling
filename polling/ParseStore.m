//
//  ParseStore.m
//  polling
//
//  Created by Maneesh Goel on 8/20/12.
//  Copyright (c) 2012 Maneesh Goel. All rights reserved.
//

#import "ParseStore.h"

@implementation ParseStore
+(void)submitQuestion:(NSString *)question {
    PFObject *questionSubmit = [PFObject objectWithClassName:@"poll"];
    [questionSubmit setObject:question forKey:@"question"];
    [questionSubmit save];
}

+(NSArray *)getPollQuestions {
    PFQuery *query = [PFQuery queryWithClassName:@"poll"];
    return [query findObjects];
}

+(void)voteOnPoll:(PFObject *)question withResponse:(int)response {
    //handle unique users
    PFQuery *query = [PFQuery queryWithClassName:@"vote"];
    [query whereKey:@"parent" equalTo:question];
    [query whereKey:@"user" equalTo:[PFUser currentUser]];
    PFObject *result = [query getFirstObject];
    if (result) {
        //update vote
        [result setObject:[NSNumber numberWithInt:response] forKey:@"response"];
        [result save];
    } else {
        //create vote, push to parse
        result = [PFObject objectWithClassName:@"vote"];
        [result setObject:[NSNumber numberWithInt:response] forKey:@"response"];
        [result setObject:question forKey:@"parent"];
        [result setObject:[PFUser currentUser] forKey:@"user"];
        [result save];
    }
    
}

+(NSArray *)getResultsForQuestion:(PFObject *)questionObject andResponse:(int)response {
    PFQuery *query = [PFQuery queryWithClassName:@"vote"];
    [query whereKey:@"parent" equalTo:questionObject];
    int numResponses = [[query findObjects] count];
    [query whereKey:@"response" equalTo:[NSNumber numberWithInt:response]];
    int numVotes = [[query findObjects] count];
    int percent;
    if (numResponses !=0) {
        percent = numVotes/numResponses *100;
    } else {
        percent = 0;
    }
    return [NSArray arrayWithObjects:[NSNumber numberWithInt:numVotes], [NSNumber numberWithInt:percent], nil];
}
@end
