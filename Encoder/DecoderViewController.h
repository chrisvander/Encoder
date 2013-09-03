//
//  DecoderViewController.h
//  Encoder
//
//  Created by iD Student on 7/3/13.
//  Copyright (c) 2013 iD Student. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DecoderViewController : UITableViewController <UITextFieldDelegate>
{
    IBOutlet UITextField *encryption;
    IBOutlet UITextView *decodeOutput;
    IBOutlet UITextField *keyString;
    IBOutlet UIProgressView *decoding;
    NSString *encryptionStr;
    NSString *output;
}
@property (nonatomic, retain) IBOutlet UITextField *encryption;
@property (nonatomic, retain) IBOutlet UITextField *keyString;

- (IBAction)decode;
- (IBAction)pasteData;

@end
