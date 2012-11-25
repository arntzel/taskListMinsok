//
//  ViewController.m
//  taskList
//
//  Created by Eliot Arntz on 10/20/12.
//  Copyright (c) 2012 Eliot Arntz. All rights reserved.
//

//Import (include) the interfact file for ViewController
#import "ViewController.h"
//Import (include) the interfact file for Tasks.  As a result when we create an array of tasks objects we will be able to catch that object in a variable of the same class.
#import "Tasks.h"

//Private API
@interface ViewController ()

@end

//definition for methods defined in our interface (header file).
@implementation ViewController

//Method called after the view controller has loaded its view hierarchy into memory. This method is called regardless of whether the view hierarchy was loaded from a nib file or created programmatically in the loadView method
- (void)viewDidLoad
{
    //since ViewDidLoad is declared in the UIViewController class we must call to ViewController's super class UIViewController in order to use the viewDidLoad method.
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    //In order to use the addTaskTextField object's delegate methods we must set the UITextField delegate to this class using self.
    [_addTaskTextField setDelegate:self];
    //we will manage our list of tasks that will be displayed in our tableView through an NSMutableArray called tasks. We setup the initial _tasks array by populating it with data from core data using [Tasks findall].
    _tasks = [[NSMutableArray alloc] initWithArray:[Tasks findAll]];
    
//    //we will implement these two properties next time
//    self.navigationItem.title = @"Task List";
//    self.navigationItem.rightBarButtonItem = self.editButtonItem;
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


//delegate methods - Delegate methods (or delegation methods) are those that an object invokes in its delegate (if the delegate implements them) when certain events occur

#pragma mark UITableViewDataSource Delegate

//change the return value of this method to declare the number of sections.
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

//numberOfRowsInsections, change the return value to declare how many rows are in our section
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    //[_tasks count] returns an integer value of the number of objects saved in the array
    return [_tasks count];
}

//setup the tableView's cells.
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    //the following code is largely standard for UITableView setup. Copy and paste this code
    static NSString *Cellidentifier = @"Cell";
    
    UITableViewCell *cell = (UITableViewCell *) [tableView dequeueReusableCellWithIdentifier:Cellidentifier];
    
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:Cellidentifier];
    }
    
    //the following are properties of cell, implementing these properties is not required but it allows us to customize our tableViewCells.
    cell.contentView.backgroundColor = [UIColor whiteColor];
    cell.textLabel.shadowColor = [UIColor blackColor];
    cell.textLabel.shadowOffset = CGSizeMake(1,1);
    cell.textLabel.textColor = [UIColor greenColor];
    
    //this property is necessary in order to set the text of the textLabel equal to it's cooresponding [task name] found by finding the correct object in our array using indexPathRow.
    //If this is confusing try uncommenting the NSLog statements below.
    cell.textLabel.text = [[_tasks objectAtIndex:indexPath.row] name];
    
    //NSLog(@"our current task array which is an organized set of Task Objects: %@",_tasks);
    //NSLog(@"the row selected by the user sent to our method as a parameter [indexPath row] (indexPath has a property row) %i",[indexPath row]);
    
    //returns our custom cell 
    return cell;
}

//method linked to the addTask button.
- (IBAction)addTask:(id)sender {
    
    //Tasks create entity creates a new Task instance that is initialized using magical record.
    Tasks *task = [Tasks createEntity];
    
    //implement this bit of code to make the keyboard disappear 
    [self.view endEditing:YES];
    
    //create a local variable to temporarily hold the value of _addTaskTextField.text.
    NSString *taskName = _addTaskTextField.text;
    //assign the local variable to the Task object
    task.name = taskName;

    //add the Task object to our array of tasks
    [_tasks addObject:task];
    //reload the table with the updated data
    [_taskTableView reloadData];
    //save the additional task to core data
    [[NSManagedObjectContext defaultContext] save];

}

-(BOOL) textFieldShouldReturn:(UITextField *)textField{
    //implement this method to cause the keyboard to disappear after we are done entering text
    [_addTaskTextField resignFirstResponder];
    return YES;
}

//implement this method to allow users to tap on rows
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{

    //After the user touches the row, deselect the row
    [tableView deselectRowAtIndexPath:indexPath animated:NO];
    
    //when the user touches a row create an instance of DetailViewController, initialize it with its respective xibFile.
    _detailVC =[[DetailViewController alloc] initWithNibName:@"DetailViewController" bundle:nil];
    //set the property selectedTask equal to the task the user tapped on.
    _detailVC.selectedTask = [[_tasks objectAtIndex:indexPath.row]name];
    
    //load the viewController view with the _detailVC instance.
    [self presentViewController:_detailVC animated:YES completion:nil];
}

@end

//ignore these for now we will discuss them next time we meet.

//- (void) tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath{
//
//    if (editingStyle ==UITableViewCellEditingStyleDelete)
//    {
//        //logic to remove objects/rows
//        //this to update and delete items from core data.
//        [_tasks removeObjectAtIndex:[indexPath row]];
//        [_taskTableView reloadData];
//        [[NSManagedObjectContext defaultContext] save];
//
//    }
//}

//- (void)setEditing:(BOOL)editing animated:(BOOL)animated
//{
//    [super setEditing:editing animated:animated];
//    [self.taskTableView setEditing:editing animated:YES];
//}

