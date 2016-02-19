//
//  ResultTableViewController.h
//  Acronym_Assessment
//
//  Created by king khan on 2/18/16.
//  Copyright © 2016 Zaid khan. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface ResultTableViewController : UITableViewController

@property (strong, nonatomic) NSString *link;
@property (strong, nonatomic) IBOutlet UITableView *tableVar;
@property (strong,nonatomic) NSMutableArray* var;



@end
