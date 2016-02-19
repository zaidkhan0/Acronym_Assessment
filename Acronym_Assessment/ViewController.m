//
//  ViewController.m
//  Acronym_Assessment
//
//  Created by king khan on 2/17/16.
//  Copyright © 2016 Zaid khan. All rights reserved.
//

#import "ViewController.h"
#import "CustomTableViewCell.h"
#import "connection.h"
#import "ResultTableViewController.h"
#import "MBProgressHUD.h"



@interface ViewController ()< UITableViewDataSource , UITableViewDelegate> {
    
}

@property NSMutableArray *myArray;
@property NSArray *myArray1;
@property connection * conn;
@property MBProgressHUD *hud;
@end



@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    _myArray=[[NSMutableArray alloc]init];
    _conn=[[connection alloc]init];
    _conn.delegate=self;
    // Do any additional setup after loading the view, typically from a nib.
    
    

    
    
}
-(void)shareLink:(NSMutableArray *)temp{
    _myArray= temp;
    [_tableViewDis reloadData];
    [MBProgressHUD hideHUDForView:self.view animated:YES];

 //   NSLog(@"mainfuntion");
    
    
    
    
    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    
    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    // Return the number of rows in the section.
 //   NSLog(@"arryr count cell %lu",(unsigned long)[_myArray count]);
    
    return [_myArray count];
}






//
-  (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
        CustomTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell1"];
    [tableView registerNib:[UINib nibWithNibName:@"CustomTableViewCell" bundle:nil] forCellReuseIdentifier:@"cell1"];
    cell = [tableView dequeueReusableCellWithIdentifier:@"cell1"];
   cell.titleArc.text=_myArray[indexPath.row][@"title"];
   // cell.titleArc.text = [NSString stringWithFormat:@"%@ %@",cell.titleArc.text, _myArray[indexPath.row][@"title"]];
 //   NSLog(@"%@",_myArray[indexPath.row][@"feq"]);
    cell.SinceArc.text=[NSString stringWithFormat:@"Since: %@",_myArray[indexPath.row][@"since"]];
   cell.frequencyArc.text =[NSString stringWithFormat:@"Frequency: %@",_myArray[indexPath.row][@"feq"]];
   // NSArray *temp=[_myArray objectAtIndex:indexPath.row];
//    //  NSLog(@"%@",temp);
//    cell.headLabel.text=temp[0][@"title"];
//    //   temp [@"title"];
//    cell.bottomLabel.text=temp[1][@"description"];
//    cell.songImage.image= [UIImage imageWithData:[NSData dataWithContentsOfURL:[NSURL URLWithString:temp[2][@"url"]]]];
    
    
    
    
    
    
        return cell;
}


-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    CustomTableViewCell *celll = [tableView cellForRowAtIndexPath:indexPath];
    
    _index=indexPath.row;
    [self performSegueWithIdentifier:@"seque1" sender:celll];
}






- (void) prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
    

    
        ResultTableViewController *rtv = [segue destinationViewController];
    rtv.var=_myArray[_index][@"var"];
  //      rtv.link =
    
    
}
#pragma mark - UITextField delegate methods
- (void)textFieldDidBeginEditing:(UITextField *)textField
{
    // reset All content on screen when user starts entering any text
    _searchB.text=@"";
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
    // Textfield is disabled till user enters atleast one character.
    // Dismiss Keyboard on return
    [textField resignFirstResponder];
    if(![textField.text isEqualToString:@""]){
        NSLog(@"press enter.......");
        _hud = [MBProgressHUD showHUDAddedTo:self.view animated:YES];
        _hud.mode = MBProgressHUDModeAnnularDeterminate;
        _hud.labelText = @"Loading";

        [_conn fetchAcronym:textField.text];

    //   [self fetchMeaningsForAcronym:textField.text];
    }
    
    return YES;
    
}

/*
 * delegate checks the validity of user text  entry.
 * It checks for below 3 conditions
 * 1. If entered text is less than MAXLENGTH
 * (MAXLENGTH is set to 30. This value is configurable.)
 * 2. accept return key
 * 3. accept only alphabets and numeric characters.
 */

//-(BOOL)textField:(UITextField *) textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string {
//    
//    NSUInteger oldLength = [textField.text length];
//    NSUInteger replacementLength = [string length];
//    NSUInteger rangeLength = range.length;
//    NSUInteger newLength = oldLength - rangeLength + replacementLength;
//    
//    
//    return (newLength <= MAXLENGTH || ([string rangeOfString: @"\n"].location != NSNotFound)) && ([string rangeOfCharacterFromSet:self.disallowedCharacters].location == NSNotFound);
//}

@end
