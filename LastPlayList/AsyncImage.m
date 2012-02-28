//
//  AsyncImage.m
//  LastPlayList
//
//  Created by user on 28.02.12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "AsyncImage.h"

@implementation AsyncImage

- (id)initWithURL:(NSURL *)url
{
    self = [self init];
    
    if (self)
    {
	    receivedData = [[NSMutableData alloc] init];
        [self loadWithURL:url];
    }
    
    return self;
}

- (void)connection:(NSURLConnection *)connection didReceiveResponse:(NSURLResponse *)response
{
    [receivedData setLength:0];
}

-(void)connection:(NSURLConnection *)connection didReceiveData:(NSData *)data
{
    [receivedData appendData:data];
}

- (void)loadWithURL:(NSURL *)url    
{
    NSLog(@"loading: %@", url);
	self.alpha = 0;
    NSURLConnection *connection = [NSURLConnection connectionWithRequest:[NSURLRequest requestWithURL:url]delegate:self];
    [connection start];
}

- (void)connectionDidFinishLoading:(NSURLConnection *)connection
{
    NSLog(@"done");
    self.image = [[UIImage alloc] initWithData:receivedData];
    [UIView beginAnimations:@"fadeIn" context:NULL];
    [UIView setAnimationDuration:0.5];
    self.alpha = 1.0;
    [UIView commitAnimations];
}


@end
