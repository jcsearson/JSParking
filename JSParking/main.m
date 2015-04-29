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
        for(i=0; i<1; i++) {
            // Creates an instance of JSDriver
            JSDriver *firstCar = [[JSDriver alloc] init];
            
            
            // Declare instance variables for use with "scanf" function
            NSString *inputFirstName;
            NSString *inputLastName;
            unsigned int inputTicket;
            unsigned int inputLocation;
            NSString *inputCarColor;
            NSString *inputCarMake;
            NSString *inputCarModel;
            char cString[100]; //cString is string of 100 chars (technically an array)
            
            // Prompt User Name
            NSLog(@"Enter driver's first name:");
            scanf("%s", cString);
            //  Convert to string
            inputFirstName = [NSString stringWithCString: cString encoding: NSASCIIStringEncoding];
            
            NSLog(@"Enter driver's last name:");
            scanf("%s", cString);
            //  Convert to string
            inputLastName = [NSString stringWithCString: cString encoding: NSASCIIStringEncoding];
            
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
            
            //  Prompt vehicle description
            NSLog(@"Enter the color of the vehicle:");
            scanf("%s", cString);
            //  Convert to string
            inputCarColor = [NSString stringWithCString: cString encoding: NSASCIIStringEncoding];
            NSLog(@"Enter the make of the vehicle:");
            scanf("%s", cString);
            //  Convert to string
            inputCarMake = [NSString stringWithCString: cString encoding: NSASCIIStringEncoding];
            NSLog(@"Enter the model of the vehicle:");
            scanf("%s", cString);
            //  Convert to string
            inputCarModel = [NSString stringWithCString: cString encoding: NSASCIIStringEncoding];
            
            // Use JSDriver methods to assign inputs to object
            [firstCar setCustomerFirstName:inputFirstName];
            [firstCar setCustomerLastName:inputLastName];
            [firstCar setTicketNumber:inputTicket];
            [firstCar setParkingLocation:inputLocation];
            [firstCar setCarColor:inputCarColor];
            [firstCar setCarMake:inputCarMake];
            [firstCar setCarModel:inputCarModel];
            
            [carLog addObject:firstCar];
        }
        NSLog(@"Inventory Report: %@", carLog);
    }
    return 0;
}
