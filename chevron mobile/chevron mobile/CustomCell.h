//
//  CustomCell.h
//  CustomUITableViewCell
//
//  Created by Kshitiz Ghimire on 3/18/11.
//  Copyright 2011 Javra Software. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface CustomCell : UITableViewCell {
	UITextField *textField;
	UILabel *label;
    
}
@property (nonatomic, retain) IBOutlet UITextField *textField;
@property (nonatomic, retain) IBOutlet UILabel *label;

@end
