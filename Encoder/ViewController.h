//
//  ViewController.h
//  Encoder
//
//  Created by Chris Vanderloo on 7/24/13.
//  Copyright (c) 2013 iD Student. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MessageUI/MessageUI.h>

@interface ViewController : UITableViewController <UIActionSheetDelegate, MFMailComposeViewControllerDelegate, MFMessageComposeViewControllerDelegate, UIActionSheetDelegate>
{
    IBOutlet UITextView *outputPad;
    IBOutlet UITextView *decodeOutput;
    IBOutlet UIBarButtonItem *menuButton;
    __weak UIPopoverController *myPopover;
    UIActionSheet *actionSheet;
    IBOutlet UIBarButtonItem *sendTo;
    BOOL doesAlertViewExist;
}
@property (nonatomic, retain) IBOutlet UITextView *outputPad;

- (IBAction)copyButton;
- (IBAction)refreshOutput;
- (IBAction)sendTo;

- (BOOL)doesAlertViewExist;

@end
