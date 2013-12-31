//
//  TableViewController.m
//  Encoder
//
//  Created by iD Student on 7/2/13.
//  Copyright (c) 2013 iD Student. All rights reserved.
//

#import "TableViewControlleriPad.h"
#import "OutputViewController.h"
#import "ViewController.h"

@interface TableViewControlleriPad ()

@end

@protocol ViewControllerDelegate;

@implementation TableViewControlleriPad
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

-(void)doneWithNumberPad{
   [key1 resignFirstResponder];
   [key2 resignFirstResponder];
}

- (IBAction)help
{
   UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Help" message:@"If left blank, the key will be generated randomly. However, if you enter a string of numbers that a friend can remember, he/she can decode the message with his/her specific key. This keeps from anyone else with the app getting ahold of the message you are trying to send unless they have that key. This is also why we call it 'the key'." delegate:nil cancelButtonTitle:@"Got it!" otherButtonTitles:nil, nil];
   [alert show];
}

- (void)viewDidLoad
{
   [super viewDidLoad];
   
   UIToolbar* numberToolbar = [[UIToolbar alloc]initWithFrame:CGRectMake(0, 0, 320, 50)];
   numberToolbar.barStyle = UIBarStyleBlackOpaque;
   numberToolbar.items = [NSArray arrayWithObjects:
                          [[UIBarButtonItem alloc]initWithTitle:@"Done" style:UIBarButtonItemStyleDone target:self action:@selector(doneWithNumberPad)],
                          nil];
   [numberToolbar sizeToFit];
   key1.inputAccessoryView = numberToolbar;
   key2.inputAccessoryView = numberToolbar;
   
   [[UIApplication sharedApplication] setStatusBarStyle:UIStatusBarStyleLightContent];
   [messageText setDelegate:self];
   keyLabel.text = [NSString stringWithFormat:@"%.f", key.value];
   messageText.autocorrectionType = UITextAutocorrectionTypeNo;
   messageText.autocapitalizationType = UITextAutocapitalizationTypeNone;
   self.tableView.tintColor = [UIColor colorWithRed:0.6 green:0.6 blue:0.9 alpha:1];
   self.view.window.tintColor = [UIColor redColor];
   self.tableView.backgroundColor = [UIColor colorWithRed:0.9 green:0.9 blue:1 alpha:1];
   navBar.barTintColor = [UIColor redColor];
   [[UINavigationBar appearance] setTitleTextAttributes: [NSDictionary dictionaryWithObjectsAndKeys:
                                                          [UIColor colorWithRed:0.0/0.0 green:0.0/0.0 blue:0.0/0.0 alpha:1.0], UITextAttributeTextColor,
                                                          [UIFont fontWithName:@"HelveticaNeue-Light" size:21.0], UITextAttributeFont, nil]];
   encoding.hidden = YES;
   
   [key addTarget:self action:@selector(sliderValueChanged:) forControlEvents:UIControlEventValueChanged];
}

- (IBAction)sliderValueChanged:(UISlider *)sender
{
    double keyStepperValue = key.value;
    keyLabel.text = [NSString stringWithFormat:@"%.f", keyStepperValue];
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
   BOOL keycode;
   NSInteger ra2;
   if ([key1.text  isEqual: @""] || [key2.text  isEqual: @""])
   {
      ra = (arc4random()%(keyi * 16) + 1);
      r = (arc4random()%((keyi * 12) * 128) + 1);
      keycode = NO;
   }
   else
   {
      NSString *rat = key1.text;
      NSString *rt = key2.text;
      ra2 = [rat integerValue];
      r = [rt integerValue];
      keycode = YES;
      ra = (ra2 / r);
   }
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
   if (keycode) {
      outputst = [NSString stringWithFormat:@"%@\nKey: PK", outputst];
   }
   else {
      outputst = [NSString stringWithFormat:@"%@\nKey: %d.%d", outputst, (r * ra), ra];
   }
   [arr removeLastObject];
    NSUserDefaults *defaults = [[NSUserDefaults alloc] init];
    [defaults setObject:outputst forKey:@"output"];
   if ([[UIDevice currentDevice] userInterfaceIdiom] ==UIUserInterfaceIdiomPhone) {
      [NSTimer scheduledTimerWithTimeInterval:0.2 target:self selector:@selector(interval) userInfo:nil repeats:NO];
   }
    ViewController *vc = [[ViewController alloc] init];
    [vc refreshOutput];
    NSLog(@"Did refreshOutput");
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
