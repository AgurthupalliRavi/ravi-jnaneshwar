//
//  UserViewController.m
//  chevron mobile
//
//  Created by Praveen Reddy Thatiguttla on 6/1/13.
//  Copyright (c) 2013 chevron. All rights reserved.
//

#import "UserViewController.h"
#import "CustomCell.h"

@interface UserViewController ()

@end

@implementation UserViewController
@synthesize tableView = _tableView;

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
    return 5;
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
    UITextField *inputField;
    if(cell == nil)
    {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CELL_ID];
        cell.selectionStyle = UITableViewCellSelectionStyleBlue;
        //cell.textLabel.textAlignment = UITextAlignmentCenter;
        [cell.textLabel setTextAlignment:NSTextAlignmentCenter];
        inputField = [[UITextField alloc] initWithFrame:CGRectMake(320,12,285,30)];
        inputField.adjustsFontSizeToFitWidth = YES;
        inputField.textColor = [UIColor blackColor];
        if (indexPath.section!=4){
        [cell addSubview:inputField];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        [cell.textLabel setTextAlignment:NSTextAlignmentLeft];
        }
    }
    inputField.keyboardType = UIKeyboardTypeDefault;
    switch([indexPath section])
    {
        case 0:
            cell.textLabel.text = @"First Name";
            inputField.placeholder = @"Enter First Name";
            break;
        case 1:
            cell.textLabel.text = @"Last Name";
            inputField.placeholder = @"Enter Last Name";
            break;
        case 2:
            cell.textLabel.text = @"Address Lne 1";
            inputField.placeholder = @"Enter Address line 2";
            break;
        case 3:
            cell.textLabel.text = @"Address Line 2";
            inputField.placeholder = @"Enter Address line 2";
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
            return @"User Details";
        }
     else{
         return nil;
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
