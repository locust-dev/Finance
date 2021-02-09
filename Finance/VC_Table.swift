//
//  VC_Table.swift
//  Finance
//
//  Created by Илья Тюрин on 08.02.2021.
//
import SideMenu
import UIKit

class VC_Table: UITableViewController {
    
    
    var menu: SideMenuNavigationController?
    
    ///Сделали массив категорий который будет использоваться в главной таблице, данные берем из структуры данных expenses
    var objects = [
        expenses (emoji: "📝", category: "Здесь вы можете добавить расходы", cost: "Просто нажмите на +"),
        expenses (emoji: "🏡", category: "Дом", cost: "1500")
    ]

    override func viewDidLoad() {
        super.viewDidLoad()
        
        ///Заголовок
        self.title = "Траты"
        
        ///Настройка Side Menu
        menu = SideMenuNavigationController(rootViewController: RightMenuClass())
        
        SideMenuManager.default.rightMenuNavigationController = menu
        SideMenuManager.default.addPanGestureToPresent(toView: self.view)
        
        ///Кнопка edit (появляется слева)
        self.navigationItem.leftBarButtonItem = self.editButtonItem
        self.editButtonItem.title = "Ред."
        self.editButtonItem.tintColor = UIColor.orange
        
        ///Размер строк
        tableView.rowHeight = 75
    }
    
    ///Задаем акшион для кнопки меню
    @IBAction func didTapMenu() {
        present(menu!, animated: true)
    }
    
    ///Достаем обьекты с последнего вью
    @IBAction func unwindSegue(segue: UIStoryboardSegue){
        guard segue.identifier == "saveSegue" else {return}
        let sourceVC = segue.source as! VC_category
        let typeOfExpense = sourceVC.typeOfExpense
        
        let newIndexPath = IndexPath(row: objects.count, section: 0)
        objects.append(typeOfExpense)
        tableView.insertRows(at: [newIndexPath], with: .fade)
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    ///Указали что количество строк будет равно кол-ву элементов массива из структуры данных
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return objects.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        ///Редактируем ячейку предварительно создав класс для нее MainTableCell и задав индентификатор
        let cell = tableView.dequeueReusableCell(withIdentifier: "mainCell", for: indexPath) as! MainTableCell
        
        ///Вытаскиваем обьект из массива
        let object = objects[indexPath.row]
        
        ///Заполняем лейблы элементами из массива
        cell.emojiLabel.text = object.emoji
        cell.catLabel.text = object.category
        cell.costLabel.text = object.cost
        
        return cell
    }
    
    ///Функция отвечает за вывод стайла по кнопке Edit
    override func tableView(_ tableView: UITableView, editingStyleForRowAt indexPath: IndexPath) -> UITableViewCell.EditingStyle {
        return.delete
    }
    
    ///Достает метод удаления строк
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            objects.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .fade)
        }
    }
}
