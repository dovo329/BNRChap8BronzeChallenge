//
//  BNRContainer.m
//  BNRChap2GoldChallenge
//
//  Created by Douglas Voss on 3/30/15.
//  Copyright (c) 2015 Doug. All rights reserved.
//

#import "BNRContainer.h"

@implementation BNRContainer

- (instancetype)initWithContainerName:(NSString *)name
                  valueInDollars:(NSInteger)value
                    serialNumber:(NSString *)sNumber
                       itemArray:(NSMutableArray *)itemArray
{
    self = [super init];
    if (self) {
        _itemName = name;
        _valueInDollars = value;
        _serialNumber = sNumber;
        _dateCreated = [[NSDate alloc] init];
        _subitems = itemArray;
    }
    return self;
}

- (instancetype)initWithContainerName:(NSString *)name
                  valueInDollars:(NSInteger)value
                    serialNumber:(NSString *)sNumber
{
    return [self initWithContainerName:name
                        valueInDollars:value
                          serialNumber:sNumber
                             itemArray:[[NSMutableArray alloc] init]];
}

- (instancetype)initWithContainerName:(NSString *)name
                  valueInDollars:(NSInteger)value
{
    return [self initWithContainerName:name
                        valueInDollars:value
                          serialNumber:@""
                             itemArray:[[NSMutableArray alloc] init]];
}

- (instancetype)initWithContainerName:(NSString *)name
                    serialNumber:(NSString *)sNumber
{
    return [self initWithContainerName:name
                        valueInDollars:0
                          serialNumber:sNumber
                             itemArray:[[NSMutableArray alloc] init]];
}

- (instancetype)initWithContainerName:(NSString *)name
{
    return [self initWithContainerName:name
                        valueInDollars:0
                          serialNumber:@""
                             itemArray:[[NSMutableArray alloc] init]];
}


- (instancetype)init
{
    self = [super init];
    if (self)
    {
        self.subitems = [[NSMutableArray alloc] init];
    }
    return self;
}


- (void)setSubitems:(NSMutableArray *)subitemsInit
{
    _subitems = subitemsInit;
}

- (NSMutableArray *)subitems
{
    return _subitems;
}

- (void)addItem:(BNRItem *)item
{
    [self.subitems addObject:item];
}

- (NSString *)description
{
    NSMutableString *subItemsStr = [[NSMutableString alloc] init];
    NSInteger totalWorth = [self totalWorth];
    
    
    for (int i=0; i<[self.subitems count]; i++)
    {
        [subItemsStr appendFormat:@"%@\n", self.subitems[i]];
    }
    
    NSMutableString *returnStr = [[NSMutableString alloc] init];
    [returnStr appendFormat:@"Container %@ (%@): Worth $%d, Total worth $%d, recorded on %@\n", self.itemName, self.serialNumber, (int)self.valueInDollars, (int)totalWorth, self.dateCreated];
    
    [returnStr appendString:subItemsStr];
    return returnStr;
}

- (NSInteger)totalWorth
{
    NSInteger totalWorth = self.valueInDollars;
    
    //NSLog(@"subitems count is %d", (int)[self.subitems count]);
    for (int i=0; i<[self.subitems count]; i++)
    {
        if ([self.subitems[i] isKindOfClass:[BNRContainer class]]) {
            //NSLog(@"Hit the container of a container case");
            totalWorth += [self.subitems[i] totalWorth];
        } else if ([self.subitems[i] isKindOfClass:[BNRItem class]]) {
            //NSLog(@"Hit the normal case");
            totalWorth += (int)((BNRItem *)self.subitems[i]).valueInDollars;
        }
    }
    return totalWorth;
}

@end
