//
//  FeedParser.h
//  Instagram_Popular
//
//  Created by Serhat Sezer (Manadigital) on 13.05.2014.
//  Copyright (c) 2014 Serhat Sezer (Manadigital). All rights reserved.
//

#import <Foundation/Foundation.h>

// Creating protocol
@protocol FeedParserDelegate <NSObject>

- (void) didFinishParsing:(NSArray *)posts;
- (void) didFailParsing:(NSError *)err;

@end


@interface FeedParser : NSObject

@property (nonatomic,assign) id<FeedParserDelegate> delegate;

- (void) parseWithURL:(NSURL *) urlPath;

@end

