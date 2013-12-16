//
//  AppDelegate.h
//  zJ_Poker_Demo
//
//  Created by zJ on 13-12-4.
//  Copyright (c) 2013年 zJ. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MainViewController.h"
#import "BaseNavigationController.h"

@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;

@property (readonly, strong, nonatomic) NSManagedObjectContext *managedObjectContext;
@property (readonly, strong, nonatomic) NSManagedObjectModel *managedObjectModel;
@property (readonly, strong, nonatomic) NSPersistentStoreCoordinator *persistentStoreCoordinator;

@property (strong,nonatomic) MainViewController *mainViewController;
@property (strong,nonatomic) BaseNavigationController *gameSquareStack;

- (void)saveContext;
- (NSURL *)applicationDocumentsDirectory;

@end
