//
//  Tasks.h
//  taskList
//
//  Created by Eliot Arntz on 10/27/12.
//  Copyright (c) 2012 Eliot Arntz. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>


@interface Tasks : NSManagedObject

@property (nonatomic, retain) NSString * name;

@end
