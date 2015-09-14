//
//  AppDelegate.h
//  YalantisTask2ObjC
//
//  Created by typan on 8/25/15.
//  Copyright (c) 2015 Artem Sherbachuk. All rights reserved.
//

#import <UIKit/UIKit.h>

#warning глобальные замечания:
/*
 1. Папку Pods нужно добавить в .gitignore, я об этом не написал в задании, но вделать это нужно
 2. При объявлении переменной, при объявлении параметра, форматирование должно быть <имя класса> *<имя переменной>
 3. Закомментированный код надо удалять
 4. Категории необходимо выносить в отдельные файлы
 5. Аутлеты показаны в *.h файле, они должны быть в *.m, если нет необходимости обращаться к ним из других классов
 6. Числа вроде длительности анимации, толщины тени, количества повторений, новый фрейм, все эти числа должны быть константами с "говорящими" именами, чтобы было понятно, что вообще происходит. Очень много таких чисел, везде не стал расставлять ворнинги
 7. Имена segue, storyboardID'шники контроллеров и т.д. также лучше хранить в виде именованых констант
 */

@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;


@end

