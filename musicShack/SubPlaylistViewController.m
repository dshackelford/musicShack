//
//  SubPlaylistViewController.m
//  musicShack
//
//  Created by Dylan Shackelford on 9/11/16.
//  Copyright © 2016 Dylan Shackelford. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "SubPlaylistViewController.h"

@implementation SubPlaylistViewController

-(void)viewDidLoad
{
    [super viewDidLoad];
    
    self.navigationItem.title = title;
}

#pragma mark - Setters
-(void)setTableData:(NSArray*)dataInit
{
    tableData = dataInit;
}

-(void)setSectionData:(NSMutableArray*)dataInit
{
    sectionData = dataInit;
}

-(void)setTitle:(NSString *)titleInit
{
    title = titleInit;
}

-(void)setPlaylist:(MPMediaPlaylist *)playlistInit
{
    playlist = playlistInit;
}

#pragma mark - TableView Delegate Methods
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [tableData count];
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 0;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:@"Cell"];
    
    [tableView setSeparatorStyle:UITableViewCellSeparatorStyleSingleLine];
    
    MPMediaItem* rowItem = [tableData objectAtIndex:indexPath.row];
    
    cell.textLabel.text = [rowItem valueForProperty:MPMediaItemPropertyTitle];
    cell.detailTextLabel.text = [rowItem valueForProperty:MPMediaItemPropertyArtist];
    
    [cell setAccessoryType:UITableViewCellAccessoryDisclosureIndicator];
    
    return cell;
}


- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];

    NSArray *songs = playlist.items;

    MPMediaItem *selectedItem = [[songs objectAtIndex:indexPath.row] representativeItem];
    
    [[NSNotificationCenter defaultCenter] postNotificationName:@"playSong" object:selectedItem];
}


@end