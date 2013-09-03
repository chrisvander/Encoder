//
//  OutputViewController.m
//  Encoder
//
//  Created by iD Student on 7/3/13.
//  Copyright (c) 2013 iD Student. All rights reserved.
//

#import "OutputViewController.h"

@interface OutputViewController ()

@end

@implementation OutputViewController

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.tableView.tintColor = [UIColor colorWithRed:0.6 green:0.6 blue:0.9 alpha:1];
        [NSTimer scheduledTimerWithTimeInterval:0.3
                                         target:self
                                       selector:@selector(insertOutput)
                                       userInfo:nil
                                        repeats:NO];    
}

- (void)insertOutput
{
    NSUserDefaults *defaults = [[NSUserDefaults alloc] init];
    NSString *outputText = [defaults stringForKey:@"output"];
    output.text = outputText;
}

- (IBAction)sendTo
{
    UIActionSheet *actionSheet = [[UIActionSheet alloc] initWithTitle:nil delegate:self cancelButtonTitle:@"Cancel" destructiveButtonTitle:nil otherButtonTitles:@"Message", @"Email", nil];
    [actionSheet showFromBarButtonItem:sendTo animated:YES];
}

- (void)actionSheet:(UIActionSheet *)actionSheet clickedButtonAtIndex:(NSInteger)buttonIndex
{
	if (buttonIndex == 0)
	{
        NSString *messageBody = [NSString stringWithFormat:@"Copy the below data and paste it into the Encoder app's Decode section.\n\n%@", output.text];
        
		MFMessageComposeViewController *smsc = [[MFMessageComposeViewController alloc] init];
        smsc.messageComposeDelegate = self;
        [smsc setBody:messageBody];
        [self presentViewController:smsc animated:YES completion:nil];
	}
    if (buttonIndex == 1)
	{
		// Email Subject
        NSString *emailTitle = @"Encoder Data";
        // Email Content
        NSString *mailBody = [NSString stringWithFormat:@"Copy the below data and paste it into the Encoder app's Decode section.\n\n%@", output.text];
        
        MFMailComposeViewController *mc = [[MFMailComposeViewController alloc] init];
        mc.mailComposeDelegate = self;
        [mc setSubject:emailTitle];
        [mc setMessageBody:mailBody isHTML:NO];
        
        // Present mail view controller on screen
        [self presentViewController:mc animated:YES completion:NULL];
	}
}

- (void) messageComposeViewController:(MFMessageComposeViewController *)controller didFinishWithResult:(MessageComposeResult)result
{
    switch (result)
    {
        case MessageComposeResultCancelled:
            NSLog(@"Message cancelled");
            break;
        case MessageComposeResultSent:
            NSLog(@"Message sent");
            break;
        case MessageComposeResultFailed:
            NSLog(@"Message sent fail");
            break;
        default:
            break;
    }
    
    // Close the Message Interface
    [self dismissViewControllerAnimated:YES completion:NULL];

}

- (void) mailComposeController:(MFMailComposeViewController *)controller didFinishWithResult:(MFMailComposeResult)result error:(NSError *)error
{
    switch (result)
    {
        case MFMailComposeResultCancelled:
            NSLog(@"Mail cancelled");
            break;
        case MFMailComposeResultSaved:
            NSLog(@"Mail saved");
            break;
        case MFMailComposeResultSent:
            NSLog(@"Mail sent");
            break;
        case MFMailComposeResultFailed:
            NSLog(@"Mail sent failure: %@", [error localizedDescription]);
            break;
        default:
            break;
    }
    
    // Close the Mail Interface
    [self dismissViewControllerAnimated:YES completion:NULL];
}

- (IBAction)copyData
{
    UIPasteboard *pasteboard = [UIPasteboard generalPasteboard];
    pasteboard.string = output.text;
    
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Copied!" message:@"Data copied to clipboard." delegate:nil cancelButtonTitle:@"Okay" otherButtonTitles:nil, nil];
    [alert show];
}

@end
