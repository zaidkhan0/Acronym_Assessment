//
//  ViewController.h
//  Acronym_Assessment
//
//  Created by king khan on 2/17/16.
//  Copyright © 2016 Zaid khan. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "connection.h"


@interface ViewController : UIViewController <TableReload, UITextFieldDelegate>

@property (weak, nonatomic) IBOutlet UITableView *tableViewDis;
@property int index;

@property (weak, nonatomic) IBOutlet UITextField *searchB;

- (IBAction)TextEnter:(id)sender;

@end

