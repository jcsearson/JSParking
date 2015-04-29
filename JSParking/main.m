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
            
            //  Specifying a date object to be sent to 'JSDriver.m'
            NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
            dateFormatter.dateStyle = NSDateFormatterMediumStyle;
            NSDate *currentDate = [NSDate date];
            
            //  Sets starting ticket number and then increments such that next time program executes we have the next #
            NSNumber *number = [NSNumber numberWithInt:31353];
            unsigned int value = [number intValue];
            number = [NSNumber numberWithInt:value + 1];
            
            
            // Declare instance variables for use with "scanf" function
            NSString *inputFirstName;
            NSString *inputLastName;
            NSString *inputCarColor;
            NSString *inputCarMake;
            NSString *inputCarModel;
            unsigned int inputLocation;
            
            // Creating an automated ticket system to assign a sequential ticket number per entry
            NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
            NSInteger nextTicket = [defaults integerForKey:@"lastTicketNumber"];
            nextTicket++;
            // use it
            [defaults setInteger:nextTicket forKey:@"lastTicketNumber"];
            [defaults synchronize];
            
            
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
            
            //  Convert to a string such that we can use 'setDateString (NSString *)
            NSString *theDate = [dateFormatter stringFromDate:currentDate];
            
            // Use JSDriver methods to assign inputs to object
            [firstCar setDateString:theDate];
            [firstCar setCustomerFirstName:inputFirstName];
            [firstCar setCustomerLastName:inputLastName];
            [firstCar setNewTicket:nextTicket];
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
