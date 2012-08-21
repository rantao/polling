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
    PFQuery *query = [PFQuery queryWithClassName:@"vote"];
    [query whereKey:@"parent" equalTo:question];
    [query whereKey:@"user" equalTo:[PFUser currentUser]];
    PFObject *result = [query getFirstObject];
    if (result) {
        [result setObject:[NSNumber numberWithInt:response] forKey:@"response"];
        [result save];
    } else {
        result = [PFObject objectWithClassName:@"vote"];
        [result setObject:[NSNumber numberWithInt:response] forKey:@"response"];
        [result setObject:question forKey:@"parent"];
        [result setObject:[PFUser currentUser] forKey:@"user"];
        [result save];
    }
    
}

+(NSDictionary *)getResultsForQuestion:(PFObject *)questionObject {
    PFQuery *query = [PFQuery queryWithClassName:@"vote"];
    [query whereKey:@"parent" equalTo:questionObject];
    NSArray *questionVotes = [query findObjects];
    float numResponses = [questionVotes count];
    NSMutableDictionary *responseDict = [NSMutableDictionary dictionaryWithObjects:[NSArray arrayWithObjects:[NSNumber numberWithInt:0],[NSNumber numberWithInt:0], [NSNumber numberWithInt:0], [NSNumber numberWithInt:0], [NSNumber numberWithInt:0], nil] forKeys:[NSArray arrayWithObjects:[NSNumber numberWithInt:0],[NSNumber numberWithInt:1], [NSNumber numberWithInt:2], [NSNumber numberWithInt:3], [NSNumber numberWithInt:4], nil]];
    for (PFObject *resp in questionVotes) {
        int responseValue = [[resp objectForKey:@"response"] intValue];
        int temp;
        if (![responseDict objectForKey:[NSNumber numberWithInt:responseValue]]) {
            temp = 0;
        } else {
            temp =[[responseDict objectForKey:[NSNumber numberWithInt:responseValue]] intValue];
        }
        temp++;
        [responseDict setObject:[NSNumber numberWithInt:temp] forKey:[NSNumber numberWithInt:responseValue]];
    }
    [responseDict setObject:[NSNumber numberWithFloat:numResponses] forKey:@"total"];
    return responseDict;
}
@end
