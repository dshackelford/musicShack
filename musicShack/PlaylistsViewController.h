//
//  PlaylistsViewController.h
//  musicShack
//
//  Created by Dylan Shackelford on 9/5/16.
//  Copyright © 2016 Dylan Shackelford. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MediaPlayer/MediaPlayer.h>

#import "SubPlaylistViewController.h"

@interface PlaylistsViewController : UITableViewController
{
    NSArray* playlists;
}

@property int selectedIndex;

@end