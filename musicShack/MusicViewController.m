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
    
    isPlaying = NO;
    
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
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(playSong:) name:@"playSong" object:nil];
    
    musicPlayer = [MPMusicPlayerController systemMusicPlayer];
    
}

-(void)playSong:(NSNotification*)notification
{
    MPMediaItem* selectedSong = notification.object;
    [musicPlayer setNowPlayingItem:selectedSong];
    [musicPlayer play];
    
    isPlaying = YES;
}

-(void)viewWillAppear:(BOOL)animated
{
    if(isPlaying)
    {
        UIImage *albumArtworkImage = NULL;
        MPMediaItemArtwork *itemArtwork = musicPlayer.nowPlayingItem.artwork;
        
        if (itemArtwork != nil)
        {
            albumArtworkImage = [itemArtwork imageWithSize:albumArtwork.frame.size];
             albumArtwork.image = albumArtworkImage;
        }
        else
        { // no album artwork
            NSLog(@"No ALBUM ARTWORK");
        }
        
        songTitle = musicPlayer.nowPlayingItem.title;
        artistTitle = musicPlayer.nowPlayingItem.artist;
        albumTitle = musicPlayer.nowPlayingItem.albumTitle;
        
        [songTable reloadData];
    }
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
    
    if (indexPath.row == 1)
    {
        cell.textLabel.text = songTitle;
    }
    else if(indexPath.row == 2)
    {
        cell.textLabel.text = artistTitle;
    }
    else if(indexPath.row == 3)
    {
        cell.textLabel.text = albumTitle;
    }
    
    cell.textLabel.font = [UIFont systemFontOfSize:15];
    [cell setAccessoryType:UITableViewCellAccessoryDisclosureIndicator];
    return cell;
}


@end