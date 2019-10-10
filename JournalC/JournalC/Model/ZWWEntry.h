//
//  Entry.h
//  JournalC
//
//  Created by Zebadiah Watson on 10/7/19.
//  Copyright © 2019 Zebadiah Watson. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface ZWWEntry : NSObject

@property (nonatomic, copy) NSString * title;
@property (nonatomic, copy) NSString * bodyText;
@property (nonatomic, copy, readonly) NSDate * timestamp;

- (instancetype)initWithDictionary:(NSDictionary *)dictionary;

- (instancetype)initEntryTitle: (NSString *)title
                      bodyText:(NSString *)bodytext;

- (NSDictionary *)dictionaryCopy ;

@end

NS_ASSUME_NONNULL_END
