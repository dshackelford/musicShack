//
//  SubInfoTableViewController.h
//  musicShack
//
//  Created by Dylan Shackelford on 9/5/16.
//  Copyright © 2016 Dylan Shackelford. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MediaPlayer/MediaPlayer.h>

@interface SubInfoTableViewController : UITableViewController
{
    NSMutableArray* tableData;
    NSMutableArray* sectionData;
    
    int sectionHeader;
    
    NSString* title;
}

-(void)setTableData:(NSMutableArray*)dataInit;
-(void)setSectionData:(NSMutableArray*)dataInit;

-(void)setTitle:(NSString*)titleInit;

@end