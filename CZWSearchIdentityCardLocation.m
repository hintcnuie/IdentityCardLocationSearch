//
//  CZWSearchIdentityCardLocation.m
//  IdentityCardLocationSearch
//
//  Created by Chen on 13-12-14.
//  Copyright (c) 2013年 cocoaObjectclearnning. All rights reserved.
//

#import "CZWSearchIdentityCardLocation.h"

@implementation CZWSearchIdentityCardLocation

-(NSString *) findLocation:(NSString *)idNumber
{
    NSString *result=Nil;
    NSUInteger index=2;
    NSString * ShengPList=@"s_%@";
    
    NSUInteger length= [idNumber length];
    NSString * prefix =Nil;
    NSString * sheng = Nil;
    
    NSLog(@"Length is %lu",length);
    if (length>=2) {
        prefix = [idNumber substringToIndex:index];
        NSLog(@"prefix is %@",prefix);
        
        NSBundle *bundle = [NSBundle mainBundle];
        NSString *path=[bundle pathForResource:@"sheng" ofType:@"plist"];
        
        NSDictionary *shengListDict = [[NSDictionary alloc] initWithContentsOfFile:path];
        
        sheng = [shengListDict objectForKey:prefix];
        result = [sheng copy];
        NSLog(@"sheng is %@",sheng);
    }
    
    
    
    if (length==6 && sheng !=Nil) {
        NSString * shengName=[[NSString alloc] initWithFormat:ShengPList,sheng];
        
        NSString * shengPath =[[NSBundle mainBundle] pathForResource:shengName ofType:@"plist"];
        
        NSLog(@"sheng:%@,Path:%@",shengName,shengPath);
        NSDictionary *shengDict =[[NSDictionary alloc] initWithContentsOfFile:shengPath];
        
        if (shengDict != nil) {
            result = [shengDict objectForKey:idNumber];
            NSLog(@"sheng:%@,location:%@,Path:%@",sheng,result,shengPath);
        }
    }
    if (length <2) {
        result =@"请检查您输入的身份证号码！";
    }
    if (result == Nil) {
        result = @"您输入的地址没有查到！";
    }
    
    return result;
}
@end
