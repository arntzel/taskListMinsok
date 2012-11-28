//
//  ViewController.h
//  taskList
//
//  Created by Eliot Arntz on 10/20/12.
//  Copyright (c) 2012 Eliot Arntz. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "DetailViewController.h"

// This is the interface or header file for the UIViewController.
// The colon and UIViewController declares this class as a subclass of UIViewController.
@interface ViewController : UIViewController
/** 
 In order to use the table view delegate methods we need our class to conform to the delegate.  
 
 In this case we need to conform to:
     UITableViewDelegate: a Class containing methods used to alter or change the table view (delete rows, touch rows)
     UITableViewDataSource: provides the table view object the information to draw the table view
     UITextFieldDelegate: defines user input into the pop up keyboard
 */

<UITableViewDelegate, UITableViewDataSource, UITextFieldDelegate>

// This could have been simply written as:
// @interface ViewController : UIViewController <UITableViewDelegate, UITableViewDataSource, UITextFieldDelegate>

//This action/method will be called on the object when the user clicks the button it's connected to
- (IBAction)addTask:(id)sender;

// For each IBOutlet (An Identifier for the compiler so that it can properly link the view with property)
// For all properties we give them a type of class
// The naming convention for properties makes it easy to recognize what type the property is.
@property (weak, nonatomic) IBOutlet UITextField *addTaskTextField;
@property (weak, nonatomic) IBOutlet UITableView *taskTableView;

//This will hold an NSMutableArray (An ordered set of objects, Mutable allows us to add and remove objects in any method for this array. Notice that we use a plural to define an array of objects.
@property (strong, nonatomic) NSMutableArray *tasks;

//This is an instance of DetailViewController.  Notice the different color for the class from the objective c defined classes (UITextField, UITableView, NSMutableArray vs DetailViewController) This alerts us to the fact that this not defined in CoreFoundation.
@property (strong, nonatomic) DetailViewController *detailVC;

//tasks
@property (strong, nonatomic) NSArray *tasksArray;

@end
