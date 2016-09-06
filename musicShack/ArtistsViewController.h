//
//  ArtistisViewController.h
//  musicShack
//
//  Created by Dylan Shackelford on 9/5/16.
//  Copyright © 2016 Dylan Shackelford. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MediaPlayer/MediaPlayer.h>

#import "SubInfoTableViewController.h"

@interface ArtistsViewController : UITableViewController
{
    NSArray* artists;
}

@property int selectedIndex;

@end