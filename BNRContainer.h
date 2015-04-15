//
//  BNRContainer.h
//  BNRChap2GoldChallenge
//
//  Created by Douglas Voss on 3/30/15.
//  Copyright (c) 2015 Doug. All rights reserved.
//

#import "BNRItem.h"

@interface BNRContainer : BNRItem
{
    NSMutableArray *_subitems;
}

- (instancetype)initWithContainerName:(NSString *)name
                  valueInDollars:(NSInteger)value
                    serialNumber:(NSString *)sNumber
                       itemArray:(NSMutableArray *)itemArray;

- (instancetype)initWithContainerName:(NSString *)name
                  valueInDollars:(NSInteger)value
                    serialNumber:(NSString *)sNumber;

- (instancetype)initWithContainerName:(NSString *)name
                  valueInDollars:(NSInteger)value;

- (instancetype)initWithContainerName:(NSString *)name
                    serialNumber:(NSString *)sNumber;

- (instancetype)initWithContainerName:(NSString *)name;

- (instancetype)init;

- (void)setSubitems:(NSMutableArray *)subitemsInit;
- (NSMutableArray *)subitems;

- (void)addItem:(BNRItem *)item;

- (NSString *)description;

- (NSInteger)totalWorth;

@end
