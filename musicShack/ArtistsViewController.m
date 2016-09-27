//
//  ArtistsViewController.m
//  musicShack
//
//  Created by Dylan Shackelford on 9/5/16.
//  Copyright © 2016 Dylan Shackelford. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ArtistsViewController.h"

@implementation ArtistsViewController

-(void)viewDidLoad
{
    self.title = @"ARTISTS";
    
    MPMediaQuery *songsQuery = [MPMediaQuery artistsQuery];
    artists = [[NSArray alloc] init];
    artists = [songsQuery collections];
    
    [super viewDidLoad];
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [artists count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:@"Cell"];
    
    MPMediaItem *rowItem = [[artists objectAtIndex:indexPath.row] representativeItem];
    
    cell.textLabel.text = [rowItem valueForProperty:MPMediaItemPropertyArtist];

    [cell setAccessoryType:UITableViewCellAccessoryDisclosureIndicator];
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    self.selectedIndex = indexPath.row;
    
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    //show albums by artists
    [self performSegueWithIdentifier:@"showAlbumsByArtist" sender:self];
    
}

//use this for passing information to the new view controller
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    //segmented control settings
    if ([segue.identifier isEqualToString:@"showAlbumsByArtist"])
    {
        SubInfoTableViewController *destViewController = segue.destinationViewController;
        
//        NSMutableArray* arr =[[NSMutableArray alloc] initWithArray: @[@"hell",@"woah",@"heavan"]];
        
//        [destViewController setTableData:arr];
        
        NSString* title = [[[artists objectAtIndex:self.selectedIndex] representativeItem] valueForProperty:MPMediaItemPropertyArtist];
        
        NSLog(@"%@",title);
        [destViewController setTitle:title];
        
        
        //now to find the songs by the artists
        MPMediaQuery *albumsQuery = [MPMediaQuery albumsQuery];
        [albumsQuery addFilterPredicate: [MPMediaPropertyPredicate predicateWithValue:title forProperty:MPMediaItemPropertyArtist]];
        NSArray* albums = [albumsQuery collections];
        
        
        NSMutableArray* sectionData = [[NSMutableArray alloc] init];
        NSMutableArray* tableData = [[NSMutableArray alloc] init];
        
        for (int i = 0; i < [albums count]; i++)
        {
            [sectionData addObject:[[[albums objectAtIndex:i] representativeItem] valueForProperty: MPMediaItemPropertyAlbumTitle]];
            
            NSMutableArray* albumSongs = [[NSMutableArray alloc] init];
            
            MPMediaQuery *songsQuery = [MPMediaQuery songsQuery];
            [songsQuery addFilterPredicate: [MPMediaPropertyPredicate predicateWithValue:title forProperty:MPMediaItemPropertyArtist]];
            [songsQuery addFilterPredicate:[MPMediaPropertyPredicate predicateWithValue:[sectionData objectAtIndex:i] forProperty:MPMediaItemPropertyAlbumTitle]];
            
            NSArray* songs = [songsQuery items];
            
            for (int i = 0; i < [songs count]; i++)
            {
                [albumSongs addObject:[[songs objectAtIndex:i] valueForProperty: MPMediaItemPropertyTitle]];
            }

            [tableData addObject:albumSongs];
        }
        
        [destViewController setSectionData:sectionData];
        
        [destViewController setTableData:tableData];
        
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
    

@end
