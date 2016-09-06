//
//  SideBarView.m
//  musicShack
//
//  Created by Dylan Shackelford on 9/5/16.
//  Copyright © 2016 Dylan Shackelford. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "SideBarView.h"

@implementation SideBarView

-(id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];

    
    self.backgroundColor = [UIColor grayColor];
    
    [self addImages];
    
    return self;
}


-(void)addImages
{
    double x = self.frame.size.width/2 - self.frame.size.width/6;
    double y = self.frame.size.height/5;
    double offsetY = self.frame.size.width/6;
    
    double width = self.frame.size.width/3;
    double height = width;
    
    shuffleImageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"shuffle.png"]];
    [shuffleImageView setFrame:CGRectMake(x, y - offsetY, width, height)];
    
    repeatImageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"repeat.png"]];
    [repeatImageView setFrame:CGRectMake(x,2*y - offsetY,width,height)];
    
    geniusImageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"genius.png"]];
    [geniusImageView setFrame:CGRectMake(x, 3*y - offsetY, width, height)];
    
    upnextImageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"upnext.png"]];
    [upnextImageView setFrame:CGRectMake(x, 4*y - offsetY, width, height)];
    
    [self addSubview:shuffleImageView];
    [self addSubview:repeatImageView];
    [self addSubview:geniusImageView];
    [self addSubview:upnextImageView];
}


@end