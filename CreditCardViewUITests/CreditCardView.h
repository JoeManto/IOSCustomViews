//
//  CreditCardView.h
//  CreditCardView
//
//  Created by Joe Manto on 6/20/16.
//  Copyright © 2016 Joe Manto. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CreditCardView : UIView

@property (nonatomic)  UIImageView * cardView;
@property (nonatomic) UILabel * cardNumber;
@property (nonatomic) UILabel * cardName;
@property (nonatomic) UILabel * cardDate;
@property (nonatomic) UILabel * cardCvv;
@property (nonatomic) BOOL cardIsFliped;

- (id)initWithFrame:(NSString*)Card withPos:(CGPoint)pos;
-(void)addCharacter:(NSString*)character withTag:(NSInteger)tag;

@end
