//
//  yuanzhou.h
//  yuanzhou_Work
//
//  Created by mac on 15-9-24.
//  Copyright (c) 2015年 智游58期. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface yuanzhou : UIViewController
{
   IBOutlet UIImageView *Sun;
   IBOutlet UIImageView *Earth;
    double  sunr;  //太阳半径
    double  earthr;  //地球半径
     
    double  x;
    double  y;
    double  a;
    double  b;

    
    NSTimer *timer;



}

@end
