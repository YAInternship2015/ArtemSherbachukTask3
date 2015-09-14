//
//  PublisherTableViewCell.h
//  YalantisTask2ObjC
//
//  Created by typan on 8/26/15.
//  Copyright (c) 2015 Artem Sherbachuk. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ASPublisherTableViewCell : UITableViewCell


#warning аутлеты необходимо перенести в *.m файл, а заполнение моделью должно происходить в методе вроде setupWithPublisher: внутри ячейки. То же самое касается CollectionViewCell
@property (nonatomic, weak) IBOutlet UIImageView *publisherImage;
@property (nonatomic, weak) IBOutlet UILabel *publisherTitle;




@end
