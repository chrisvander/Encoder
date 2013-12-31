//
//  ViewController.m
//  Encoder
//
//  Created by Chris Vanderloo on 7/24/13.
//  Copyright (c) 2013 iD Student. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController
@synthesize outputPad;

- (IBAction)copyButton {
    UIPasteboard *pasteboard = [UIPasteboard generalPasteboard];
    pasteboard.string = outputPad.text;
    
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Copied!" message:@"Data copied to clipboard." delegate:nil cancelButtonTitle:@"Okay" otherButtonTitles:nil, nil];
    [alert show];
}

- (IBAction)refreshOutput {
    NSUserDefaults *defaults = [[NSUserDefaults alloc] init];
    NSString *outputText = [defaults stringForKey:@"output"];
    NSString *dOutputText = [defaults stringForKey:@"decodeOutput"];
    outputPad.text = outputText;
    decodeOutput.text = dOutputText;
}

- (IBAction)sendTo
{
    actionSheet = [[UIActionSheet alloc] initWithTitle:@"Choose how to send" delegate:self cancelButtonTitle:@"Cancel" destructiveButtonTitle:nil otherButtonTitles:@"Message", @"Email", nil];
    [actionSheet showFromBarButtonItem:sendTo animated:YES];
    [self doesAlertViewExist];
}


-(BOOL) doesAlertViewExist {
    for (UIWindow* window in [UIApplication sharedApplication].windows) {
        NSArray* subviews = window.subviews;
        if ([subviews count] > 0) {
            
            BOOL alert = [[subviews objectAtIndex:0] isKindOfClass:[UIAlertView class]];
            BOOL action = [[subviews objectAtIndex:0] isKindOfClass:[UIActionSheet class]];
            
            if (alert || action)
                return YES;
                sendTo.enabled = FALSE;
        }
    }
    return NO;
    sendTo.enabled = TRUE;
}

- (void)actionSheet:(UIActionSheet *)actionSheet willDismissWithButtonIndex:(NSInteger)buttonIndex
{
    sendTo.enabled = TRUE;
}

- (void)actionSheet:(UIActionSheet *)actionSheet clickedButtonAtIndex:(NSInteger)buttonIndex
{
	if (buttonIndex == 0)
	{
        NSString *messageBody = [NSString stringWithFormat:@"Copy the below data and paste it into the Encoder app's Decode section.\n\n%@", outputPad.text];
        
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
        NSString *mailBody = [NSString stringWithFormat:@"Copy the below data and paste it into the Encoder app's Decode section.\n\n%@", outputPad.text];
        
        MFMailComposeViewController *mc = [[MFMailComposeViewController alloc] init];
        mc.mailComposeDelegate = self;
        [mc setSubject:emailTitle];
        [mc setMessageBody:mailBody isHTML:NO];
        
        // Present mail view controller on screen
        [self presentViewController:mc animated:YES completion:NULL];
	}
}


- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    myPopover = [(UIStoryboardPopoverSegue *)segue popoverController];
}
- (BOOL)shouldPerformSegueWithIdentifier:(NSString *)identifier sender:(id)sender {
    if (myPopover) {
        return NO;
    }
    else {
        return YES;
    }
}

- (void)orientationChanged {
    if ([[UIDevice currentDevice] userInterfaceIdiom] ==UIUserInterfaceIdiomPad) {
        UIDeviceOrientation orientation = [UIDevice currentDevice].orientation;
        if (orientation == UIDeviceOrientationPortrait) {
            NSLog(@"Portrait");
            menuButton.enabled = YES;
        }
        else if (orientation == UIDeviceOrientationPortraitUpsideDown) {
            NSLog(@"Upside Down");
            menuButton.enabled = NO;
        }
        else if (orientation == UIDeviceOrientationLandscapeLeft || orientation == UIDeviceOrientationLandscapeRight){
            NSLog(@"Landscape");
            menuButton.enabled = NO;
        }
    }
}

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
    
    NSString *defaultt = @"No output.";
    NSUserDefaults *defaults = [[NSUserDefaults alloc] init];
    [defaults setObject:defaultt forKey:@"output"];
    [defaults setObject:defaultt forKey:@"decodeOutput"];

    if ([[UIDevice currentDevice] userInterfaceIdiom] ==UIUserInterfaceIdiomPad) {
        [[UIDevice currentDevice] beginGeneratingDeviceOrientationNotifications];
        [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(orientationChanged) name:UIDeviceOrientationDidChangeNotification object:nil];
    }
    UIDeviceOrientation orientation = [UIDevice currentDevice].orientation;
    if (orientation == UIDeviceOrientationPortrait) {
        NSLog(@"Portrait");
        menuButton.enabled = YES;
    }
    self.tableView.backgroundColor = [UIColor colorWithRed:0.9 green:0.9 blue:1 alpha:1];
    [NSTimer scheduledTimerWithTimeInterval:1.0
                                     target:self
                                   selector:@selector(refreshOutput)
                                   userInfo:nil
                                    repeats:YES];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
