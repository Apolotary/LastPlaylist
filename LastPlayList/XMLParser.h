//
//  XMLParser.h
//  Formularium
//
//  Created by user on 25.02.12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "TBXML.h"
#import "ArtistModel.h"
#import "TrackModel.h"

@interface XMLParser : NSObject <NSURLConnectionDelegate, NSURLConnectionDataDelegate>
{
    TBXML *mainParser;
    ArtistModel *currentArtist;
    TrackModel *currentTrack;
    BOOL artistFound;
}

@property (nonatomic, retain) ArtistModel *currentArtist;

+(XMLParser *) sharedInstance;
- (void) parseFileAtURL:(NSURL *) fileURL;
- (void) parseFileNamed:(NSString *) fileName;
- (void) parseXMLData:(NSData *) data;

@end
