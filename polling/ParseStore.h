//
//  ParseStore.h
//  polling
//
//  Created by Maneesh Goel on 8/20/12.
//  Copyright (c) 2012 Maneesh Goel. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <Parse/Parse.h>

@interface ParseStore : NSObject
+(void)submitQuestion:(NSString *)question;
+(NSArray *)getPollQuestions;
+(void)voteOnPoll:(PFObject *)question withResponse:(int)response;
+(NSArray *)getResultsForQuestion:(PFObject *)questionObject andResponse:(int)response;
@end
