//
//  AppDelegate.h
//  Instagram_Popular
//
//  Created by Serhat Sezer (Manadigital) on 13.05.2014.
//  Copyright (c) 2014 Serhat Sezer (Manadigital). All rights reserved.
//

#import <UIKit/UIKit.h>
#import "FeedListViewController.h"

@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;
@property (strong, nonatomic) UITableViewController  *popularFeedViewController;
@property (strong, nonatomic) UINavigationController *navController;

@end
