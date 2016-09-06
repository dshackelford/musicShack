//
//  MusicViewController.m
//  musicShack
//
//  Created by Dylan Shackelford on 9/5/16.
//  Copyright © 2016 Dylan Shackelford. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "MusicViewController.h"

@implementation MusicViewController

-(void)viewDidLoad
{
    [super viewDidLoad];
    
    screenSize = [UIScreen mainScreen].bounds.size;
    
    albumArtwork = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 4*screenSize.width/5, 4*screenSize.width/5)];
    [self.view addSubview:albumArtwork];
    albumArtwork.backgroundColor = [UIColor lightGrayColor];
    
    songTable = [[UITableView alloc] initWithFrame:CGRectMake(0, 4*screenSize.width/5, screenSize.width, screenSize.height)];
    songTable.delegate = self;
    songTable.dataSource = self;
    songTable.tableFooterView = [[UIView alloc] initWithFrame:CGRectZero];
    songTable.scrollEnabled = NO;
    [self.view addSubview:songTable];
    
    songTableLables = @[@"current Playback timeline",@"Song title",@"Artist",@"Album",@"PlayButtons"];
    
    
    sideBarView = [[SideBarView alloc] initWithFrame:CGRectMake(4*screenSize.width/5, 0, screenSize.width/5,4*screenSize.width/5)];
    [self.view addSubview:sideBarView];
}
-(void)playMusic
{
    MPMediaQuery *songsQuery = [MPMediaQuery songsQuery];
    NSArray *songs = [songsQuery items];
    
    //    int selectedIndex = [[self.tableView indexPathForSelectedRow] row];
    
    MPMediaItem *selectedItem = [[songs objectAtIndex:1] representativeItem];
    
    MPMusicPlayerController *musicPlayer = [MPMusicPlayerController systemMusicPlayer];
    
    [musicPlayer setQueueWithItemCollection:[MPMediaItemCollection collectionWithItems:[songsQuery items]]];
    [musicPlayer setNowPlayingItem:selectedItem];
    
    [musicPlayer play];
}

#pragma mark - Table Delegate
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [songTableLables count];
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.row == 0)
    {
        return 55; //timeline
    }
    else if (indexPath.row < 4)
    {
        return 35; //song info
    }
    else if(indexPath.row >= 4)
    {
        return 100; //play buttons/
    }
    
    return 35;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:@"Cell"];
    
    cell.textLabel.text = [songTableLables objectAtIndex:indexPath.row];
    cell.textLabel.font = [UIFont systemFontOfSize:15];
    [cell setAccessoryType:UITableViewCellAccessoryDisclosureIndicator];
    return cell;
}


@end