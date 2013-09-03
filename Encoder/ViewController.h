//
//  ViewController.h
//  Encoder
//
//  Created by Chris Vanderloo on 7/24/13.
//  Copyright (c) 2013 iD Student. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UITableViewController
{
    IBOutlet UITextView *outputPad;
    IBOutlet UITextView *decodeOutput;
    IBOutlet UIBarButtonItem *menuButton;
    __weak UIPopoverController *myPopover;
}
@property (nonatomic, retain) IBOutlet UITextView *outputPad;

- (IBAction)copyButton;
- (IBAction)refreshOutput;

@end
