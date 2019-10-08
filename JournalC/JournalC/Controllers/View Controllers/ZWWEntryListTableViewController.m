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

@interface ZWWEntryListTableViewController ()

@end

@implementation ZWWEntryListTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];

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
    }
}


#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}


@end
