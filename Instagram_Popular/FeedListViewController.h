//
//  FeedListViewController.h
//  Instagram_Popular
//
//  Created by Serhat Sezer (Manadigital) on 13.05.2014.
//  Copyright (c) 2014 Serhat Sezer (Manadigital). All rights reserved.
//

#import <UIKit/UIKit.h>
#import "FeedParser.h"
#import "FeedPhotoItemTableViewCell.h"
#import "DetailViewController.h"

@interface FeedListViewController : UITableViewController<FeedParserDelegate>

@property (nonatomic,strong) DetailViewController *detailView;
@property (nonatomic,assign) id<FeedParserDelegate> delegate;
@property (nonatomic,strong) NSArray *feedPostArray;
@property (nonatomic,strong) UIRefreshControl *feedRefresher;
@property (nonatomic,strong) FeedParser *parser;

@end
