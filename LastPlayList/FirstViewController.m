//
//  FirstViewController.m
//  LastPlayList
//
//  Created by user on 26.02.12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "FirstViewController.h"

@implementation FirstViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        self.title = NSLocalizedString(@"First", @"First");
        self.tabBarItem.image = [UIImage imageNamed:@"first"];
    }
    return self;
}
							
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Release any cached data, images, etc that aren't in use.
}

#pragma mark - Table methods

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {

    return 1;
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    return [artist.tracks count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Cell";
    CustomCell *cell = (CustomCell *)[tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil)
    {
        NSArray* results =  [[NSBundle mainBundle] loadNibNamed:@"CustomCellView" owner:self options:nil];
        for(id obj in results)
        {
            if([obj isKindOfClass:[CustomCell class]])
            {
                cell = obj;
                break;
            }
        }
    }
    
    TrackModel *tr = [artist.tracks objectAtIndex:indexPath.row];
    
    cell.trackName.text = tr.name;
    cell.artistAndAlbum.text = [NSString stringWithFormat:@"by %@", artist.name];
    cell.playCount.text = [NSString stringWithFormat:@"Playcount: %@", tr.playcount];
    
    int playtime = [tr.duration intValue];
    int mins = playtime / 60;
    int seconds = playtime - mins * 60;
    
    cell.duration.text = [NSString stringWithFormat:@"%02i:%02i", mins, seconds];

    AsyncImage *img = [[[AsyncImage alloc] initWithURL:[NSURL URLWithString:tr.imageURL]] autorelease];
        
    [cell addSubview:img];
    [img setFrame:cell.albumCover.frame];
    
    [cell.albumCover setHidden:YES];
    [img setHidden:NO];
    
    return cell;
}

#pragma mark - View lifecycle

- (void)viewDidLoad
{
    [super viewDidLoad];
	
    FMEngine *eng = [[FMEngine alloc] init];
    NSError *error;
    NSData *data = [eng dataForMethod:@"artist.getTopTracks"
                       withParameters:
                    [NSDictionary dictionaryWithObjectsAndKeys:@"Electric%20Wizard", @"artist", @"cf53f4cace5386de5918d2a486a0b8fe", @"api_key", nil] 
                         useSignature:YES 
                           httpMethod:@"GET" 
                                error:error];
    
    // NSLog(@"%@", [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding]);
    
    XMLParser *parser = [XMLParser sharedInstance];
    [parser parseXMLData:data];
    
    artist = parser.currentArtist;
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
}

- (void)viewWillDisappear:(BOOL)animated
{
	[super viewWillDisappear:animated];
}

- (void)viewDidDisappear:(BOOL)animated
{
	[super viewDidDisappear:animated];
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    return (interfaceOrientation != UIInterfaceOrientationPortraitUpsideDown);
}

@end
