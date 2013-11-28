//
//  ViewController.m
//  Calculator
//
//  Created by 佐野　隼輔 on 13/11/14.
//  Copyright (c) 2013年 University_of_Kitakyusyu. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController


- (void)viewDidLoad
{
    [super viewDidLoad];
    self.isInitialState = YES;
    self.pushOperation = NO;
    self.enableEqual = NO;
    self.enableOperation = NO;
    self.enableDecimalPoint = YES;
}

- (void)calculate
{
    switch(self.operation){
        case 0:
            if(self.transrateValue != 0)
                self.currentValue /= self.transrateValue;
            else{
                _Result.text = [NSString
                            stringWithFormat:@".E"];
                self.enableOperation = NO;
                self.enableEqual = NO;
                self.enableDecimalPoint = NO;
                break;
            }
    
        case 1: self.currentValue *= self.transrateValue;
                _Result.text = [NSString
                            stringWithFormat:@"%g", self.currentValue];
                break;
    
        case 2: self.currentValue -= self.transrateValue;
                _Result.text = [NSString
                            stringWithFormat:@"%g", self.currentValue];
                break;
    
        case 3: self.currentValue += self.transrateValue;
                _Result.text = [NSString
                            stringWithFormat:@"%g", self.currentValue];
                break;
    
        case 4: self.currentValue = pow(self.currentValue,self.transrateValue);
                _Result.text = [NSString
                            stringWithFormat:@"%g", self.currentValue];
                break;
    }
}


- (IBAction)numberButtom:(id)sender {
    UIButton *b = (UIButton *)sender;
        if(self.isInitialState){
            if(b.tag != 0){
                _Result.text = [NSString
                                stringWithFormat:@"%d", b.tag];
                self.isInitialState = NO;
            } else
                _Result.text = [NSString
                                stringWithFormat:@"0"];

            
        } else {
            _Result.text = [NSString
                            stringWithFormat:@"%@%d", _Result.text,b.tag];
        }
        self.transrateValue = _Result.text.floatValue;
        self.enableOperation = YES;
        if(self.pushOperation){
            self.enableEqual = YES;
            self.enableDecimalPoint = YES;
        }
}



- (IBAction)operationButtom:(id)sender {
    UIButton *b = (UIButton *)sender;
        if(self.enableOperation){
            if(self.pushOperation == NO){
                self.currentValue = self.transrateValue;
                self.pushOperation = YES;
            }else {
                [self calculate];
            }
            self.operation = b.tag;
            self.isInitialState = YES;
            self.enableOperation = NO;
            self.enableDecimalPoint = NO;
    }
}


- (IBAction)clearButtom:(id)sender {
    _Result.text = @"0";
    self.currentValue = 0;
    self.transrateValue = 0;
    self.isInitialState = YES;
    self.pushOperation = NO;
    self.enableDecimalPoint = YES;
}



- (IBAction)equalButtom:(id)sender {
    if(self.enableEqual){
        [self calculate];
        self.transrateValue = _Result.text.floatValue;
        self.isInitialState = YES;
        self.enableEqual = NO;
        self.pushOperation = NO;
    }
}

- (IBAction)decimalPointButtom:(id)sender {
    if(self.enableDecimalPoint){
        _Result.text = [NSString
                    stringWithFormat:@"%@.", _Result.text];
        self.enableDecimalPoint = NO;
        self.isInitialState = NO;
    }
}

@end
