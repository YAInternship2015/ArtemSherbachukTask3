### ArtemSherbachukTask2

# Yalantis Task3. Objective-C 

### Описание
> Теперь все модели должны храниться не в plist, а в Core Data
Для получения данных и отслеживания изменений в Persistent Store необходимо использовать NSFetchedResultsController
Необходимо добавить возможность удалять данные из таблицы (по свайпу влево на ячейке должна появляться кнопка Delete, выглядит это так http://cdn2.raywenderlich.com/wp-content/uploads/2014/01/iOS-Simulator-Screen-shot-Nov-28-2013-1.06.41-PM-213x320.png)
Необходимо добавить возможность удалять ячейки из коллекшн вью по жесту Long Tap (то есть юзер делает long tap на ячейке и ячейка удаляется)
Все изменения контента таблицы (добавление/удаление данных) должны происходить анимированно. Если есть желание, то можете заморочиться и с коллекшн вью.

***

 Video 

[![YalantisTask3](http://assets.vg247.com/current//2015/04/youtube_flat_red.png)](http://youtu.be/RAdEo3AkkuE)


***

#### Коментарий
##### Controllers

ASContainerViewController - контроллер переключения вида tableView/collectionView. 
В нем также инициализируется один объект NSFetchedResultsController который передается в контроллеры 
tableView/collectionView которые устанавливаютя как делегат для fetchResultCtrl каждый раз при смене друг-друга.

ASContainerTableViewController - контроллер table. Удаление, редактирование ячеек. Анимация при появлениии, при взаимодействии с cell. Изображения перерисовываются под заданый размер, отбрасывая лишний вес. Также попробывал добавить немного многопоточности при отображении данных в ячейке 

ASContainerCollectionViewController -  контроллер collection. Редактирование ячеек, удаление с меню типа корзина где можно за раз удалить все удалленные ячейки или сделать отмену, востановление. Также анимация при появлении cell, и взаимодействии. В некоторых местах анимирован автолайаут. Изображения перерисовываются под заданый размер, отбрасывая лишний вес. Также попробывал добавить немного многопоточности при отображении данных в ячейке 

ASAddEditEntryViewController - добавление новой записи и редактирование существующей.

***

##### Views
ASPublisherTableViewCell

ASPublisherCollectionViewCell

***
##### Model

ASCoreDataManager - объект в котором инициализируется стек CD. Управление, создание sqlite в отдельной папке, сохранение контекста и пр. 

ASPublisherEntity - модель данных, схема, объект-граф. Картинки хранятся в отдельном бинарном файле.
***


