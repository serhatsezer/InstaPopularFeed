//
//  FeedPhotoItemTableViewCell.m
//  Instagram_Popular
//
//  Created by serhatsezer on 5/13/14.
//  Copyright (c) 2014 Serhat Sezer (Manadigital). All rights reserved.
//

#import "FeedPhotoItemTableViewCell.h"

@implementation FeedPhotoItemTableViewCell
@synthesize userImageView,userName,photoItemImageView;

- (void)downloadAvatar:(NSURL *)url
{
    NSData  *avatarData = [NSData dataWithContentsOfURL:url];
    UIImage *image      = [UIImage imageWithData:avatarData];
    [self performSelectorOnMainThread:@selector(updateAvatarWithImage:) withObject:image waitUntilDone:YES];
}

- (void) updateAvatarWithImage : (UIImage *)image
{
    userImageView.image = image;
}

- (void)downloadPost:(NSURL *)url
{
    NSData  *postData    = [NSData dataWithContentsOfURL:url];
    UIImage *image       = [UIImage imageWithData:postData];
    
    [self performSelectorOnMainThread:@selector(updatePostWithImage:) withObject:image waitUntilDone:YES];
}

- (void) updatePostWithImage : (UIImage *) image
{
    photoItemImageView.image = image;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];
}

@end
