//
//  TableViewController.m
//  Encoder
//
//  Created by iD Student on 7/2/13.
//  Copyright (c) 2013 iD Student. All rights reserved.
//

#import "TableViewController.h"
#import "OutputViewController.h"

@interface TableViewController ()

@end

@implementation TableViewController
@synthesize messageText;


- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
    [textField resignFirstResponder];
    NSString *noCaps = [messageText.text uppercaseString];
    messageText.text = noCaps;
    messageText.text = [messageText.text stringByReplacingOccurrencesOfString:@"Œ" withString:@"O"];
    messageText.text = [[messageText.text componentsSeparatedByCharactersInSet:[NSCharacterSet symbolCharacterSet]] componentsJoinedByString:@""];
    messageText.text = [[messageText.text componentsSeparatedByCharactersInSet:[NSCharacterSet punctuationCharacterSet]] componentsJoinedByString:@""];
    messageText.text =[[NSString alloc] initWithData:[messageText.text dataUsingEncoding:NSASCIIStringEncoding allowLossyConversion:YES] encoding:NSASCIIStringEncoding];
    return YES;
}

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        // Custom initialization
    }
    return self;
}

-(BOOL)canPerformAction:(SEL)action withSender:(id)sender {
   UIMenuController *menuController = [UIMenuController sharedMenuController];
   if (menuController) {
      [UIMenuController sharedMenuController].menuVisible = NO;
   }
   return NO;
}

- (void)viewDidLoad
{
   [super viewDidLoad];
   [[UIApplication sharedApplication] setStatusBarStyle:UIStatusBarStyleLightContent];
   [messageText setDelegate:self];
   key.minimumValue = 1;
   key.maximumValue = 50;
   paths.minimumValue = 1;
   paths.maximumValue = 50;
   keyLabel.text = [NSString stringWithFormat:@"%.f", key.value];
   pathsLabel.text = [NSString stringWithFormat:@"%.f", paths.value];
   messageText.autocorrectionType = UITextAutocorrectionTypeNo;
   messageText.autocapitalizationType = UITextAutocapitalizationTypeNone;
   self.tableView.tintColor = [UIColor colorWithRed:0.6 green:0.6 blue:0.9 alpha:1];
   self.view.window.tintColor = [UIColor redColor];
   [[UINavigationBar appearance] setTitleTextAttributes: [NSDictionary dictionaryWithObjectsAndKeys:
                                                          [UIColor colorWithRed:0.0/0.0 green:0.0/0.0 blue:0.0/0.0 alpha:1.0], UITextAttributeTextColor,
                                                          [UIFont fontWithName:@"HelveticaNeue-Light" size:21.0], UITextAttributeFont, nil]];
   encoding.hidden = YES;
}

- (IBAction)stepperValueChanged:(id)sender
{
    double keyStepperValue = key.value;
    keyLabel.text = [NSString stringWithFormat:@"%.f", keyStepperValue];
    double pathStepperValue = paths.value;
    pathsLabel.text = [NSString stringWithFormat:@"%.f", pathStepperValue];
}

