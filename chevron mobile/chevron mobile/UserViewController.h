//
//  UserViewController.h
//  chevron mobile
//
//  Created by Praveen Reddy Thatiguttla on 6/1/13.
//  Copyright (c) 2013 chevron. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UserViewController : UIViewController <UITableViewDelegate, UITableViewDataSource,UITextFieldDelegate>

@property (nonatomic, strong) UITableView *tableView;

@end
