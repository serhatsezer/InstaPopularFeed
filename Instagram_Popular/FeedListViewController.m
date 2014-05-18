//
//  FeedListViewController.m
//  Instagram_Popular
//
//  Created by Serhat Sezer (Manadigital) on 13.05.2014.
//  Copyright (c) 2014 Serhat Sezer (Manadigital). All rights reserved.
//

#import "FeedListViewController.h"
#define CELL_HEIGHT 430
#define PATH @"https://api.instagram.com/v1/media/popular?client_id=%20df71db760d5a46de9ba167451699712a"

@interface FeedListViewController ()

@end

@implementation FeedListViewController
@synthesize feedPostArray,feedRefresher,parser;

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        feedPostArray = nil;
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.title = @"Instagram Popular";
    
    parser = [[FeedParser alloc] init];
    parser.delegate    = self;
    
    feedRefresher = [[UIRefreshControl alloc] init];
    self.refreshControl = feedRefresher;
    [feedRefresher addTarget:self action:@selector(getPopularFeed) forControlEvents:UIControlEventValueChanged];
    
    // get popular feed
    [self getPopularFeed];
}

- (void) getPopularFeed
{
    [parser parseWithURL:[NSURL URLWithString:PATH]];
    
    if(feedRefresher)
        [feedRefresher endRefreshing];
}

-(void)didFinishParsing:(NSArray *)posts
{
    feedPostArray = posts;
    [self.tableView reloadData];
}

-(void)didFailParsing:(NSError *)err
{
    UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:@"Error!"
                                                        message:@"Parsing error. Control your service path."
                                                       delegate:self
                                              cancelButtonTitle:@"OK"
                                              otherButtonTitles:nil, nil];
    [alertView show];
}


#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return feedPostArray.count;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return CELL_HEIGHT;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSDictionary *userInfoDic = [feedPostArray objectAtIndex:indexPath.row];
    
    FeedPhotoItemTableViewCell *cell = [[[NSBundle mainBundle]
                                         loadNibNamed:@"FeedPhotoItemCell" owner:nil options:nil] objectAtIndex:0];
    
    // Get User Avatar
    NSString *avatarPath    = [[userInfoDic valueForKey:@"user"] valueForKey:@"profile_picture"];
    NSURL    *avatarURL     = [NSURL URLWithString:avatarPath];
    [cell performSelectorInBackground:@selector(downloadAvatar:) withObject:avatarURL];
    
    // Set username
    cell.userName.text       = [[userInfoDic valueForKey:@"user"] valueForKey:@"username"];
    
    // Get User Photo
    NSString *photoPath     = [[userInfoDic valueForKey:@"images"] valueForKey:@"low_resolution"];
    NSURL    *photoURL      = [NSURL URLWithString:[photoPath valueForKey:@"url"]];
    [cell performSelectorInBackground:@selector(downloadPost:) withObject:photoURL];
    
    return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    self.detailView = nil;
    
    if(!self.detailView) {
        self.detailView = [[DetailViewController alloc] initWithNibName:@"DetailViewController" bundle:nil];
    }
    
    self.detailView.totalLikes = [NSString stringWithFormat:@"%@",[[[feedPostArray objectAtIndex:indexPath.row] valueForKey:@"likes"] valueForKey:@"count"]];
    self.detailView.fullName = [[[feedPostArray objectAtIndex:indexPath.row] valueForKey:@"user"] valueForKey:@"full_name"];
    [self.navigationController pushViewController:self.detailView animated:YES];
}


@end
