//
//  ArtistModel.m
//  LastPlayList
//
//  Created by user on 26.02.12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "ArtistModel.h"

@implementation ArtistModel

@synthesize name;
@synthesize mbid;
@synthesize url;
@synthesize tracks;

- (id)init {
    self = [super init];
    if (self) {
        tracks = [[NSMutableArray alloc] init];
    }
    return self;
}

- (void)dealloc {
    [tracks release];
    [super dealloc];
}

- (void) addTrack:(id) tr
{
    [tracks addObject:tr];
}

@end
