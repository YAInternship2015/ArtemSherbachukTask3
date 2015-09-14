  //
  //  AddEditEntryViewController.m
  //  YalantisTask2ObjC
  //
  //  Created by typan on 8/26/15.
  //  Copyright (c) 2015 Artem Sherbachuk. All rights reserved.
  //

#import "ASAddEditEntryViewController.h"

#warning категорию вынесите в от
@implementation UIImage (Extentions)

+ (UIImage *)imageWithImage:(UIImage *)image convertToSize:(CGSize)size {
    UIGraphicsBeginImageContext(size);
    [image drawInRect:CGRectMake(0, 0, size.width, size.height)];
    UIImage *destImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return destImage;
}

@end



@interface ASAddEditEntryViewController () <UITextFieldDelegate>

@property (weak, nonatomic) IBOutlet UIBarButtonItem *doneButton;
@property (weak, nonatomic) IBOutlet UINavigationItem *navigationItemBar;
@property (nonatomic, strong) NSString *randomImagePath;

@end



@implementation ASAddEditEntryViewController



#define TICK NSDate *startTime = [NSDate date]
#define TOCK NSLog(@"Elepsed Time %f", -[startTime timeIntervalSinceNow])


#pragma mark -
#pragma mark LOADING

- (void)viewDidLoad {
  [super viewDidLoad];

  self.textField.delegate = self;

#warning вообще имя editASPublisherEntity - плохое. Лучше publisherToEdit
  if (self.editASPublisherEntity != nil) {
      [self configEditEntryScreen];
  } else {
      [self configAddNewEntryScreen];
  }

}

- (void)configEditEntryScreen {
#warning строку следует перенести в Localizable.strings. Это касается и следующего метода
    self.navigationItemBar.title = @"Edit Entry";
    self.textField.text = self.editASPublisherEntity.publisherName;
    self.doneButton.enabled = true;
}

- (void)configAddNewEntryScreen {
    self.navigationItemBar.title = @"Add New Entry";
    self.doneButton.enabled = false;
}

#warning такой метод следует удалить
- (void)viewWillAppear:(BOOL)animated {
  [super viewWillAppear:animated];
//  [self.textField becomeFirstResponder];
}




#pragma mark -
#pragma mark TARGET ACTION

- (IBAction)cancelButtonDidTouch:(UIBarButtonItem *)sender {
    
    if (self.editASPublisherEntity) {
        [self.delegate cancelButtonDidTouchForEditingPublisherIn:self withIndexPathCell:self.indexPathForCellAnimation];
    } else {
        [self.delegate cancelButtonDidTouchForAddingNewPublisherIn:self];
    }

}


- (IBAction)doneButtonDidTouch:(UIBarButtonItem *)sender {
    NSString *name = self.textField.text;
  if (self.editASPublisherEntity) {
      [self doneEditASPublisherEntityWithChangedName:name];
  } else {
#warning зачем эти tick/tock?
      TICK;
      [self doneAddNewASPublisherEntityWithName:name];
      TOCK;
  }

}

#warning в именах методов не нужно использовать префикс приложения. И имя метода не самое удачное, лучше updatePublisherWithName:
- (void)doneEditASPublisherEntityWithChangedName:(NSString *)name {
    self.editASPublisherEntity.publisherName = name;
    [self.delegate editASPublisherEntityDoneIn:self
                                endWithChanged:self.editASPublisherEntity
                              withAnimatedCell:self.indexPathForCellAnimation];
}

#warning лучше назвать createPublisherWithName:
- (void)doneAddNewASPublisherEntityWithName:(NSString *)name {
        /// Create Entity
    NSEntityDescription *entityDescription = [NSEntityDescription entityForName:@"ASPublisherEntity"
                                                         inManagedObjectContext:self.coreDataManager.managedObjectContext];
            /// Initialize Record
        ASPublisherEntity *newRecord = [[ASPublisherEntity alloc]
                                        initWithEntity:entityDescription
                                        insertIntoManagedObjectContext:self.coreDataManager.managedObjectContext];

            /// Populate Record
        newRecord.publisherName = name;
        newRecord.created = [NSDate date];

        UIImage *randomImage = [UIImage imageNamed:[self randomImagePath]];
#warning ресайз картинки можно спрятать в категории к UIImage в методе вроде resizedImageWithName:
        CGSize smallImageSize = CGSizeMake(100, 100);
        newRecord.publisherImage = UIImagePNGRepresentation([UIImage imageWithImage:randomImage
                                                                      convertToSize:smallImageSize]);///image with small optimization. It is to big for coreData binary storage. And as result that scroll in cell is not so smooth. I tested with 1000 obj.
    [self.coreDataManager saveManagedObjectContext];

    [self dismissViewControllerAnimated:YES completion:nil];

}



#pragma mark -
#pragma mark UITextFieldDelegate

- (BOOL)textFieldShouldReturn:(UITextField *)textField {
    [textField resignFirstResponder];
    return YES;
}

- (BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range
replacementString:(NSString *)string {

  NSString* oldText = self.textField.text;
  NSString* newText = [oldText stringByReplacingCharactersInRange:range withString:string];
#warning валидация должна быть инкапсулирована в отдельном объекте-валидаторе
  self.doneButton.enabled = newText.length > 2;

#warning не true, а YES
  return true;
}






#pragma mark -
#pragma mark Test method

#warning этот метод следует вынести в категорию UIImage (ASRandomImage)
- (NSString *)randomImagePath {
    switch (arc4random_uniform(7)) {
        case 1:
            return _randomImagePath = @"TIME";
            break;
        case 2:
            return _randomImagePath = @"The New York Times";
            break;
        case 3:
            return _randomImagePath = @"TED";
            break;
        case 4:
            return _randomImagePath = @"MIT Technology Review";
            break;
        case 5:
            return _randomImagePath = @"The Atlantic";
            break;
        case 6:
            return _randomImagePath = @"Daily Intelligencer";
            break;
        case 7:
            return _randomImagePath = @"Quartz";
            break;
        default:
            return _randomImagePath = @"Recode";
            break;
    }
    
}

@end
