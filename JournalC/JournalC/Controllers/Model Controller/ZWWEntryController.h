//
//  ZWWEntryController.h
//  JournalC
//
//  Created by Zebadiah Watson on 10/7/19.
//  Copyright © 2019 Zebadiah Watson. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ZWWEntry.h"

NS_ASSUME_NONNULL_BEGIN

@interface ZWWEntryController : NSObject

+(ZWWEntryController *) sharedController;

@property (nonatomic, copy) NSMutableArray<ZWWEntry * > * entries;

- (void)addEntryWithTitle: (NSString*)title bodyText:(NSString *)bodyText;
- (void)removeEntry:(ZWWEntry *)entry;
- (void)updateEntryWithEntry:(ZWWEntry *)entry title:(NSString *)title bodyText:(NSString *)bodyText;
- (void)loadFromPersistentStore;

@end

NS_ASSUME_NONNULL_END
