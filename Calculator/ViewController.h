//
//  ViewController.h
//  Calculator
//
//  Created by 佐野　隼輔 on 13/11/14.
//  Copyright (c) 2013年 University_of_Kitakyusyu. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController

@property NSUInteger isInitialState;//初期状態かどうか　YES：初期　NO：違う

@property NSInteger transrateValue;//文字列を数値に変換したものを格納する変数

@property NSInteger currentValue;//演算子が押されたときに現在の数値を格納する。

@property NSInteger operation;//どの演算子が押されたかの判別

@property NSInteger pushOperation;//以前に演算子が押されているかどうかの判別

@property NSInteger enableEqual;//イコールボタンを押すことができるかの判別

@property NSInteger enableOperation;//演算子ボタンを押すことができるかの判別

@property NSInteger enableDecimalPoint;//小数点ボタンを押すことができるかどうかの判別

- (IBAction)numberButtom:(id)sender;

- (IBAction)operationButtom:(id)sender;

- (IBAction)clearButtom:(id)sender;

- (IBAction)equalButtom:(id)sender;

- (IBAction)decimalPointButtom:(id)sender;

@property (weak, nonatomic) IBOutlet UILabel *Result;

@end
