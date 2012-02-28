//
//  FirstViewController.h
//  LastPlayList
//
//  Created by user on 26.02.12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "XMLParser.h"
#import "FMEngine.h"
#import "CustomCell.h"
#import "AsyncImage.h"

@interface FirstViewController : UIViewController <UITableViewDelegate, UITableViewDataSource>
{
    IBOutlet UITableView *table;
    ArtistModel *artist;
}

@end
