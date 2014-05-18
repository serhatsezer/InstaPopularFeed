//
//  FeedParser.m
//  Instagram_Popular
//
//  Created by Serhat Sezer (Manadigital) on 13.05.2014.
//  Copyright (c) 2014 Serhat Sezer (Manadigital). All rights reserved.
//

#import "FeedParser.h"

@implementation FeedParser
@synthesize delegate;

- (void)parseWithURL:(NSURL *)urlPath
{
    NSData *data = [NSData dataWithContentsOfURL:urlPath];
    
    if(data) {
        
        NSError *parserErr = nil;
        NSDictionary *jsonDic = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingAllowFragments error:&parserErr];
        
        if(parserErr) {
            [self.delegate didFailParsing:parserErr];
        } else {
            NSArray *dataArr = [jsonDic valueForKey:@"data"];
            [self.delegate didFinishParsing:dataArr];
        }
    } else {
        [self.delegate didFailParsing:nil];
    }
}


@end
