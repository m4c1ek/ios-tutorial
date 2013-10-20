//
//  MMITEmployee.h
//  ios-tutorial
//
//  Created by Maciej Walczyński on 10/19/13.
//  Copyright (c) 2013 maciekmobi. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>


@interface MMITEmployee : NSManagedObject

@property (nonatomic, retain) NSData * image;
@property (nonatomic, retain) NSData * linkedInImage;
@property (nonatomic, retain) NSString * name;

@end
