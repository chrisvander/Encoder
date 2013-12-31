//
//  TableViewController.h
//  Encoder
//
//  Created by iD Student on 7/2/13.
//  Copyright (c) 2013 iD Student. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TableViewControlleriPad : UITableViewController <UITextFieldDelegate>
{
    IBOutlet UITextField *messageText;
    IBOutlet UISlider *key;
    IBOutlet UILabel *keyLabel;
    IBOutlet UIProgressView *encoding;
    NSInteger keyi;
    NSInteger r;
    NSInteger ra;
    IBOutlet UITextField *key1;
    IBOutlet UITextField *key2;
    NSString *outputst;
    IBOutlet UINavigationBar *navBar;
    IBOutlet UIButton *help;
    
    IBOutlet UITextView *output;
}

@property (nonatomic, retain) IBOutlet UITextField *messageText;

- (IBAction)encodeButtonPressed;
- (IBAction)help;

@end
