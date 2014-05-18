//
//  FeedPhotoItemTableViewCell.h
//  Instagram_Popular
//
//  Created by serhatsezer on 5/13/14.
//  Copyright (c) 2014 Serhat Sezer (Manadigital). All rights reserved.
//

#import <UIKit/UIKit.h>

@interface FeedPhotoItemTableViewCell : UITableViewCell

@property (weak, nonatomic) IBOutlet UIImageView *userImageView;
@property (weak, nonatomic) IBOutlet UIImageView *photoItemImageView;
@property (weak, nonatomic) IBOutlet UILabel *userName;

- (void) downloadAvatar:(NSURL *)url;
- (void) downloadPost:(NSURL *)url;

@end
