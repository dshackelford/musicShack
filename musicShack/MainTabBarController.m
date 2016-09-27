//
//  MainTabBarController.m
//  musicShack
//
//  Created by Dylan Shackelford on 9/5/16.
//  Copyright © 2016 Dylan Shackelford. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "MainTabBarController.h"
#import <MediaPlayer/MediaPlayer.h>

@implementation MainTabBarController

-(void)viewDidLoad
{
    [super viewDidLoad];
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(didSelectSong:) name:@"selectSong" object:nil];
    
    MPMusicPlayerController *musicPlayer;
    musicPlayer = [MPMusicPlayerController systemMusicPlayer];
    
//    if(musicPlayer.nowPlayingItem == nil)
//    {
//        self.selectedIndex = 1;
//    }
//    else
//    {
//        self.selectedIndex = 0;
//    }
}

-(void)didSelectSong:(id)sender
{
    NSLog(@"tried to move");
    self.selectedIndex = 0;
}

@end
