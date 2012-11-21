//
//  ViewController.m
//  taskList
//
//  Created by Eliot Arntz on 10/20/12.
//  Copyright (c) 2012 Eliot Arntz. All rights reserved.
//

#import "ViewController.h"
#import "Tasks.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    [_addTaskTextField setDelegate:self];
    _tasks = [[NSMutableArray alloc] init];
    self.navigationItem.title = @"Task List";
    self.navigationItem.rightBarButtonItem = self.editButtonItem;

    _tasksArray = [Tasks findAll];
    

    
 
    
    NSLog(@"%@",_tasksArray);
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


//delegate methods - Delegate methods (or delegation methods) are those that an object invokes in its delegate (if the delegate implements them) when certain events occur

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [_tasks count];
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *Cellidentifier = @"Cell";
    
    UITableViewCell *cell = (UITableViewCell *) [tableView dequeueReusableCellWithIdentifier:Cellidentifier];
    
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:Cellidentifier];
    }
    
    cell.contentView.backgroundColor = [UIColor whiteColor];
    cell.textLabel.shadowColor = [UIColor blackColor];
    cell.textLabel.shadowOffset = CGSizeMake(1,1);
    cell.textLabel.textColor = [UIColor greenColor];
    cell.textLabel.text = [_tasks objectAtIndex:indexPath.row];
    
    NSLog(@"row: %i, section: %i",indexPath.row,indexPath.section);
    
    return cell;
}

- (IBAction)addTask:(id)sender {
    
    Tasks *taskModel = [Tasks createEntity];

    [self.view endEditing:YES];
    NSString *task = _addTaskTextField.text;
    taskModel.name = task;

    [_tasks addObject:task];
    [_taskTableView reloadData];
    [[NSManagedObjectContext defaultContext] save];

}

-(BOOL) textFieldShouldReturn:(UITextField *)textField{
    
    [_addTaskTextField resignFirstResponder];
    return YES;
}

- (void)setEditing:(BOOL)editing animated:(BOOL)animated
{
    [super setEditing:editing animated:animated];
    [self.taskTableView setEditing:editing animated:YES];
}

- (void) tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath{
    
    if (editingStyle ==UITableViewCellEditingStyleDelete)
    {
        //logic to remove objects/rows
        
        [_tasks removeObjectAtIndex:[indexPath row]];
        [_taskTableView reloadData];
        
    }
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{

    [tableView deselectRowAtIndexPath:indexPath animated:NO];
    
    _detailVC =[[DetailViewController alloc] initWithNibName:@"DetailViewController" bundle:nil];

    _detailVC.selectedTask = [_tasks objectAtIndex:indexPath.row];

    [self presentViewController:_detailVC animated:YES completion:nil];
}

@end
