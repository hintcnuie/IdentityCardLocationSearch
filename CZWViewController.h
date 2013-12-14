//
//  CZWViewController.h
//  IdentityCardLocationSearch
//
//  Created by Chen on 13-12-14.
//  Copyright (c) 2013年 cocoaObjectclearnning. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CZWSearchIdentityCardLocation.h"

#define NUMBERS_ONLY @"1234567890"
#define CHARACTER_LIMIT 3

@interface CZWViewController : UIViewController <UITextFieldDelegate>
{
    NSInteger *idCardNumber;
}
@end