- (IBAction)encodeButtonPressed {
   
   NSString *noCaps = [messageText.text uppercaseString];
   messageText.text = noCaps;
   messageText.text = [messageText.text stringByReplacingOccurrencesOfString:@"Œ" withString:@"O"];
   messageText.text = [[messageText.text componentsSeparatedByCharactersInSet:[NSCharacterSet symbolCharacterSet]] componentsJoinedByString:@""];
   messageText.text = [[messageText.text componentsSeparatedByCharactersInSet:[NSCharacterSet punctuationCharacterSet]] componentsJoinedByString:@""];
   messageText.text =[[NSString alloc] initWithData:[messageText.text dataUsingEncoding:NSASCIIStringEncoding allowLossyConversion:YES] encoding:NSASCIIStringEncoding];
   
   [encoding setHidden:NO];
   [encoding setProgress:0 animated:YES];
    if ([messageText.text  isEqual: @""]) {
      messageText.text = @" ";
   }
    NSString *message = messageText.text;
    outputst = @"";
    NSUInteger messageLength = [message length];
    keyi = [keyLabel.text intValue];
    path = [pathsLabel.text intValue];
    NSInteger loop = 0;
    message=[[NSString alloc] initWithData:[message dataUsingEncoding:NSASCIIStringEncoding allowLossyConversion:YES] encoding:NSASCIIStringEncoding];
    message=[message stringByReplacingOccurrencesOfString:@"9" withString:@"99."];
    message=[message stringByReplacingOccurrencesOfString:@"8" withString:@"89."];
    message=[message stringByReplacingOccurrencesOfString:@"7" withString:@"88."];
    message=[message stringByReplacingOccurrencesOfString:@"6" withString:@"87."];
    message=[message stringByReplacingOccurrencesOfString:@"5" withString:@"86."];
    message=[message stringByReplacingOccurrencesOfString:@"4" withString:@"85."];
    message=[message stringByReplacingOccurrencesOfString:@"3" withString:@"84."];
    message=[message stringByReplacingOccurrencesOfString:@"2" withString:@"83."];
    message=[message stringByReplacingOccurrencesOfString:@"1" withString:@"82."];
    message=[message stringByReplacingOccurrencesOfString:@"0" withString:@"81."];
    message=[message stringByReplacingOccurrencesOfString:@"A" withString:@"26."];
    message=[message stringByReplacingOccurrencesOfString:@"B" withString:@"25."];
    message=[message stringByReplacingOccurrencesOfString:@"C" withString:@"24."];
    message=[message stringByReplacingOccurrencesOfString:@"D" withString:@"23."];
    message=[message stringByReplacingOccurrencesOfString:@"E" withString:@"22."];
    message=[message stringByReplacingOccurrencesOfString:@"F" withString:@"21."];
    message=[message stringByReplacingOccurrencesOfString:@"G" withString:@"20."];
    message=[message stringByReplacingOccurrencesOfString:@"H" withString:@"19."];
    message=[message stringByReplacingOccurrencesOfString:@"I" withString:@"18."];
    message=[message stringByReplacingOccurrencesOfString:@"J" withString:@"17."];
    message=[message stringByReplacingOccurrencesOfString:@"K" withString:@"16."];
    message=[message stringByReplacingOccurrencesOfString:@"L" withString:@"15."];
    message=[message stringByReplacingOccurrencesOfString:@"M" withString:@"14."];
    message=[message stringByReplacingOccurrencesOfString:@"N" withString:@"13."];
    message=[message stringByReplacingOccurrencesOfString:@"O" withString:@"12."];
    message=[message stringByReplacingOccurrencesOfString:@"P" withString:@"11."];
    message=[message stringByReplacingOccurrencesOfString:@"Q" withString:@"10."];
    message=[message stringByReplacingOccurrencesOfString:@"R" withString:@"35."];
    message=[message stringByReplacingOccurrencesOfString:@"S" withString:@"34."];
    message=[message stringByReplacingOccurrencesOfString:@"T" withString:@"33."];
    message=[message stringByReplacingOccurrencesOfString:@"U" withString:@"32."];
    message=[message stringByReplacingOccurrencesOfString:@"V" withString:@"31."];
    message=[message stringByReplacingOccurrencesOfString:@"W" withString:@"30."];
    message=[message stringByReplacingOccurrencesOfString:@"X" withString:@"29."];
    message=[message stringByReplacingOccurrencesOfString:@"Y" withString:@"28."];
    message=[message stringByReplacingOccurrencesOfString:@"Z" withString:@"27."];
    message=[message stringByReplacingOccurrencesOfString:@" " withString:@"37."];
    message=[message uppercaseString];
    NSLog(@"Encoded string [%@]", message);
    NSInteger ra = (arc4random()%(path * 16) + 1);
    NSInteger r = (arc4random()%((keyi * 12) * 128) + 1);
    NSArray *unmutableArray = [message componentsSeparatedByString:@"."];
    NSMutableArray *arr = [(NSArray *) unmutableArray mutableCopy];
    NSLog(@"Converting via 'Key Length'");
    while (loop <= messageLength - 1 ) {
        NSString *temp = [arr objectAtIndex:loop];
        NSInteger tempInt = [temp integerValue];
        tempInt = (tempInt * r);
        NSString *tempStr = [NSString stringWithFormat:@"%ld", (long)tempInt];
        [arr replaceObjectAtIndex:loop withObject:tempStr];
        loop++;
        NSLog(@"%@", tempStr);
        outputst = [NSString stringWithFormat:@"%@%@-", outputst, tempStr];
    }
    outputst = [outputst substringToIndex:[outputst length] - 1];
    outputst = [NSString stringWithFormat:@"%@\nKey: %d.%d", outputst, (r * ra), ra];
    [arr removeLastObject];
    NSUserDefaults *defaults = [[NSUserDefaults alloc] init];
    [defaults setObject:outputst forKey:@"output"];
   if ([[UIDevice currentDevice] userInterfaceIdiom] ==UIUserInterfaceIdiomPhone) {
      [NSTimer scheduledTimerWithTimeInterval:0.2 target:self selector:@selector(interval) userInfo:nil repeats:NO];
   }
}

- (void)interval
{
   [encoding setProgress:1 animated:YES];
   [NSTimer scheduledTimerWithTimeInterval:0.4 target:self selector:@selector(openOutput) userInfo:nil repeats:NO];
}

- (void)openOutput {
   encoding.hidden = YES;
   [self performSegueWithIdentifier:@"pushToOutput" sender:self];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void) tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath
{
   static UIImage* bgImage = nil;
   if (bgImage == nil) {
      bgImage = [UIImage imageNamed:@"myimage.png"];
   }
   cell.backgroundView = [[UIImageView alloc] initWithImage:bgImage]; 
}
@end
