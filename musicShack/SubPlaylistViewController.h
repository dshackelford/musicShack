//
//  SubPlaylistViewController.h
//  musicShack
//
//  Created by Dylan Shackelford on 9/11/16.
//  Copyright © 2016 Dylan Shackelford. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MediaPlayer/MediaPlayer.h>


@interface SubPlaylistViewController : UITableViewController
{
    NSArray* tableData;
    NSMutableArray* sectionData;
    
    MPMediaPlaylist* playlist;
    
    int sectionHeader;
    
    NSString* title;
}

-(void)setTableData:(NSArray*)dataInit;

-(void)setSectionData:(NSMutableArray*)dataInit;

-(void)setTitle:(NSString*)titleInit;

-(void)setPlaylist:(MPMediaPlaylist*)playlistInit;

@end