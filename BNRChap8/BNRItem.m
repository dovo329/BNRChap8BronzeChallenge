//
//  BNRItem.m
//  BNRChap2GoldChallenge
//
//  Created by Douglas Voss on 3/30/15.
//  Copyright (c) 2015 Doug. All rights reserved.
//

#import "BNRItem.h"
#include <stdlib.h>

@implementation BNRItem

+ (instancetype)randomItem
{

    NSArray *adjectiveArray = @[@"Grumpy", @"Spongy", @"Golden", @"Awesome"];
    NSArray *nounArray = @[@"Lighter", @"Ring", @"Keyboard", @"Ferrari"];
    NSString *randomItemName =
    [NSString stringWithFormat:@"%@ %@",
        adjectiveArray[arc4random() % adjectiveArray.count],
        nounArray[arc4random() % nounArray.count]];
                           
    NSString *randomSerialNumber =
    [[NSString alloc] initWithFormat:@"%c%c%c%c%c%c",
        'a'+arc4random()%26,
        '0'+arc4random()%10,
        'A'+arc4random()%26,
        '0'+arc4random()%10,
        'a'+arc4random()%26,
        '0'+arc4random()%10];
                          
    BNRItem *randomItem =
    [[self alloc] initWithItemName:randomItemName
                       valueInDollars:(arc4random() % 100)
                         serialNumber:randomSerialNumber];
    return randomItem;
}

- (instancetype)initWithItemName:(NSString *)name
                  valueInDollars:(NSInteger)value
                    serialNumber:(NSString *)sNumber
{
    self = [super init];
    
    if (self) {
        _itemName = name;
        _valueInDollars = value;
        _serialNumber = sNumber;
        _dateCreated = [[NSDate alloc] init];
    }
    return self;
}

- (instancetype)initWithItemName:(NSString *)name
                  valueInDollars:(NSInteger)value
{
    return [self initWithItemName:name
                   valueInDollars:value
                     serialNumber:@""];
}

- (instancetype)initWithItemName:(NSString *)name
                    serialNumber:(NSString *)sNumber
{
    return [self initWithItemName:name
                   valueInDollars:0
                     serialNumber:sNumber];
}

- (instancetype)initWithItemName:(NSString *)name
{
    return [self initWithItemName:name
                   valueInDollars:0
                     serialNumber:@""];
}

- (void)setItemName:(NSString *)str
{
    _itemName = str;
}

- (NSString *)itemName
{
    return _itemName;
}

- (void)setSerialNumber:(NSString *)str
{
    _serialNumber = str;
}

- (NSString *)serialNumber
{
    return _serialNumber;
}

- (void)setValueInDollars:(NSInteger)v
{
    _valueInDollars = v;
}

- (NSInteger)valueInDollars
{
    return _valueInDollars;
}

- (NSDate *)dateCreated
{
    return _dateCreated;
}

- (NSString *)description
{
    NSString *descriptionString = [[NSString alloc] initWithFormat:@"%@ (%@): Worth $%d, recorded on %@", self.itemName, self.serialNumber, (int)self.valueInDollars, self.dateCreated];
    return descriptionString;
}

@end
