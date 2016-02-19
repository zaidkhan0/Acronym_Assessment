//
//  connection.h
//  Acronym_Assessment
//
//  Created by king khan on 2/17/16.
//  Copyright © 2016 Zaid khan. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <AFNetworking/AFNetworking.h>
#import <UIKit/UIKit.h>

@protocol TableReload <NSObject>

-(void)shareLink:(NSArray*)temp;

@end

@interface connection : NSObject


@property (nonatomic,weak) id<TableReload> delegate;

-(void)fetchAcronym:(NSString *)Grey;
-(void)fetchAcronymVar:(NSMutableArray *)var;


@end
