//
//  PlaylistsViewController.m
//  musicShack
//
//  Created by Dylan Shackelford on 9/5/16.
//  Copyright © 2016 Dylan Shackelford. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "PlaylistsViewController.h"

@implementation PlaylistsViewController

-(void)viewDidLoad
{
    self.title = @"PLAYLISTS";
    [super viewDidLoad];
    
    MPMediaQuery *query = [MPMediaQuery playlistsQuery];
    playlists = [query collections];
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [playlists count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:@"Cell"];
    
    MPMediaItem *rowItem = [playlists objectAtIndex:indexPath.row];
    
    cell.textLabel.text = [rowItem valueForProperty:MPMediaPlaylistPropertyName];
    [cell setAccessoryType:UITableViewCellAccessoryDisclosureIndicator];
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    self.selectedIndex = indexPath.row;
    
    [tableView deselectRowAtIndexPath:indexPath animated:YES]; //show albums by artists
    [self performSegueWithIdentifier:@"showPlaylist" sender:self];
    
}

//use this for passing information to the new view controller
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    //segmented control settings
    if ([segue.identifier isEqualToString:@"showPlaylist"])
    {
        MPMediaPlaylist* aPlaylist = [playlists objectAtIndex:_selectedIndex];

        SubPlaylistViewController *destViewController = segue.destinationViewController;

        [destViewController setTitle:aPlaylist.name];
        [destViewController setTableData:aPlaylist.items];
        [destViewController setPlaylist:aPlaylist];
    }
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end