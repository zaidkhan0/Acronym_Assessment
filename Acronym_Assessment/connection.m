//
//  connection.m
//  Acronym_Assessment
//
//  Created by king khan on 2/17/16.
//  Copyright © 2016 Zaid khan. All rights reserved.
//

#import "connection.h"

@implementation connection

-(void)fetchAcronym:(NSString *)Grey{
    
    id<TableReload> strongDelegate=self.delegate;
    
    NSMutableArray *list=[[NSMutableArray alloc]init];
    NSString *url =[NSString stringWithFormat: @"http://www.nactem.ac.uk/software/acromine/dictionary.py?sf=%@",Grey];
    
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    manager.responseSerializer.acceptableContentTypes = [NSSet setWithObject:@"text/plain"];
    [manager GET:url parameters:nil success:^(AFHTTPRequestOperation * operation, id responseObject) {
        
            NSMutableArray *temp=responseObject;
        if (temp.count>0) {
            
        
        for (int i=0;i<[ temp [0][@"lfs"] count] ; i++) {

            [list addObject:@{
                              @"title":temp[0] [@"lfs"] [i] [@"lf"],
                              @"feq":  temp[0] [@"lfs"] [i][@"freq"],
                              @"var":temp[0] [@"lfs"] [i] [@"vars"],
                              @"since":temp[0] [@"lfs"] [i] [@"since"]
                             
                              
                              }];
        //    NSLog(@"result 123.............%@",list[i][@"var"]);


        }
        
    //    NSLog(@"result1...........%@",list);
            
    //        NSLog(@"result2....... %@",list);
            
            
        }else{
            UIAlertView *alert = [[UIAlertView alloc]initWithTitle:@"Alert" message:@"No Match Found" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
            [alert show];
        }
            
        

        
     if ([strongDelegate respondsToSelector:@selector(shareLink:)]) {
         [strongDelegate shareLink:list];

     }
     
    } failure:^(AFHTTPRequestOperation *  operation, NSError *  error) {
        NSLog(@"Error..............");
    }];
    
}
-(void)fetchAcronymVar:(NSMutableArray *)var{
    id<TableReload> strongDelegate=self.delegate;
    NSMutableArray *list=[[NSMutableArray alloc]init];

        for (int i=0;i<[ var count] ; i++) {
            
            [list addObject:@{
                              @"title":var[i][@"lf"],
                              @"feq":  var[i] [@"freq"],
                            
                              @"since":var[i] [@"since"]
                              
                              
                              }];
         //   NSLog(@"result 123.hhhhgvghghgh............%@",list);
            
            
        }
        
    
        
        
    if ([strongDelegate respondsToSelector:@selector(shareLink:)]) {
        [strongDelegate shareLink:list];
    }
    

    
    
    
        
        
   
}


@end
