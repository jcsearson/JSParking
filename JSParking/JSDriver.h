//
//  JSDriver.h
//  JSParking
//
//  Created by James Charles Searson on 4/26/15.
//  Copyright (c) 2015 James C. Searson. All rights reserved.
//

// Disable date & process id from output.
#define NSLog(STRING, ...) printf("%s\n", [[NSString stringWithFormat:STRING, ##__VA_ARGS__] UTF8String]);

#import <Foundation/Foundation.h>

@interface JSDriver : NSObject

{
    //  Instance Variables
    NSString *_customerFirstName;
    NSString *_customerLastName;
    NSInteger _newTicket;
    unsigned int _parkingLocation;
    NSString *_carColor;
    NSString *_carMake;
    NSString *_carModel;
    NSString *_dateString;
    NSString *_timeString;
}

//  Instance Methods
- (NSString *)customerFirstName;
- (void)setCustomerFirstName:(NSString *)c;
- (NSString *)customerLastName;
- (void)setCustomerLastName:(NSString *)b;

- (NSInteger)newTicket;
- (void)setNewTicket:(NSInteger)t;

- (unsigned int)parkingLocation;
- (void)setParkingLocation:(unsigned int)p;

- (NSString *)carColor;
- (void)setCarColor:(NSString *)z;

- (NSString *)carMake;
- (void)setCarMake:(NSString *)y;

- (NSString *)carModel;
- (void)setCarModel:(NSString *)x;

- (NSMutableArray *)carLog;

- (NSString *)dateString;
- (void)setDateString:(NSString *)d;

- (NSString *)timeString;
- (void)setTimeString:(NSString *)q;

// JSDriver has a method for adding the car information to the car log transcript array
- (void)addEntry:(JSDriver *)d;

// JSDriver has a method for adding the car information to the car log transcript array
- (void)removeEntry:(JSDriver *)r;

@end
