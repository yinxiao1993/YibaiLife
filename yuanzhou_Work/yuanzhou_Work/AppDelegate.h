//
//  AppDelegate.h
//  yuanzhou_Work
//
//  Created by mac on 15-9-24.
//  Copyright (c) 2015年 智游58期. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface AppDelegate : UIResponder <UIApplicationDelegate>
{
    UIImageView *SunView;
    UIImageView *EarthView;
    UIImageView *yueqiu;
    double a;  //旋转的角度
    double b;  //旋转的角度
    double c1;  
    double c2;  
    
    NSTimer *timer1;
    NSTimer *timer2;
    





}

@property (strong, nonatomic) UIWindow *window;

@property (readonly, strong, nonatomic) NSManagedObjectContext *managedObjectContext;
@property (readonly, strong, nonatomic) NSManagedObjectModel *managedObjectModel;
@property (readonly, strong, nonatomic) NSPersistentStoreCoordinator *persistentStoreCoordinator;

- (void)saveContext;
- (NSURL *)applicationDocumentsDirectory;

@end
