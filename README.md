# iherb

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

