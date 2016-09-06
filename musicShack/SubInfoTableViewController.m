//
//  SubInfoTableViewController.m
//  musicShack
//
//  Created by Dylan Shackelford on 9/5/16.
//  Copyright © 2016 Dylan Shackelford. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "SubInfoTableViewController.h"

@implementation SubInfoTableViewController

-(void)viewDidLoad
{
    [super viewDidLoad];
    
    self.navigationItem.title = title;
}

#pragma mark - Setters
-(void)setTableData:(NSMutableArray*)dataInit
{
    tableData = dataInit;
}

-(void)setSectionData:(NSMutableArray*)dataInit
{
    sectionData = dataInit;
}

-(void)setTitle:(NSString *)titleInit
{
    title = titleInit;
}

#pragma mark - TableView Delegate Methods
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return [sectionData count];
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [[tableData objectAtIndex:section] count];
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    if ([[sectionData objectAtIndex:section] isEqualToString:@""])
    {
        return 0;
    }
    else
    {
        return 40;
    }
    
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 35;
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    static NSString *HeaderCellIdentifier = @"Header";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:HeaderCellIdentifier];
    
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:HeaderCellIdentifier];
        cell.textLabel.text = [sectionData objectAtIndex:section];
        cell.textLabel.font = [UIFont boldSystemFontOfSize:20];
    }
    
    
    cell.backgroundColor = [UIColor lightGrayColor];
    return cell;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{

    UITableViewCell *cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"Cell"];
        
    [tableView setSeparatorStyle:UITableViewCellSeparatorStyleSingleLine];
    
    cell.textLabel.text = [[tableData objectAtIndex:indexPath.section] objectAtIndex:indexPath.row];
    [cell setAccessoryType:UITableViewCellAccessoryDisclosureIndicator];
    
    return cell;
}


- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    int selectedRow = indexPath.row;

    
    NSLog(@"touch on row %d", selectedRow);
    
    [[NSNotificationCenter defaultCenter] postNotificationName:@"selectSong" object:nil];
    
}


@end