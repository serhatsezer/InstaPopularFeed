//
//  DetailViewController.h
//  Instagram_Popular
//
//  Created by serhatsezer on 5/13/14.
//  Copyright (c) 2014 Serhat Sezer (Manadigital). All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DetailViewController : UIViewController

@property (nonatomic,strong) NSString *fullName;
@property (nonatomic,strong) NSString *totalLikes;
@property (nonatomic,weak) IBOutlet UILabel *userLabel;

@end
