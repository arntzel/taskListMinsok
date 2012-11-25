//
//  Tasks.h
//  taskList
//
//  Created by Eliot Arntz on 10/27/12.
//  Copyright (c) 2012 Eliot Arntz. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

//This class was created by file --> new file (Choose NSManagedObjectSubClass in the iOS area - Core Data)
@interface Tasks : NSManagedObject

//Cooresponds to the attribute we created in the Tasks.xcDatamodeled.  (We created Tasks.xcDatamodeled by file --> new file (Choose NSManagedObjectSubClass in the iOS area - Data Model);
@property (nonatomic, retain) NSString * name;

@end
