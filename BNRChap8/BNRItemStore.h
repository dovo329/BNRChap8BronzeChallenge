//
//  BNRItemStore.h
//  BNRChap8
//
//  Created by Douglas Voss on 4/15/15.
//  Copyright (c) 2015 Doug. All rights reserved.
//

#import <Foundation/Foundation.h>

@class BNRItem;

@interface BNRItemStore : NSObject

@property (nonatomic, readonly, copy) NSArray *allItems;

+ (instancetype)sharedStore;
- (BNRItem *)createItem;
- (NSArray *)itemsLessThan50;
- (NSArray *)itemsGreaterThanOrEqualTo50;

@end
