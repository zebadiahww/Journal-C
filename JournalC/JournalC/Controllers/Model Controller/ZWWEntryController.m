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

- (void)addEntryWithTitle:(NSString *)title bodyText:(NSString *)bodyText
{
    ZWWEntry *entry = [[ZWWEntry alloc] initEntryTitle:title bodyText:bodyText];
    [self.entries addObject:entry];
    [self saveToPersistentStore];
    
}

-(void)removeEntry:(ZWWEntry *)entry
{
    [_entries removeObject:entry];
    [self saveToPersistentStore];
}

-(void)updateEntryWithEntry:(ZWWEntry *)entry title:(NSString *)title bodyText:(NSString *)bodyText
{
    entry.title = title;
    entry.bodyText = bodyText;
    [self saveToPersistentStore];
}
- (void)saveToPersistentStore {
    
    NSMutableArray *entriesToSave = [NSMutableArray<NSDictionary *> new];
    
    for (ZWWEntry *entry in self.entries) {
        [entriesToSave addObject:[entry dictionaryCopy]];
    }
    
    NSError *error = nil;
    NSData *jsonData = [NSJSONSerialization dataWithJSONObject:entriesToSave
                                                       options:kNilOptions
                                                         error:&error];
    if (error) {
        NSLog(@"Unable to convert entries to JSON: %@", error);
        return;
    }
    
    NSURL *url = [ZWWEntryController persistentStoreFileURL];
    [jsonData writeToURL:url atomically:YES];
}

- (void)loadFromPersistentStore {
    NSURL *url = [ZWWEntryController persistentStoreFileURL];
    NSError *error;
    NSData *data = [NSData dataWithContentsOfURL:url options:kNilOptions error:&error];
    
    if (error) {
        NSLog(@"Error loading JSON data from file: %@", error);
        return;
    }
    
    NSArray *rawEntries = [NSJSONSerialization JSONObjectWithData:data options:kNilOptions error:&error];
    
    if (error) {
        NSLog(@"Error converting JSON data to NSObject: %@", error);
        return;
    }
    
    NSMutableArray *newEntries = [NSMutableArray new];
    
    for (NSDictionary *entryDict in rawEntries) {
        ZWWEntry *entry = [[ZWWEntry alloc] initWithDictionary:entryDict];
        
        if (entry) {
            [newEntries addObject:entry];
        }
    }
    
    self.entries = newEntries;
}

+ (NSURL *)persistentStoreFileURL {
    NSArray<NSURL *> *urls = [[NSFileManager defaultManager] URLsForDirectory:NSDocumentDirectory
                                                                    inDomains:NSUserDomainMask];
    return [urls[0] URLByAppendingPathComponent:@"journal.json"];
}




@end
