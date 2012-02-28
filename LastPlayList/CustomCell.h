//
//  CustomCell.h
//  LastPlayList
//
//  Created by user on 27.02.12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CustomCell : UITableViewCell
{
    IBOutlet UIImageView *albumCover;
    IBOutlet UILabel *trackName;
    IBOutlet UILabel *artistAndAlbum;
    IBOutlet UILabel *duration;
    IBOutlet UILabel *playCount;
}

@property (nonatomic, retain) UIImageView *albumCover;
@property (nonatomic, retain) UILabel *trackName;
@property (nonatomic, retain) UILabel *artistAndAlbum;
@property (nonatomic, retain) UILabel *duration;
@property (nonatomic, retain) UILabel *playCount;

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier;

@end
