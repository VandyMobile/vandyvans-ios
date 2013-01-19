//
//  VVAboutTableViewController.m
//  Vandy Vans
//
//  Created by Seth Friedman on 1/19/13.
//  Copyright (c) 2013 VandyMobile. All rights reserved.
//

#import "VVAboutTableViewController.h"
#import "VVReportTableViewController.h"

@interface VVAboutTableViewController ()

@property (weak, nonatomic) IBOutlet UITableViewCell *reportBugTableViewCell;
@property (weak, nonatomic) IBOutlet UITableViewCell *sendFeedbackTableViewCell;

@end

@implementation VVAboutTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if ([segue.identifier isEqualToString:@"AboutToSendFeedback"]) {
        ((VVReportTableViewController *)segue.destinationViewController).userIsSendingFeedback = YES;
    }
}

- (IBAction)donePressed:(UIBarButtonItem *)sender {
    [self.delegate aboutTableViewControllerDidFinish:self];
}

#pragma mark - Table View Data Source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 3;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    NSInteger numberOfRows = 0;
    
    if (section == 0) {
        numberOfRows = 2;
    }
    
    return numberOfRows;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell;
    
    // We assume that we are dealing with the first section, as the other sections have no rows.
    if (indexPath.row == 0) {
        cell = self.reportBugTableViewCell;
    } else {
        cell = self.sendFeedbackTableViewCell;
    }
    
    return cell;
}

@end
