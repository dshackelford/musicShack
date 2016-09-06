//
//  SongsViewController.m
//  musicShack
//
//  Created by Dylan Shackelford on 9/4/16.
//  Copyright © 2016 Dylan Shackelford. All rights reserved.
//

#import "SongsViewController.h"


@implementation SongsViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.title = @"SONGS";
    // Do any additional setup after loading the view, typically from a nib.
}


- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    MPMediaQuery *songsQuery = [MPMediaQuery songsQuery];
    NSArray *songs = [songsQuery items];
    
    return [songs count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:@"Cell"];
    
    // Configure the cell...
    
    MPMediaQuery *songsQuery = [MPMediaQuery songsQuery];
    NSArray *songs = [songsQuery items];
    
    MPMediaItem *rowItem = [songs objectAtIndex:indexPath.row];
    
    cell.textLabel.text = [rowItem valueForProperty:MPMediaItemPropertyTitle];
    cell.detailTextLabel.text = [rowItem valueForProperty:MPMediaItemPropertyArtist];
    [cell setAccessoryType:UITableViewCellAccessoryDisclosureIndicator];
    return cell;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
