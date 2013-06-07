//
//  UserViewController.m
//  chevron mobile
//
//  Created by Praveen Reddy Thatiguttla on 6/1/13.
//  Copyright (c) 2013 chevron. All rights reserved.
//

#import "UserViewController.h"
#import "CustomCell.h"
#import "GlobalSet.h"

@interface UserViewController ()

@property (nonatomic,retain)UITextField *firstname;
@property (nonatomic,retain)UITextField *lastname;
@property (nonatomic,retain)UITextField *address1;
@property (nonatomic,retain)UITextField *address2;

@end

@implementation UserViewController
@synthesize tableView = _tableView;
@synthesize firstname;
@synthesize lastname;
@synthesize address1;
@synthesize address2;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
        self.title = NSLocalizedString(@"User", @"UserTitle");
        self.tabBarItem.image = [UIImage imageNamed:@"user"];
        
        self.tableView = [[UITableView alloc] initWithFrame:self.view.bounds style:UITableViewStyleGrouped];
        self.tableView.dataSource = self;
        self.tableView.delegate = self;
        [self.view addSubview:self.tableView];
    }
    return self;
}
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    // set the number of sections in the table to match the number of first letters
    return [[GlobalSet sharedInstance].UserData count]+1;
}


// Customize the number of rows in the table view.
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 1;
}


// Customize the appearance of table view cells.
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    // Reuse out of visible range cell if available
    static NSString *CELL_ID = @"Cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CELL_ID];
    if(cell == nil)
    {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CELL_ID];
        cell.selectionStyle = UITableViewCellSelectionStyleBlue;
        //cell.textLabel.textAlignment = UITextAlignmentCenter;
        [cell.textLabel setTextAlignment:NSTextAlignmentCenter];
        if (indexPath.section!=4){
            //[cell addSubview:inputField];
            cell.selectionStyle = UITableViewCellSelectionStyleNone;
            [cell.textLabel setTextAlignment:NSTextAlignmentLeft];
        }
        switch([indexPath section])
        {
            case 0:
                self.firstname = [[UITextField alloc] initWithFrame:CGRectMake(320,12,285,30)];
                self.firstname.adjustsFontSizeToFitWidth = YES;
                self.firstname.textColor = [UIColor blackColor];
                [cell addSubview:self.firstname];
                
                break;
            case 1:
                self.lastname = [[UITextField alloc] initWithFrame:CGRectMake(320,12,285,30)];
                self.lastname.adjustsFontSizeToFitWidth = YES;
                self.lastname.textColor = [UIColor blackColor];
                [cell addSubview:self.lastname];
                
                break;
            case 2:
                self.address1 = [[UITextField alloc] initWithFrame:CGRectMake(320,12,285,30)];
                self.address1.adjustsFontSizeToFitWidth = YES;
                self.address1.textColor = [UIColor blackColor];
                [cell addSubview:self.address1];
                
                break;
            case 3:
                self.address2 = [[UITextField alloc] initWithFrame:CGRectMake(320,12,285,30)];
                self.address2.adjustsFontSizeToFitWidth = YES;
                self.address2.textColor = [UIColor blackColor];
                [cell addSubview:self.address2];
                break;
            case 4:
                
                
                break;
        }
        
    }
    switch([indexPath section])
    {
        case 0:
            self.firstname.placeholder = @"Enter First Name";
            self.firstname.text = [[GlobalSet sharedInstance].UserData objectAtIndex:indexPath.section];
            cell.textLabel.text = @"First Name";
            break;
        case 1:
            
            self.lastname.text = [[GlobalSet sharedInstance].UserData objectAtIndex:indexPath.section];
            cell.textLabel.text = @"Last Name";
            self.lastname.placeholder = @"Enter Last Name";
            break;
        case 2:
            self.address1.text = [[GlobalSet sharedInstance].UserData objectAtIndex:indexPath.section];
            cell.textLabel.text = @"Address Lne 1";
            self.address1.placeholder = @"Enter Address line 2";
            break;
        case 3:
            self.address2.text = [[GlobalSet sharedInstance].UserData objectAtIndex:indexPath.section];
            cell.textLabel.text = @"Address Line 2";
            self.address2.placeholder = @"Enter Address line 2";
            break;
        case 4:
            cell.textLabel.text = @"Update Details";
            
            break;
    }
    return cell;
	
}
- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
{
    if (section == 0)
    {
        return @"User Profile Details";
    }
    else{
        return nil;
    }
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    if (indexPath.section==4) {
        UIAlertView *updateAlert=[[UIAlertView alloc]initWithTitle:@"Update Notification" message:@"Updated Successfully" delegate:nil cancelButtonTitle:@"Dismiss" otherButtonTitles:nil, nil];
        //        9032 675 624
        
        if ([[GlobalSet sharedInstance].QueueData count]>0) {
            updateAlert.message=@"No Network:Please clear the queue to continue";
            [updateAlert show];
        }
        else{
            
            if ([GlobalSet connected]) {
                
                [updateAlert show];
                [[GlobalSet sharedInstance].UserData removeAllObjects];
                [[GlobalSet sharedInstance].UserData addObject:self.firstname.text];
                [[GlobalSet sharedInstance].UserData addObject:self.lastname.text];
                [[GlobalSet sharedInstance].UserData addObject:self.address1.text];
                [[GlobalSet sharedInstance].UserData addObject:self.address2.text];
                [self.tableView reloadData];
            }
            else{
                
                updateAlert.message=@"No Network detected; request placed in queue";
                [updateAlert show];
                [[GlobalSet sharedInstance].QueueData removeAllObjects];
                [[GlobalSet sharedInstance].QueueData addObject:self.firstname.text];
                [[GlobalSet sharedInstance].QueueData addObject:self.lastname.text];
                [[GlobalSet sharedInstance].QueueData addObject:self.address1.text];
                [[GlobalSet sharedInstance].QueueData addObject:self.address2.text];
                [self.tableView reloadData];
                
            }
        }
    }
}
- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
