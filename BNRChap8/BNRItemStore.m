//
//  BNRItemStore.m
//  BNRChap8
//
//  Created by Douglas Voss on 4/15/15.
//  Copyright (c) 2015 Doug. All rights reserved.
//

#import "BNRItemStore.h"
#import "BNRItem.h"

@interface BNRItemStore ()

@property (nonatomic) NSMutableArray *privateItemsGreaterOrThanEqualTo50;
@property (nonatomic) NSMutableArray *privateItemsLessThan50;

@end

@implementation BNRItemStore

+ (instancetype)sharedStore
{
    static BNRItemStore *sharedStore;
    
    if (!sharedStore) {
        sharedStore = [[self alloc] initPrivate];
    }
    
    return sharedStore;
}

- (instancetype)init
{
    [NSException raise:@"Singleton"
                format:@"Use +[BNRItemStore sharedStore]"];
    return nil;
}

- (instancetype)initPrivate
{
    self = [super init];
    if (self) {
        _privateItemsGreaterOrThanEqualTo50 = [[NSMutableArray alloc] init];
        _privateItemsLessThan50 = [[NSMutableArray alloc] init];
    }
    return self;
}

- (NSArray *)itemsGreaterThanOrEqualTo50
{
    return [self.privateItemsGreaterOrThanEqualTo50 copy];
}

- (NSArray *)itemsLessThan50
{
    return [self.privateItemsLessThan50 copy];
}

- (BNRItem *)createItem
{
    BNRItem *item = [BNRItem randomItem];
    
    if (item.valueInDollars >= 50) {
        [self.privateItemsGreaterOrThanEqualTo50 addObject:item];
    } else {
        [self.privateItemsLessThan50 addObject:item];
    }
    
    return item;
}

@end
