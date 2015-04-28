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

- (NSString *)customerFirstName
{
    return _customerFirstName;
}

- (void)setCustomerFirstName:(NSString *)c
{
    _customerFirstName = c;
}

- (NSString *)customerLastName
{
    return _customerLastName;
}

- (void)setCustomerLastName:(NSString *)b
{
    _customerLastName = b;
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

- (NSString *)_carColor
{
    return _carColor;
}

- (void)setCarColor:(NSString *)z
{
    _carColor = z;
}

- (NSString *)_carMake
{
    return _carMake;
}

- (void)setCarMake:(NSString *)y
{
    _carMake = y;
}

- (NSString *)_carModel
{
    return _carModel;
}

- (void)setCarModel:(NSString *)x
{
    _carModel = x;
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

- (void)removeEntry:(JSDriver *)r
{
    if(_carLog) {
        [_carLog removeObject:r];
    }
}

- (NSString *)description
{
    return[NSString stringWithFormat:@"\r Guest Name:  %@ %@\r Ticket Number:  %i\r Location:  %i\r Vehicle:  %@ %@ %@\r\r",_customerFirstName, _customerLastName, _ticketNumber, _parkingLocation, _carColor, _carMake, _carModel];
}

@end
