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
    	// Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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
            self.transrateValue = _Result.text.integerValue;
        }
}







- (IBAction)operationButtom:(id)sender {
        UIButton *b = (UIButton *)sender;
        self.currentValue = self.transrateValue;
        self.operation = b.tag;
}







- (IBAction)clearButtom:(id)sender {
    _Result.text = @"0";
    self.isInitialState = YES;
    
}







- (IBAction)equalButtom:(id)sender {
}

@end
