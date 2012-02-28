//
//  TrackModel.h
//  LastPlayList
//
//  Created by user on 26.02.12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface TrackModel : NSObject
{
    NSString *name;
    NSString *duration;
    NSString *playcount;
    NSString *listeners;
    NSString *url;
    NSString *imageURL;
    int rank;
}

@property (nonatomic, retain) NSString *name;
@property (nonatomic, retain) NSString *duration;
@property (nonatomic, retain) NSString *playcount;
@property (nonatomic, retain) NSString *listeners;
@property (nonatomic, retain) NSString *url;
@property (nonatomic, retain) NSString *imageURL;
@property int rank;

@end
