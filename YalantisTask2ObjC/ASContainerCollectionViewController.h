//
//  ContainerCollectionViewController.h
//  YalantisTask2ObjC
//
//  Created by typan on 8/25/15.
//  Copyright (c) 2015 Artem Sherbachuk. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "ASCoreDataManager.h"

@interface ASContainerCollectionViewController : UIViewController

@property(nonatomic, strong) ASCoreDataManager *coreDataManager;
#warning NSFetchedResultsController должен быть в датасорсе, а не в контроллере. Контроллер ничего не ложен знать об источнике данных. Это касается и табличного контроллера
@property(nonatomic, strong) NSFetchedResultsController *fetchedResultController;

@end
