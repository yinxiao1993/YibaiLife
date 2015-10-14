//
//  Find.h
//  yibaiTest
//
//  Created by mac on 15-9-26.
//  Copyright (c) 2015年 智游58期. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface Find : UIViewController<UIWebViewDelegate,UIScrollViewDelegate>
{
    UIWebView *VC;
   
    UIWebView *baiduview;
    UIScrollView *scrollview;
    UIView *view;
    
    
    UIActivityIndicatorView *activi;
    
   
    
    UILabel *label;
    UIImageView *imageviewxianshi;
    UIButton *bttitleleft1;
    UIImageView *imagetitle;
    
    NSMutableArray *Namemutable;
    NSMutableArray *URLmutable;
    NSString *str;

}
-(void)CreateTitle;
@end
