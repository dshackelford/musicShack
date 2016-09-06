//
//  MainTabBarController.m
//  musicShack
//
//  Created by Dylan Shackelford on 9/5/16.
//  Copyright © 2016 Dylan Shackelford. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "MainTabBarController.h"

@implementation MainTabBarController

-(void)viewDidLoad
{
    [super viewDidLoad];
    
    self.selectedIndex = 0;
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(didSelectSong:) name:@"selectSong" object:nil];
}

-(void)didSelectSong:(id)sender
{
    NSLog(@"tried to move");
    self.selectedIndex = 0;
}

@end