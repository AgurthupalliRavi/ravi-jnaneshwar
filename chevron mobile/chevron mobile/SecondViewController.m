//
//  SecondViewController.m
//  chevron mobile
//
//  Created by Praveen Reddy Thatiguttla on 6/1/13.
//  Copyright (c) 2013 chevron. All rights reserved.
//

#import "SecondViewController.h"
#import "QueueViewController.h"

@interface SecondViewController ()

- (void)refreshqueue:(id)sender;

@end

@implementation SecondViewController
@synthesize navigcontroller;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        self.title = NSLocalizedString(@"Queue", @"Queue");
        self.tabBarItem.image = [UIImage imageNamed:@"storage"];
        //UIBarButtonItem *refresh=[[UIBarButtonItem alloc]initWithBarButtonSystemItem:UIBarButtonSystemItemRefresh target:nil action:refreshqueue:nil];
        QueueViewController *queueViewController=[[QueueViewController alloc]init];
        navigcontroller=[[UINavigationController alloc]initWithRootViewController:queueViewController];
        [self.view addSubview:navigcontroller.view];
        
        //[self.navigationController initWithRootViewController:queueViewController];
        //[self.view addSubview:self.navigationController];
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)refreshqueue:(id)sender
{
    
    return;
}

@end
