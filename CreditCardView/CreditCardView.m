//
//  CreditCardView.m
//  CreditCardView
//
//  Created by Joe Manto on 6/20/16.
//  Copyright © 2016 Joe Manto. All rights reserved.
//

#import "CreditCardView.h"

@implementation CreditCardView{
    float width;
    float height;
}

- (id)initWithFrame:(NSString*)Card withPos:(CGPoint)pos{
    
    UIImage * cardImage = [UIImage imageNamed:@"BlackCard"];
    width = cardImage.size.width;
    height = cardImage.size.height;
    _cardIsFliped = false;
    
    self = [super initWithFrame:CGRectMake(pos.x-(width/2), pos.y - (height/2),width , height)];
    if (self) {
     
        
        _cardView = [[UIImageView alloc]initWithImage:cardImage];
        
        _cardNumber = [[UILabel alloc]initWithFrame:CGRectMake(width-200, height-125, 200, 100)];
        _cardNumber.textColor = [UIColor whiteColor];
        _cardNumber.font = [UIFont fontWithName:@"AvenirNext-Regular" size:15];
        _cardNumber.text = @"";
        
        
        _cardDate = [[UILabel alloc]initWithFrame:CGRectMake(width-120, height-50, 50, 50)];
        _cardDate.textColor = [UIColor whiteColor];
        _cardDate.font = [UIFont fontWithName:@"AvenirNext-Regular" size:10];
        _cardDate.text = @"";
        
        
        _cardName = [[UILabel alloc]initWithFrame:CGRectMake(width-210, height-50, 200, 50)];
        _cardName.textColor = [UIColor whiteColor];
        _cardName.font = [UIFont fontWithName:@"AvenirNext-Regular" size:10];
        _cardName.text = @"";
        
        _cardCvv = [[UILabel alloc]initWithFrame:CGRectMake(width-72, height-87, 50, 50)];
        _cardCvv.textColor = [UIColor whiteColor];
        _cardCvv.font = [UIFont fontWithName:@"AvenirNext-Regular" size:10];
        _cardCvv.text = @"";
        
      
        
        [self addSubview:_cardView];
        [self addFrontInfo];
       
    }
    
    return self;
}



-(void)addCharacter:(NSString*)character withTag:(NSInteger)tag{
   
    
    switch (tag) {
        case 0:
            _cardNumber.text = [NSString stringWithFormat:@"%@%@ ",_cardNumber.text,character];
            if(_cardIsFliped == true){
                [self animateSlide];
            }
            break;
        case 1:
            _cardName.text = [NSString stringWithFormat:@"%@%@",_cardName.text,character];
            if(_cardIsFliped == true){
                [self animateSlide];
            }
            break;
        case 2:
            _cardDate.text = [NSString stringWithFormat:@"%@%@",_cardDate.text,character];
            if(_cardIsFliped == true){
                [self animateSlide];
            }
            break;
        case 3:
             _cardCvv.text = [NSString stringWithFormat:@"%@%@",_cardCvv.text,character];
            if(_cardIsFliped == false){
                [self animateSlide];
            }
            break;
            
        default:
            break;
    }
    
    
}

-(BOOL)isCharacterValid:(NSString*)s{
    
    return false;
}


-(void)animatieFlip{
  
    
    [UIView animateWithDuration:0.3 delay:0.0 options:UIViewAnimationOptionCurveEaseInOut
                     animations:^(void) {
                         self.cardView.transform = CGAffineTransformMakeScale(1, -0.7);
                     }
                     completion:^(BOOL b) {
                       
                         if(_cardIsFliped == false){
                             self.cardView.image = [UIImage imageNamed:@"BlackCard_Back"];
                              _cardIsFliped = true;
                              [self removeFrontInfo];
                              [self addBackInfo];
                         }else{
                             self.cardView.image = [UIImage imageNamed:@"BlackCard"];
                             _cardIsFliped = false;
                             [self removeBackInfo];
                             [self addFrontInfo];
                         }
                        
                        }
                     ];
   [UIView animateWithDuration:0.7 delay:0.0 options:UIViewAnimationOptionCurveEaseInOut
                     animations:^(void) {
                         self.cardView.transform = CGAffineTransformMakeScale(1, 1);
                     }
                     completion:^(BOOL b) {
                      
                     }
     ];
    
    
  
}

-(void)animateSlide{
    
    
    [UIView animateWithDuration:0.4 delay:0.0 options:UIViewAnimationOptionCurveEaseInOut
                     animations:^(void) {
                         [self.cardView setCenter:CGPointMake(0-width, self.cardView.center.y)];
                     }
                     completion:^(BOOL b) {
                         
                         [self.cardView setCenter:CGPointMake(self.frame.size.width+width, self.cardView.center.y)];
                         
                         if(_cardIsFliped == false){
                             self.cardView.image = [UIImage imageNamed:@"BlackCard_Back"];
                             _cardIsFliped = true;
                             [self removeFrontInfo];
                             [self addBackInfo];
                         }else{
                             self.cardView.image = [UIImage imageNamed:@"BlackCard"];
                             _cardIsFliped = false;
                             [self removeBackInfo];
                             [self addFrontInfo];
                         }
                         
                         [UIView animateWithDuration:0.15 delay:0.0 options:UIViewAnimationOptionCurveEaseInOut
                                animations:^(void) {
                                    [self.cardView setCenter:CGPointMake(self.frame.size.width/2, self.cardView.center.y)];
                                }
                                completion:^(BOOL b) {
                                }
                          ];
                         
                     }
     ];
    
}


-(void)addFrontInfo{
   
    [self addSubview:_cardNumber];
    [self addSubview:_cardDate];
    [self addSubview:_cardName];
    
}

-(void)removeFrontInfo{
    if(_cardNumber != nil){
        [_cardNumber removeFromSuperview];
        [_cardDate removeFromSuperview];
        [_cardName removeFromSuperview];
    }
}

-(void)addBackInfo{
    [self addSubview:_cardCvv];
}

-(void)removeBackInfo{
    [_cardCvv removeFromSuperview];
}

@end
