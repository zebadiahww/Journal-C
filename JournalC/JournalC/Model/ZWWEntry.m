//
//  Entry.m
//  JournalC
//
//  Created by Zebadiah Watson on 10/7/19.
//  Copyright © 2019 Zebadiah Watson. All rights reserved.
//

#import "ZWWEntry.h"

NS_ASSUME_NONNULL_BEGIN

static NSString *const TimestampKey = @"timestamp";
static NSString *const TitleKey = @"title";
static NSString *const BodyTextKey = @"bodyText";

@implementation ZWWEntry : NSObject

- (instancetype)initEntryTitle:(NSString *)title bodyText:(NSString *)bodytext
{
    self = [super init];
    if (self != nil) {
        _title = title;
        _bodyText = bodytext;
        _timestamp = [NSDate date];
    }
    return self;
}
- (instancetype)initWithDictionary:(NSDictionary *)dictionary {
    self = [super init];
    
    if (dictionary[TitleKey] == nil || dictionary[BodyTextKey] == nil || dictionary[TimestampKey] == nil) {
        return nil;
    }
    
    if (self) {
        _title = dictionary[TitleKey];
        _bodyText = dictionary[BodyTextKey];
        NSTimeInterval timeInterval = [dictionary[TimestampKey] doubleValue];
        _timestamp = [NSDate dateWithTimeIntervalSince1970:timeInterval];
    }
    
    return self;
}

- (NSDictionary *)dictionaryCopy {
    NSMutableDictionary *dict = [NSMutableDictionary new];
    
    dict[TitleKey] = self.title;
    dict[BodyTextKey] = self.bodyText;
    dict[TimestampKey] = [NSNumber numberWithFloat:[self.timestamp timeIntervalSince1970]];
    
    return [dict copy];
}


@end

NS_ASSUME_NONNULL_END
