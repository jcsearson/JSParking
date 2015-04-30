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
        
        // Prompting user as to whether they are parking a car or bringing a car out of garage
        NSString *addOrRemove;
        char cString[50];
        // Prompt User Name
        NSLog(@"Is car going in or out?:\r (Type 'YES' for going in and 'NO' for going out.)");
        scanf("%s", cString);
        //  Convert to string
        addOrRemove = [NSString stringWithCString: cString
                                         encoding: NSASCIIStringEncoding];
        
        BOOL boolValue = [addOrRemove boolValue];  // Convert to yes/no based on chars "y", "Y", "n", "N"
        
        if(boolValue == TRUE) {
        
            int i;
            for(i=0; i<1; i++) {
                // Creates an instance of JSDriver
                JSDriver *firstCar = [[JSDriver alloc] init];
            
                //  Specifying a date object to be sent to 'JSDriver.m'
                NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
                [dateFormatter setLocale:[NSLocale currentLocale]];
                dateFormatter.dateStyle = NSDateFormatterMediumStyle;
                dateFormatter.timeStyle = NSDateFormatterNoStyle;
            
                //  Specifying a timestamped object to be sent to 'JSDriver.m'
                NSDateFormatter *timeFormatter = [[NSDateFormatter alloc] init];
                [timeFormatter setDateFormat:@"K:mm a"]; // e.g.  "3:45 PM"
            
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
                [defaults setInteger:nextTicket
                              forKey:@"lastTicketNumber"];
                [defaults synchronize];
            
            
                char cString[100]; //cString is string of 100 chars (technically an array)
            
                // Prompt User Name
                NSLog(@"Enter driver's first name:");
                scanf("%s", cString);
                //  Convert to string
                inputFirstName = [NSString stringWithCString: cString
                                                    encoding: NSASCIIStringEncoding];
            
                NSLog(@"Enter driver's last name:");
                scanf("%s", cString);
                //  Convert to string
                inputLastName = [NSString stringWithCString: cString
                                                   encoding: NSASCIIStringEncoding];
            
                // Prompt Location Number
                NSLog(@"Enter where vehicle was parked:");
                scanf("%s", cString);
                //  Convert to unsigned integer
                inputLocation = atoi(cString);
            
                //  Prompt vehicle description
                NSLog(@"Enter the color of the vehicle:");
                scanf("%s", cString);
                //  Convert to string
                inputCarColor = [NSString stringWithCString: cString
                                                   encoding: NSASCIIStringEncoding];
                NSLog(@"Enter the make of the vehicle:");
                scanf("%s", cString);
                //  Convert to string
                inputCarMake = [NSString stringWithCString: cString
                                                  encoding: NSASCIIStringEncoding];
                NSLog(@"Enter the model of the vehicle:");
                scanf("%s", cString);
                //  Convert to string
                inputCarModel = [NSString stringWithCString: cString
                                                   encoding: NSASCIIStringEncoding];
            
                //  Convert to a string such that we can use 'setDateString (NSString *)
                NSString *theDate = [dateFormatter stringFromDate:currentDate];  // date
                NSString *theTime = [timeFormatter stringFromDate:currentDate];  // time
            
                // Use JSDriver methods to assign inputs to object
                [firstCar setDateString:theDate];
                [firstCar setTimeString:theTime];
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
        } else { // If boolean "FALSE"  --  Car is checking out of garage
            int i;
            for (i=0; i<1; i++) {
                
                unsigned int ticketCalled;
                NSString *requestTicket;
                
                char cString[100]; //cString is string of 100 chars (technically an array)
                
                // Prompt User Name
                NSLog(@"Enter the ticket number for the vehicle:");
                scanf("%s", cString);
                //  Convert to string
                ticketCalled = atoi(cString);
                requestTicket = [NSString stringWithFormat:@"%d", ticketCalled];  // convert user ticket number input to string
                
                NSError * error;
                NSString * intFilePath = @"/Users/jboned/Documents/www/overnightlog.txt";
                NSString *someTicket = [[NSString alloc] initWithContentsOfFile:intFilePath
                                                                       encoding:NSUTF8StringEncoding
                                                                          error:&error];
                
                if (!requestTicket) {
                    NSLog(@"%@", [error localizedDescription]);  // Couldn't find the ticket number in file
                } else {
                    //replace string1 occurences by string2
                    NSString *replacedString = [someTicket stringByReplacingOccurrencesOfString:requestTicket
                                                                                     withString:@"Not in garage."];
                    
                    //copy replacedString to sample.txt
                    [replacedString writeToFile:intFilePath
                                     atomically:YES
                                       encoding:NSUTF8StringEncoding
                                          error:&error];
                    
                    NSLog(@"\r Vehicle has been successfully checked out!");  // Confirmation message
                }
            }
        }
    }
    return 0;
}
