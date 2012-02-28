//
//  CustomCell.m
//  LastPlayList
//
//  Created by user on 27.02.12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "CustomCell.h"

@implementation CustomCell

@synthesize albumCover;
@synthesize trackName;
@synthesize artistAndAlbum;
@synthesize duration;
@synthesize playCount;

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
//        albumCover = [[UIImageView alloc] init];
//        trackName = [[UILabel alloc] init];
//        artistAndAlbum = [[UILabel alloc] init];
//        duration = [[UILabel alloc] init];
//        playCount = [[UILabel alloc] init];
    }
    return self;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
