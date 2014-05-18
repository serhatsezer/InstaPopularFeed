//
//  DetailViewController.m
//  Instagram_Popular
//
//  Created by serhatsezer on 5/13/14.
//  Copyright (c) 2014 Serhat Sezer (Manadigital). All rights reserved.
//

#import "DetailViewController.h"

@interface DetailViewController ()

@end

@implementation DetailViewController
@synthesize userLabel,totalLikes,fullName;

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.title = fullName;
    userLabel.text = totalLikes;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
