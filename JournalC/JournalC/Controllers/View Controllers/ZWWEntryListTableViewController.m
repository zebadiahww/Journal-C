//
//  ZWWEntryListTableViewController.m
//  JournalC
//
//  Created by Zebadiah Watson on 10/7/19.
//  Copyright © 2019 Zebadiah Watson. All rights reserved.
//

#import "ZWWEntryListTableViewController.h"
#import <UIKit/UIKit.h>
#import "ZWWEntry.h"
#import "ZWWEntryController.h"
#import "ZWWDetailViewController.h"

@interface ZWWEntryListTableViewController ()

@end

@implementation ZWWEntryListTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [[ZWWEntryController sharedController] loadFromPersistentStore];
    
    NSLog(@"");
}
- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:true];
    [[self tableView] reloadData];
//    [[ZWWEntryController sharedController] loadFromPersistentStore];

}



#pragma mark - Table view data source

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return ZWWEntryController.sharedController.entries.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"entryCell" forIndexPath:indexPath];
    ZWWEntry * entry = ZWWEntryController.sharedController.entries[indexPath.row];
    cell.textLabel.text = entry.title;
    
    

    return cell;
}

// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        ZWWEntry * entry = ZWWEntryController.sharedController.entries[indexPath.row];
        [ZWWEntryController.sharedController removeEntry:entry];
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    }
}


#pragma mark - Navigation

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([segue.identifier isEqualToString:@"toViewEntry"]) {
        
        NSIndexPath *indexPath = [self.tableView indexPathForCell:sender];
        ZWWEntry *entry = [ZWWEntryController sharedController].entries[indexPath.row];
        
        ZWWDetailViewController *detailViewController = segue.destinationViewController;
        detailViewController.entry = entry;
    }
}

@end
