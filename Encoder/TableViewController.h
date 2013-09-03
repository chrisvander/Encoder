//
//  TableViewController.h
//  Encoder
//
//  Created by iD Student on 7/2/13.
//  Copyright (c) 2013 iD Student. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TableViewController : UITableViewController <UITextFieldDelegate>
{
    IBOutlet UITextField *messageText;
    IBOutlet UIStepper *key;
    IBOutlet UIStepper *paths;
    IBOutlet UILabel *keyLabel;
    IBOutlet UILabel *pathsLabel;
    IBOutlet UIProgressView *encoding;
    
    IBOutlet UITextView *output;
}

@property (nonatomic, retain) IBOutlet UITextField *messageText;

- (IBAction)encodeButtonPressed;

@end
