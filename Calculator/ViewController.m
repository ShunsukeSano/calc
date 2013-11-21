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
    	// Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)calculate
{
    if(self.operation == 0)
        self.currentValue /= self.transrateValue;
    
    else if(self.operation == 1)
        self.currentValue *= self.transrateValue;
    
    else if(self.operation == 2)
        self.currentValue -= self.transrateValue;
    
    else if(self.operation == 3)
        self.currentValue += self.transrateValue;
    
    _Result.text = [NSString
                    stringWithFormat:@"%d", self.currentValue];
}


- (IBAction)numberButtom:(id)sender {
    UIButton *b = (UIButton *)sender;
        if(self.isInitialState){
            if(b.tag != 0){
                _Result.text = [NSString
                                stringWithFormat:@"%d", b.tag];
                self.isInitialState = NO;
            }
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
