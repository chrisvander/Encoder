//
//  SidebarViewController.h
//  Encoder
//
//  Created by Chris Vanderloo on 10/2/13.
//  Copyright (c) 2013 iD Student. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SidebarViewController : UITableViewController
{
    IBOutlet UITableView *slideOver;
}

@property (nonatomic, strong) NSArray *menuItems;

@end
