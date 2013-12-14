//
//  CZWViewController.m
//  IdentityCardLocationSearch
//
//  Created by Chen on 13-12-14.
//  Copyright (c) 2013年 cocoaObjectclearnning. All rights reserved.
//

#import "CZWViewController.h"

@interface CZWViewController ()
@property (weak, nonatomic) IBOutlet UITextField *idNumberTextField;
@property (weak, nonatomic) IBOutlet UILabel *LocationInfoLabel;
- (IBAction)searchLocationInfo:(id)sender;

@end

@implementation CZWViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}



- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

//only number is allowed
-(BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string
{
    // Check for non-numeric characters
    NSUInteger lengthOfString = string.length;
    for (NSInteger loopIndex = 0; loopIndex < lengthOfString; loopIndex++) {
        unichar character = [string characterAtIndex:loopIndex];
        
        // 48 unichar for 0
        if (character < 48){
            NSLog(@"Invalid character:%c",character);
            return NO;
        }
        // 57 unichar for 9
        if (character > 57){
            NSLog(@"Invalid character:%c",character);
            return NO;
        }
    }
        // Check for total length
        NSUInteger proposedNewLength = textField.text.length - range.length + string.length;
        
        if (proposedNewLength > 6){
            NSLog(@"string out of len:%@",string);
            return NO;
        }
        return YES;
}

- (BOOL) textFieldShouldReturn:(UITextField *)textField
{
    if (textField == self.idNumberTextField) {
        [textField resignFirstResponder];
    }
    return YES;
}

- (IBAction)searchLocationInfo:(id)sender {
    NSString *idNumberString=self.idNumberTextField.text;
    CZWSearchIdentityCardLocation *card = [[CZWSearchIdentityCardLocation alloc] init];
    
    NSString *location=[card findLocation:idNumberString];
    NSString *result  = [[NSString alloc] initWithFormat:@"归属地:%@",location];
    self.LocationInfoLabel.text=result;
}
@end
