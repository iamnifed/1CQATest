﻿#language: ru

@tree

Функционал: <описание фичи>

Как <Роль> я хочу
<описание функционала> 
чтобы <бизнес-эффект>   
//comment
Контекст:
	Дано Я запускаю сценарий открытия TestClient или подключаю уже существующий
Сценарий: <описание сценария>
И я закрываю все окна клиентского приложения
* Открытие формы создания документа
	И В командном интерфейсе я выбираю 'Закупки' 'Поступления товаров'
	Тогда открылось окно 'Поступления товаров'
	И я нажимаю на кнопку с именем 'ФормаСоздать'
	Тогда открылось окно 'Поступление товара (создание)'
* Заполнение шапки документа
	И из выпадающего списка с именем "Организация" я выбираю точное значение 'ООО "1000 мелочей"'
	И из выпадающего списка с именем "Склад" я выбираю точное значение 'Малый'
	Тогда элемент формы с именем "Склад" стал равен 'Малый'	
	И из выпадающего списка с именем "Поставщик" я выбираю точное значение 'Магазин "Бытовая техника"'
* Заполнение товарной части
	И в таблице "Товары" я нажимаю на кнопку с именем 'ТоварыДобавить'
	И в таблице "Товары" я нажимаю кнопку выбора у реквизита с именем "ТоварыТовар"
	Тогда открылось окно 'Товары'
	И я нажимаю на кнопку с именем 'ФормаСписок'
	И в таблице "Список" я перехожу к строке:
		| 'Код'       | 'Наименование' |
		| '000000040' | 'Sony К3456P'  |
	И я нажимаю на кнопку с именем 'ФормаВыбрать'
	Тогда открылось окно 'Поступление товара (создание) *'
	И в таблице "Товары" я активизирую поле с именем "ТоварыКоличество"
	И в таблице "Товары" в поле с именем 'ТоварыКоличество' я ввожу текст '5,00'
	И в таблице "Товары" я активизирую поле с именем "ТоварыСумма"
	И в таблице "Товары" я завершаю редактирование строки
* Проверка заполнения табличной части
	Тогда таблица "Товары" стала равной:
		| 'Товар'       | 'Артикул' | 'Цена'     | 'Количество' | 'Сумма'     |
		| 'Sony К3456P' | 'Н657'    | '4 500,00' | '5,00'       | '22 500,00' |
	И я нажимаю на кнопку "Записать"
* Номер
	И я запоминаю значение поля "Номер" как "$Номер$"
* Проведение документа
	И я нажимаю на кнопку с именем 'ФормаПровестиИЗакрыть'
	И я жду закрытия окна 'Поступление товара (создание) *' в течение 20 секунд
* Проверка создания документа
И таблица "Список" содержит строки:
	| 'Номер' |
	| '$Номер$'|

Сценарий: проверка наличия в справочнике номенклатуры Торт
И В командном интерфейсе я выбираю 'Продажи' 'Товары'
Тогда открылось окно 'Товары'
И я нажимаю на кнопку с именем 'ФормаСписок'
И таблица "Список" содержит строки:
| 'Наименование' |
| 'Торт'        |
