//
//  AddEditEntryViewController.h
//  YalantisTask2ObjC
//
//  Created by typan on 8/26/15.
//  Copyright (c) 2015 Artem Sherbachuk. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ASCoreDataManager.h"

#import "ASPublisherEntity.h"
@class ASAddEditEntryViewController;



@protocol ASAddEditEntryViewControllerDelegate <NSObject>

@optional
- (void)cancelButtonDidTouchForAddingNewPublisherIn:(ASAddEditEntryViewController *)ctrl;
- (void)cancelButtonDidTouchForEditingPublisherIn:(ASAddEditEntryViewController *)ctrl withIndexPathCell:(NSIndexPath*)indexPath;
//- (void)addNewASPublisherEntityIn:(ASAddEditEntryViewController *)controller  publisherEntity:(NSManagedObject *)object;
#warning плохое имя селектора, особенно часть с endWithChanged:
- (void)editASPublisherEntityDoneIn:(ASAddEditEntryViewController *)controller endWithChanged:(NSManagedObject *)record  withAnimatedCell:(NSIndexPath *)indePathCell;

@end


@interface ASAddEditEntryViewController : UIViewController

#warning зачем показывать аутлет в *.h?
@property (nonatomic, weak) IBOutlet UITextField *textField;

@property (nonatomic, strong) ASCoreDataManager *coreDataManager;
#warning передавать Core Data объекты по ссылке - довольно опасное дело. Особенно если появляются разные потоки. Самое надежное решение - передавать NSManagedObjectID (свойство objectID у NSManagedObject) , это значение всегда одинаково для объекта в любом потоке
@property (nonatomic, strong) ASPublisherEntity *editASPublisherEntity;
@property (nonatomic, weak)  id <ASAddEditEntryViewControllerDelegate> delegate;
#warning это свойство вообще не очень вяжется к этому контроллеру. Попробуйте обойтись без него
@property (nonatomic, strong) NSIndexPath* indexPathForCellAnimation;


@end
