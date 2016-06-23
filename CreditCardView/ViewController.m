//
//  ViewController.m
//  CreditCardView
//
//  Created by Joe Manto on 6/20/16.
//  Copyright © 2016 Joe Manto. All rights reserved.
//

#import "ViewController.h"
#import "CreditCardView.h"

@interface ViewController (){
    CGSize frameSize;
    CreditCardView * card;
    UITextField * cardNumberField;
    UITextField * cardNameField;
    UITextField * cardDateField;
    UITextField * cardcvvField;

}

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    frameSize = self.view.frame.size;
    
     card = [[CreditCardView alloc]initWithFrame:@"black" withPos:CGPointMake(self.view.frame.size.width/2, self.view.frame.size.height/2)];
    
    [self.view addSubview:card];
    [self setUpView];
  

    
    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    
}


-(void)setUpView{
    cardNumberField = [[UITextField alloc]initWithFrame:CGRectMake(frameSize.width-300, frameSize.height/2+100, 170, 25)];
    cardNumberField.borderStyle = UITextBorderStyleRoundedRect;
    cardNumberField.textColor = [UIColor blackColor];
    cardNumberField.font = [UIFont systemFontOfSize:17.0];
    cardNumberField.placeholder = @"Card Number";
    cardNumberField.backgroundColor = [UIColor clearColor];
    cardNumberField.autocorrectionType = UITextAutocorrectionTypeYes;
    cardNumberField.keyboardType = UIKeyboardTypePhonePad;
    cardNumberField.clearButtonMode = UITextFieldViewModeWhileEditing;
    cardNumberField.tag = 0;
    [cardNumberField addTarget:self
                  action:@selector(textFieldDidChange:)
        forControlEvents:UIControlEventEditingChanged];
    [self.view addSubview:cardNumberField];
    
    
    
    cardNameField = [[UITextField alloc]initWithFrame:CGRectMake(frameSize.width-300, frameSize.height/2+150, 170, 25)];
    cardNameField.borderStyle = UITextBorderStyleRoundedRect;
    cardNameField.textColor = [UIColor blackColor];
    cardNameField.font = [UIFont systemFontOfSize:17.0];
    cardNameField.placeholder = @"Name On Card";
    cardNameField.backgroundColor = [UIColor clearColor];
    cardNameField.autocorrectionType = UITextAutocorrectionTypeYes;
    cardNameField.keyboardType = UIKeyboardTypeDefault;
    cardNameField.clearButtonMode = UITextFieldViewModeWhileEditing;
    cardNameField.tag = 1;
    [cardNameField addTarget:self
                         action:@selector(textFieldDidChange:)
               forControlEvents:UIControlEventEditingChanged];
    [self.view addSubview:cardNameField];
    
    
    
    cardDateField = [[UITextField alloc]initWithFrame:CGRectMake(frameSize.width-300, frameSize.height/2+200, 170, 25)];
    cardDateField.borderStyle = UITextBorderStyleRoundedRect;
    cardDateField.textColor = [UIColor blackColor];
    cardDateField.font = [UIFont systemFontOfSize:17.0];
    cardDateField.placeholder = @"Expire Date";
    cardDateField.backgroundColor = [UIColor clearColor];
    cardDateField.autocorrectionType = UITextAutocorrectionTypeYes;
    cardDateField.keyboardType = UIKeyboardTypeDefault;
    cardDateField.clearButtonMode = UITextFieldViewModeWhileEditing;
    cardDateField.tag = 2;
    [cardDateField addTarget:self
                         action:@selector(textFieldDidChange:)
               forControlEvents:UIControlEventEditingChanged];
    [self.view addSubview:cardDateField];
    
    
    cardcvvField = [[UITextField alloc]initWithFrame:CGRectMake(frameSize.width-300, frameSize.height/2+250, 170, 25)];
    cardcvvField.borderStyle = UITextBorderStyleRoundedRect;
    cardcvvField.textColor = [UIColor blackColor];
    cardcvvField.font = [UIFont systemFontOfSize:17.0];
    cardcvvField.placeholder = @"CVV";
    cardcvvField.backgroundColor = [UIColor clearColor];
    cardcvvField.autocorrectionType = UITextAutocorrectionTypeYes;
    cardcvvField.keyboardType = UIKeyboardTypeDefault;
    cardcvvField.clearButtonMode = UITextFieldViewModeWhileEditing;
    cardcvvField.tag = 3;
    [cardcvvField addTarget:self
                      action:@selector(textFieldDidChange:)
            forControlEvents:UIControlEventEditingChanged];
    [self.view addSubview:cardcvvField];
}



-(void)textFieldDidChange:(id)sender{
    
 
    NSString *lastString;
    
    switch ([sender tag]) {
        case 0:
            lastString = [cardNumberField.text substringFromIndex:cardNumberField.text.length-1];
            [card addCharacter:lastString withTag:0];
            break;
        case 1:
            lastString = [cardNameField.text substringFromIndex:cardNameField.text.length-1];
            [card addCharacter:lastString withTag:1];
            break;
        case 2:
            lastString = [cardDateField.text substringFromIndex:cardDateField.text.length-1];
            [card addCharacter:lastString withTag:2];
            break;
        case 3:
            lastString = [cardcvvField.text substringFromIndex:cardcvvField.text.length-1];
            [card addCharacter:lastString withTag:3];
            break;
            
        default:
            break;
    }
}

@end
