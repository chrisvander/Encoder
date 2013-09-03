//
//  OutputViewController.h
//  Encoder
//
//  Created by iD Student on 7/3/13.
//  Copyright (c) 2013 iD Student. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MessageUI/MessageUI.h>

@interface OutputViewController : UITableViewController <UIActionSheetDelegate, MFMailComposeViewControllerDelegate, MFMessageComposeViewControllerDelegate>
{
    IBOutlet UITextView *output;
    IBOutlet UIBarButtonItem *sendTo;
}

-(IBAction)copyData;
-(IBAction)sendTo;
-(void)insertOutput;

@end
