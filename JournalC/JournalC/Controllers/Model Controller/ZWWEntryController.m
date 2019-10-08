//
//  ZWWEntryController.m
//  JournalC
//
//  Created by Zebadiah Watson on 10/7/19.
//  Copyright © 2019 Zebadiah Watson. All rights reserved.
//

#import "ZWWEntryController.h"

@implementation ZWWEntryController

+ (ZWWEntryController *)sharedController
{
    static ZWWEntryController * sharedController = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^ {
        sharedController = [ZWWEntryController new];
    });
    return sharedController;
}

-(instancetype) init
{
    self = [super init];
    if (self) {
        _entries = [NSMutableArray array];
    }
    return self;
}

-(void)addEntryWithTitle:(NSString *)title bodyText:(NSString *)bodyText
{
    ZWWEntry * entryToAdd = [[ZWWEntry alloc] initEntryTitle:title bodyText:bodyText];
    [_entries addObject: entryToAdd];
}

-(void)removeEntry:(ZWWEntry *)entry
{
    [_entries removeObject:entry];
}

-(void)updateEntryWithEntry:(ZWWEntry *)entry title:(NSString *)title bodyText:(NSString *)bodyText
{
    entry.title = title;
    entry.bodyText = bodyText;
}




@end
