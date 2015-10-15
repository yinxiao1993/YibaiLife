//
//  yuanzhou.m
//  yuanzhou_Work
//
//  Created by mac on 15-9-24.
//  Copyright (c) 2015年 智游58期. All rights reserved.
//

#import "yuanzhou.h"

@interface yuanzhou ()

@end

@implementation yuanzhou

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    Sun.layer.cornerRadius = 58 ;
    Sun.center = CGPointMake(160, 240);
    Earth.layer.cornerRadius = 15;
    timer = [NSTimer scheduledTimerWithTimeInterval:1.0 target:self selector:@selector(jishi) userInfo:nil repeats:YES];
    
    
    
 

   // Earth.center = CGPointMake(285, 240);
    
}
-(void)jishi
{
   // b = b+10;
    Sun.transform = CGAffineTransformMakeRotation(b/180*M_PI);
    //Sun.center = CGPointMake(160, 240);

//    for ( a = 0; a<=360; a++)
//    {
//        
//   
//   
//        a = a +10;
//        Earth.center = CGPointMake(135*cos(a/180*M_PI),135*sin(a/180*M_PI));
//        [timer fire];
//        //NSLog(@"a:%f",a);
//
//       // NSLog(@"%f",135*cos(a/180*M_PI));
//            
//        
//        
//    }
//    [UIView beginAnimations:nil context:nil];
//    [UIView setAnimationDuration:1.0];
//    Earth.center = CGPointMake(135*cos(M_PI/180*a),135*sin(M_PI/180*a));
//   // Earth.frame = CGRectMake(135*cos(M_PI/180*a), 135*sin(M_PI/180*a), 30, 30);
//    [UIView commitAnimations];
//


}
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
