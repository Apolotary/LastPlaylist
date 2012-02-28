//
//  ArtistModel.h
//  LastPlayList
//
//  Created by user on 26.02.12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ArtistModel : NSObject
{
    NSString *name;
    NSString *mbid;
    NSString *url;
    NSMutableArray *tracks;
}

@property (nonatomic, retain) NSString *name;
@property (nonatomic, retain) NSString *mbid;
@property (nonatomic, retain) NSString *url;
@property (nonatomic, retain) NSMutableArray *tracks;

- (void) addTrack:(id) tr;

@end
