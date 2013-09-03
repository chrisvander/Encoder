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
        else {
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

    if ([[UIDevice currentDevice] userInterfaceIdiom] ==UIUserInterfaceIdiomPad) {
        [[UIDevice currentDevice] beginGeneratingDeviceOrientationNotifications];
        [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(orientationChanged) name:UIDeviceOrientationDidChangeNotification object:nil];
    }
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
