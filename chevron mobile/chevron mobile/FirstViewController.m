//
//  FirstViewController.m
//  chevron mobile
//
//  Created by Praveen Reddy Thatiguttla on 6/1/13.
//  Copyright (c) 2013 chevron. All rights reserved.
//

#import "FirstViewController.h"
#import <QuartzCore/QuartzCore.h>
#import "GlobalSet.h"

@interface FirstViewController ()

@end

@implementation FirstViewController

@synthesize logintitle;
@synthesize btnlogin;
@synthesize txtpassword;
@synthesize txtusername;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        self.title = NSLocalizedString(@"Login", @"LoginTitle");
        self.tabBarItem.image = [UIImage imageNamed:@"lock"];
    }
    UIImageView *backgroundImage = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"mybg.jpg"]];
    
    [self.view addSubview:backgroundImage];
    [self.view sendSubviewToBack:backgroundImage];
    
    logintitle.textColor     = [UIColor colorWithRed:1.0 green:1.0 blue:1.0 alpha:1];
    logintitle.shadowColor   = [UIColor blackColor];
    logintitle.shadowOffset  = CGSizeMake(-1.0,-1.0);
    
    [GlobalSet sharedInstance].loginflag=NO;
    
    btnlogin.titleLabel.text=@"login";
    [btnlogin setTitle:@"login" forState:UIControlStateNormal];
    btnlogin.titleLabel.textColor = [UIColor blackColor];
    txtusername.text=@"chevron";
    txtpassword.text=@"chevron";
    
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

- (IBAction)loginbtnclick:(id)sender {
    
    UIAlertView *loginalert = [[UIAlertView alloc]
                          initWithTitle: @"Message"
                          message: @"Please enter username"
                          delegate: nil
                          cancelButtonTitle:@"OK"
                          otherButtonTitles:nil];
    //[alert show];
    if (txtusername.text.length==0) {
        [loginalert show];
        return;
    }
    else if (txtpassword.text.length==0)
    {
        loginalert.message=@"Please enter password";
        [loginalert show];
        return;
    }
    else if ([txtpassword.text isEqualToString:@"chevron"] && [txtusername.text isEqualToString:@"chevron"]){
        if ([btnlogin.titleLabel.text isEqualToString:@"logout"]) {
            
            [GlobalSet sharedInstance].loginflag=NO;
            [btnlogin setTitle:@"login" forState:UIControlStateNormal];
            txtusername.text=@"";
            txtpassword.text=@"";
            //sender. .text=@"login";
            return;
        }
        else{
            [GlobalSet sharedInstance].loginflag=YES;
            //btnlogin.titleLabel.text=@"logout";
            [btnlogin setTitle:@"logout" forState:UIControlStateNormal];
            [self.tabBarController setSelectedIndex: 1];
            return;
        }
    }
    

}
@end
