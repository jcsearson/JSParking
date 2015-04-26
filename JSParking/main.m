//
//  main.m
//  JSParking
//
//  Created by James Charles Searson on 4/26/15.
//  Copyright (c) 2015 James C. Searson. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "JSDriver.h"

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        NSMutableArray *carLog = [[NSMutableArray alloc] init];
        int i;
        for(i=0; i<2; i++) {
            // Creates an instance of JSDriver
            JSDriver *firstCar = [[JSDriver alloc] init];
            
            
            // Declare instance variables for use with "scanf" function
            NSString *inputName;
            unsigned int inputTicket;
            unsigned int inputLocation;
            char cString[100]; //cString is string of 100 chars (technically an array)
            
            // Prompt User Name
            NSLog(@"Enter driver's name:");
            scanf("%s", cString);
            //  Convert to string
            inputName = [NSString stringWithCString: cString encoding: NSASCIIStringEncoding];
            
            // Prompt Ticket Number
            NSLog(@"Enter associated ticket number:");
            scanf("%s", cString);
            //  Convert to unsigned integer
            inputTicket = atoi(cString);
            
            // Prompt Location Number
            NSLog(@"Enter where vehicle was parked:");
            scanf("%s", cString);
            //  Convert to unsigned integer
            inputLocation = atoi(cString);
            
            // Use JSDriver methods to assign inputs to object
            [firstCar setCustomerName:inputName];
            [firstCar setTicketNumber:inputTicket];
            [firstCar setParkingLocation:inputLocation];
            
            [carLog addObject:firstCar];
        }
        NSLog(@"Inventory Report: %@", carLog);
    }
    return 0;
}
