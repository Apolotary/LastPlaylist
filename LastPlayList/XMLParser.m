//
//  XMLParser.m
//  Formularium
//
//  Created by user on 25.02.12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "XMLParser.h"

@implementation XMLParser

@synthesize currentArtist;

static XMLParser *_sharedInstance = nil;

static void singleton_remover() {
    if (_sharedInstance) {
        [_sharedInstance release];
    }
}

- (id)init {
    self = [super init];
    if (self) {
        
    }
    return self;
}

- (void)dealloc {
    [super dealloc];
}

+(XMLParser *) sharedInstance
{
    if (!_sharedInstance) {
        _sharedInstance = [[XMLParser alloc] init];        
        atexit(singleton_remover);
    }
    return _sharedInstance;
}


- (void)traverseElement:(TBXMLElement *) element
{   
    NSLog(@"TRAVERSE");
    do {
        // Display the name of the element
        NSLog(@"%@",[TBXML elementName:element]);
        
        
        if([[TBXML elementName:element] isEqualToString:@"artist"] && !artistFound)
        {
            currentArtist.name = [TBXML textForElement:element->firstChild];
            currentArtist.mbid = [TBXML textForElement:element->firstChild->nextSibling];
            currentArtist.url = [TBXML textForElement:element->firstChild->nextSibling->nextSibling];
            artistFound = YES;
        }
        else if ([[TBXML elementName:element] isEqualToString:@"track"])
        {
            if(currentTrack)
            {
                [currentArtist addTrack:currentTrack];
                [currentTrack release];
            }
            currentTrack = [[TrackModel alloc] init];
            currentTrack.name = [TBXML textForElement:element->firstChild];
        }
        else if ([[TBXML elementName:element] isEqualToString:@"duration"])
        {
            currentTrack.duration = [TBXML textForElement:element];
        }
        else if ([[TBXML elementName:element] isEqualToString:@"playcount"])
        {
            currentTrack.playcount = [TBXML textForElement:element];
        }
        else if ([[TBXML elementName:element] isEqualToString:@"url"])
        {
            currentTrack.url = [TBXML textForElement:element];
        }
        else if ([[TBXML elementName:element] isEqualToString:@"listeners"])
        {
            currentTrack.listeners = [TBXML textForElement:element];
        }
        
        // Obtain first attribute from element
        TBXMLAttribute * attribute = element->firstAttribute;
        
        // if attribute is valid
        while (attribute) {
            // Display name and value of attribute to the log window
            NSLog(@"%@->%@ = %@",
                  [TBXML elementName:element],
                  [TBXML attributeName:attribute],
                  [TBXML attributeValue:attribute]);
            
            if ([[TBXML elementName:element] isEqualToString:@"track"])
            {
                if ([[TBXML attributeName:attribute] isEqualToString:@"rank"])
                {
                    currentTrack.rank = [[TBXML attributeValue:attribute] intValue];
                }
            }
            if ([[TBXML elementName:element] isEqualToString:@"image"])
            {
                if ([[TBXML attributeValue:attribute] isEqualToString:@"extralarge"])
                {
                    currentTrack.imageURL = [TBXML textForElement:element];
                }
            }
                                    
            // Obtain the next attribute
            attribute = attribute->next;
        }
        // if the element has child elements, process them
        if (element->firstChild) 
            [self traverseElement:element->firstChild];
        
        // Obtain next sibling element
    } while ((element = element->nextSibling));  
}

- (void) parseFileNamed:(NSString *) fileName
{
    NSError *error;
    mainParser = [[TBXML alloc] initWithXMLFile:fileName error:&error];
    
    if (mainParser.rootXMLElement)
    {
        [self traverseElement:mainParser.rootXMLElement];
    }
}

- (void) parseXMLData:(NSData *) data
{
    NSError *error;
    mainParser = [[TBXML alloc] initWithXMLData:data error:&error];
    if (currentArtist)
    {
        [currentArtist release];
    }
    currentArtist = [[ArtistModel alloc] init];
    artistFound = NO;
    
    if (mainParser.rootXMLElement)
    {
        [self traverseElement:mainParser.rootXMLElement];
    }
}

- (void) parseFileAtURL:(NSURL *) fileURL
{
//    NSURLRequest *req = [[NSURLRequest alloc] initWithURL:fileURL];
//    NSURLConnection *getXml = [[NSURLConnection alloc] initWithRequest:req delegate:self];
//    [getXml start];
    //[req release];
}

- (void)connection:(NSURLConnection *)connection didReceiveData:(NSData *)data
{
    NSLog(@"%@", [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding]);
    NSError *error;
    mainParser = [[TBXML alloc] initWithXMLData:data error:&error];
    
    if (mainParser.rootXMLElement)
    {
        [self traverseElement:mainParser.rootXMLElement];
    }
}


@end
