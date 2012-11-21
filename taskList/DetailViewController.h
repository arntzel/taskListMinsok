//
//  DetailViewController.h
//  taskList
//
//  Created by Eliot Arntz on 10/20/12.
//  Copyright (c) 2012 Eliot Arntz. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DetailViewController : UIViewController

@property NSString *selectedTask;

@property (weak, nonatomic) IBOutlet UILabel *taskName;
- (IBAction)goBackPressed:(id)sender;

@end
