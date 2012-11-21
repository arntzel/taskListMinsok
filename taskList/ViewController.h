//
//  ViewController.h
//  taskList
//
//  Created by Eliot Arntz on 10/20/12.
//  Copyright (c) 2012 Eliot Arntz. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "DetailViewController.h"


@interface ViewController : UIViewController
<UITableViewDelegate, UITableViewDataSource, UITextFieldDelegate>

- (IBAction)addTask:(id)sender;

@property (weak, nonatomic) IBOutlet UITextField *addTaskTextField;

@property (weak, nonatomic) IBOutlet UITableView *taskTableView;

@property (strong, nonatomic) NSMutableArray *tasks;

@property (strong, nonatomic) DetailViewController *detailVC;

@property (strong, nonatomic) NSArray *tasksArray;

@end
