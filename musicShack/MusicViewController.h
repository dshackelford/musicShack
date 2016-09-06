//
//  MusicViewController.h
//  musicShack
//
//  Created by Dylan Shackelford on 9/5/16.
//  Copyright © 2016 Dylan Shackelford. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MediaPlayer/MediaPlayer.h>

#import "SideBarView.h"

@interface MusicViewController : UIViewController <UITableViewDelegate,UITableViewDataSource>
{
    NSString* albumTitle;
    NSString* songTitle;
    NSString* artistTitle;
    UIImageView* albumArtwork;
    
    UITableView* songTable;
    
    CGSize screenSize;
    
    NSArray* songTableLables;
    
    SideBarView* sideBarView;
}

@end