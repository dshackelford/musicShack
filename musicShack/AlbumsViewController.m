//
//  AlbumsViewController.m
//  musicShack
//
//  Created by Dylan Shackelford on 9/5/16.
//  Copyright © 2016 Dylan Shackelford. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "AlbumsViewController.h"

@implementation AlbumsViewController

-(void)viewDidLoad
{
    self.title = @"ALBUMS";
    [super viewDidLoad];
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    MPMediaQuery *songsQuery = [MPMediaQuery albumsQuery];
    NSArray *songs = [songsQuery collections];
    
    return [songs count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:@"Cell"];
    
    MPMediaQuery *songsQuery = [MPMediaQuery albumsQuery];
    NSArray *songs = [songsQuery collections];
    
    MPMediaItem *rowItem = [[songs objectAtIndex:indexPath.row] representativeItem];
    
    cell.textLabel.text = [rowItem valueForProperty:MPMediaItemPropertyAlbumTitle];
    [cell setAccessoryType:UITableViewCellAccessoryDisclosureIndicator];
    return cell;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
