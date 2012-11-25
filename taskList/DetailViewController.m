//
//  DetailViewController.m
//  taskList
//
//  Created by Eliot Arntz on 10/20/12.
//  Copyright (c) 2012 Eliot Arntz. All rights reserved.
//

#import "DetailViewController.h"

@interface DetailViewController ()

@end

@implementation DetailViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    //_selectedTask was set in the viewController.m implementation file.
    _taskName.text = _selectedTask;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)goBackPressed:(id)sender {
    //go back to the viewControllerView by dismissing the currentView.
    [self dismissViewControllerAnimated:YES completion:nil];
}
@end
