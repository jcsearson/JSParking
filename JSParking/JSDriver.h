//
//  JSDriver.h
//  JSParking
//
//  Created by James Charles Searson on 4/26/15.
//  Copyright (c) 2015 James C. Searson. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface JSDriver : NSObject

{
    //  Instance Variables
    NSString *_customerName;
    unsigned int _ticketNumber;
    unsigned int _parkingLocation;
    NSString *_parkingStatus;
}

//  Instance Methods
- (NSString *)customerName;
- (void)setCustomerName:(NSString *)c;

- (unsigned int)ticketNumber;
- (void)setTicketNumber:(unsigned int)t;

- (unsigned int)parkingLocation;
- (void)setParkingLocation:(unsigned int)p;

- (NSMutableArray *)carLog;

// JSDriver has a method for adding the car information to the car log transcript array
- (void)addEntry:(JSDriver *)d;

// JSDriver has a method for adding the car information to the car log transcript array
- (void)removeEntry:(JSDriver *)r;

@end
