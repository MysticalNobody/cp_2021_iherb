# Цифровой прорыв 2021. Кейс iherb

## Общая информация

Мы предлагаем решение за счет стимулирования мотивации пользователя позаботиться о своем здоровье. 

- Через опрос получаем понимание «что с пользователем сейчас», в момент когда он зашел в приложение. 
- Как давно он был у специалиста (врача) и выполнил ли он рекомендации.
- Если пользователь готов поделиться полученными анализами, то путем сравнения с нормой – можно выявить возможную потребность в добавках.
- Если анализов нет, просим сдать и после этого уже производить заказ

Мы предлагаем пользоваться дневником потребления витаминов
- Алгоритм определения совместимости принимаемых добавок
- Напоминание о необходимости принять добавку, в зависимости от совместимости и вида добавки 

Мы предлагаем базу знаний – гайд по особенностям, с 
рекомендациями и проверкой полученных знаний 

Мы предлагаем заказывать и покупать продукцию с помощью приложения


## Немножко про реализацию

Проект написан на **Flutter**, для достижения максимальной кроссплатформанности, для каждой из платформ написаны свои компоненты.

Минимальные версии ОС:

Android - **4.1**

IOS - **8**

Поддерживаемые браузеры:
-   Chrome (mobile & desktop)
-   Safari (mobile & desktop)
-   Edge (mobile & desktop)
-   Firefox (desktop)


Для проекта написан сервер:

[https://github.com/aplinxy9plin/iherb-back](https://github.com/aplinxy9plin/iherb-back)

### Релиз:

Скачать APK (Android)

https://tod.itis.team/android.apk


## Сборка

### Android

Для начала, необходимо скачать и установать Flutter, а также настроить IDE

https://flutter.dev/docs/get-started/install

https://flutter.dev/docs/get-started/editor?tab=vscode

После базовой настройки для запуска необходимо выполнить следующие команды(для Android):

> cd *project dir*

> flutter packages get

> flutter run --release

или для сборки apk

> flutter build apk --release

https://flutter.dev/docs/deployment/android

###  IOS:

> cd *project dir*

> flutter packages get

> flutter build ios

Дальше запускать проект в Xcode


https://flutter.dev/docs/deployment/ios

## Структура проекта

- MVM architecture using Stacked for State Management
- Navigation using Auto_route
- Get_it and Injectables for Inversion control

        /data - Здесь представлены слои для работы с данными и бизнес-логика
        /data/domain - Бизнес-логика
        /data/models - Модели данных
        /data/repository - Источники данных

        /di - Depenpency Injection, а именно классы для работы с GetIt и его инициализации

        /core - Здесь хранятся
        
        /themes - тема и цвета приложения
        
        /values - интернационализация и постоянные значения
        
        /utils - Полезные классы и функции
        
        /ui - Слой представления
		/ui/components - Общие компоненты для всего приложения
		/ui/.. - Сами экраны, разбитые на функциональные единицы
		/ui/auth - Фича, состоит из одного или нескольких экранов и прослойки между ui и бизнес-логикой (viewmodel)
        
        /navigation - Навигация
        
        app.dart - Рут-виджет приложения
        env.dart - Константы с настройками окружения
        main.dart - Стартовая точка приложения

