//
//  JSDriver.m
//  JSParking
//
//  Created by James Charles Searson on 4/26/15.
//  Copyright (c) 2015 James C. Searson. All rights reserved.
//

#import "JSDriver.h"

@interface JSDriver ()
{
    NSMutableArray *_carLog;
}
@end

@implementation JSDriver

- (NSString *)customerName
{
    return _customerName;
}

- (void)setCustomerName:(NSString *)c
{
    _customerName = c;
}

//

- (unsigned int)ticketNumber
{
    return _ticketNumber;
}

- (void)setTicketNumber:(unsigned int)t
{
    _ticketNumber = t;
}

//

- (unsigned int)parkingLocation
{
    return _parkingLocation;
}

- (void)setParkingLocation:(unsigned int)p
{
    _parkingLocation = p;
}

//

- (NSString *)parkingStatus
{
    if(_parkingLocation) {
        return @"AVAILABLE.";
    } else {
        return @"UNAVAILABLE.";
    }
}

//

- (void)setCarLog:(NSArray *)d
{
    _carLog = [d mutableCopy];
}

- (NSArray *)carLog
{
    return[_carLog copy];
}

- (void)addEntry:(JSDriver *)d
{
    if(!_carLog) {
        _carLog = [[NSMutableArray alloc] init];
    }
    [_carLog addObject:d];
}

@end