//
//  AsyncImage.h
//  LastPlayList
//
//  Created by user on 28.02.12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface AsyncImage : UIImageView
{
    NSMutableData *receivedData;   
}


- (id)initWithURL:(NSURL *)url;
- (void)loadWithURL:(NSURL *)url;


@end
