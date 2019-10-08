//
//  Entry.m
//  JournalC
//
//  Created by Zebadiah Watson on 10/7/19.
//  Copyright © 2019 Zebadiah Watson. All rights reserved.
//

#import "ZWWEntry.h"

NS_ASSUME_NONNULL_BEGIN

@implementation ZWWEntry : NSObject

- (instancetype)initEntryTitle:(NSString *)title bodyText:(NSString *)bodytext
{
    self = [super init];
    if (self != nil) {
        _title = title;
        _bodyText = bodytext;
        _timeStamp = [NSDate date];
    }
    return self;
}


@end

NS_ASSUME_NONNULL_END
