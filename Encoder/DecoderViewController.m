//
//  DecoderViewController.m
//  Encoder
//
//  Created by iD Student on 7/3/13.
//  Copyright (c) 2013 iD Student. All rights reserved.
//

#import "TableViewController.h"
#import "DecoderViewController.h"
#import "SidebarViewController.h"
#import "SWRevealViewController.h"

@interface DecoderViewController ()

@end

@implementation DecoderViewController
@synthesize encryption;
@synthesize keyString;


- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
    [textField resignFirstResponder];

    return YES;
}

-(IBAction)pasteData
{
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Confirm" message:[NSString stringWithFormat:@"Must have been copied in the format 'xxxx-xxxx-xxxx Key: xxxx.xx'"] delegate:self cancelButtonTitle:@"Cancel" otherButtonTitles:@"Okay", nil];
    [alert show];
}

-(void) alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex{

    if (buttonIndex == 1) {
        UIPasteboard *pasteboard = [UIPasteboard generalPasteboard];
        NSString *data = pasteboard.string;
        
        NSLog(@"%@", data);
        
        if ([data rangeOfString:@"Key: "].location == NSNotFound) {
            UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Invalid Data" message:@"Data is not in correct format. Please copy it again." delegate:nil cancelButtonTitle:@"Okay" otherButtonTitles:nil, nil];
            [alert show];
        } else {
            NSArray *arr = [data componentsSeparatedByString:@"Key: "];
            encryption.text = [arr objectAtIndex:0];
            keyString.text = [arr objectAtIndex:1];
        }
        if ([keyString.text  isEqual: @"PK"])
        {
            thePK = YES;
            keyString.text = @"";
            keyString.placeholder = @"Please enter your Personal Key";
        }
        else
        {
            thePK = NO;
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

- (IBAction)decode
{
    decoding.hidden = NO;
    [decoding setProgress:0 animated:NO];
    encryptionStr = encryption.text;
    NSLog(@"Encryption String: %@", encryptionStr);
    NSString *firstKey;
    NSString *keyDecode;
    if (!thePK) {
        NSString *key = keyString.text;
        NSArray *keyArr = [key componentsSeparatedByString:@"."];
        firstKey = [keyArr objectAtIndex:0];
        NSLog(@"First: %@", firstKey);
        keyDecode = [keyArr objectAtIndex:1];
        NSLog(@"Key Decode: %@", keyDecode);
    }
    else {
        keyDecode = keyString.text;
    }
    NSInteger keyInt;
    if (thePK)
    {
        keyInt = [keyDecode intValue];
    }
    else {
        keyInt = [firstKey intValue] / [keyDecode intValue];
    }
    
    NSLog(@"Total Key Int: %ld", (long)keyInt);
    NSArray *encryptionArr = [encryptionStr componentsSeparatedByString:@"-"];
    NSLog(@"%lu", (unsigned long)[encryptionArr count]);
    output = @"";
    [decoding setProgress:0.4 animated:YES];
    int loop = 0;
    while (loop < [encryptionArr count]) {
        NSString *currentObj = [encryptionArr objectAtIndex:loop];
        NSLog(@"Current Object: %@", currentObj);
        NSString *numberID = [NSString stringWithFormat:@"%d", [currentObj intValue] / keyInt];
        NSLog(@"NumberID: %@", numberID);
        numberID=[[NSString alloc] initWithData:[numberID dataUsingEncoding:NSASCIIStringEncoding allowLossyConversion:YES] encoding:NSASCIIStringEncoding];
        numberID=[numberID stringByReplacingOccurrencesOfString:@"37" withString:@" "];
        numberID=[numberID stringByReplacingOccurrencesOfString:@"99" withString:@"9"];
        numberID=[numberID stringByReplacingOccurrencesOfString:@"89" withString:@"8"];
        numberID=[numberID stringByReplacingOccurrencesOfString:@"88" withString:@"7"];
        numberID=[numberID stringByReplacingOccurrencesOfString:@"87" withString:@"6"];
        numberID=[numberID stringByReplacingOccurrencesOfString:@"86" withString:@"5"];
        numberID=[numberID stringByReplacingOccurrencesOfString:@"85" withString:@"4"];
        numberID=[numberID stringByReplacingOccurrencesOfString:@"84" withString:@"3"];
        numberID=[numberID stringByReplacingOccurrencesOfString:@"83" withString:@"2"];
        numberID=[numberID stringByReplacingOccurrencesOfString:@"82" withString:@"1"];
        numberID=[numberID stringByReplacingOccurrencesOfString:@"81" withString:@"0"];
        numberID=[numberID stringByReplacingOccurrencesOfString:@"26" withString:@"A"];
        numberID=[numberID stringByReplacingOccurrencesOfString:@"25" withString:@"B"];
        numberID=[numberID stringByReplacingOccurrencesOfString:@"24" withString:@"C"];
        numberID=[numberID stringByReplacingOccurrencesOfString:@"23" withString:@"D"];
        numberID=[numberID stringByReplacingOccurrencesOfString:@"22" withString:@"E"];
        numberID=[numberID stringByReplacingOccurrencesOfString:@"21" withString:@"F"];
        numberID=[numberID stringByReplacingOccurrencesOfString:@"20" withString:@"G"];
        numberID=[numberID stringByReplacingOccurrencesOfString:@"19" withString:@"H"];
        numberID=[numberID stringByReplacingOccurrencesOfString:@"18" withString:@"I"];
        numberID=[numberID stringByReplacingOccurrencesOfString:@"17" withString:@"J"];
        numberID=[numberID stringByReplacingOccurrencesOfString:@"16" withString:@"K"];
        numberID=[numberID stringByReplacingOccurrencesOfString:@"15" withString:@"L"];
        numberID=[numberID stringByReplacingOccurrencesOfString:@"14" withString:@"M"];
        numberID=[numberID stringByReplacingOccurrencesOfString:@"13" withString:@"N"];
        numberID=[numberID stringByReplacingOccurrencesOfString:@"12" withString:@"O"];
        numberID=[numberID stringByReplacingOccurrencesOfString:@"11" withString:@"P"];
        numberID=[numberID stringByReplacingOccurrencesOfString:@"10" withString:@"Q"];
        numberID=[numberID stringByReplacingOccurrencesOfString:@"35" withString:@"R"];
        numberID=[numberID stringByReplacingOccurrencesOfString:@"34" withString:@"S"];
        numberID=[numberID stringByReplacingOccurrencesOfString:@"33" withString:@"T"];
        numberID=[numberID stringByReplacingOccurrencesOfString:@"32" withString:@"U"];
        numberID=[numberID stringByReplacingOccurrencesOfString:@"31" withString:@"V"];
        numberID=[numberID stringByReplacingOccurrencesOfString:@"30" withString:@"W"];
        numberID=[numberID stringByReplacingOccurrencesOfString:@"29" withString:@"X"];
        numberID=[numberID stringByReplacingOccurrencesOfString:@"28" withString:@"Y"];
        numberID=[numberID stringByReplacingOccurrencesOfString:@"27" withString:@"Z"];
        numberID=[numberID uppercaseString];
        NSLog(@"Letter: %@", numberID);
        output = [output stringByAppendingString:numberID];
        loop++;
    }
    [decoding setProgress:1 animated:YES];
    [NSTimer scheduledTimerWithTimeInterval:0.3 target:self selector:@selector(finishDecode) userInfo:nil repeats:NO];
}
                      
- (void)finishDecode {
    NSLog(@"Final String: %@", output);
    [decodeOutput setText:output];
    NSUserDefaults *defaults = [[NSUserDefaults alloc] init];
    [defaults setObject:output forKey:@"decodeOutput"];
    [decoding setHidden:YES];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    decoding.hidden = YES;
    self.tableView.backgroundColor = [UIColor colorWithRed:0.9 green:0.9 blue:1 alpha:1];
    encryption.delegate=self;
    keyString.delegate=self;
    if ([[UIDevice currentDevice] userInterfaceIdiom] ==UIUserInterfaceIdiomPhone) {
        self.tableView.tintColor = [UIColor colorWithRed:0.6 green:0.6 blue:0.9 alpha:1];
    }
    // Set the side bar button action. When it's tapped, it'll show up the sidebar.
    pullOver.target = self.revealViewController;
    pullOver.action = @selector(revealToggle:);
    
    // Set the gesture
    [self.view addGestureRecognizer:self.revealViewController.panGestureRecognizer];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
