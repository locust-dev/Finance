//
//  RightMenuClass.swift
//  Finance
//
//  Created by Илья Тюрин on 09.02.2021.
//

import UIKit

class RightMenuClass: UITableViewController {
    
    ///Массив с названиями ячеек
    var menuItems = ["23 234"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        tableView.rowHeight = 50
        tableView.backgroundColor = UIColor(#colorLiteral(red: 0.1141856284, green: 0.1166089245, blue: 0.1145614261, alpha: 1))
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "menuCell")
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return menuItems.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let menuCell = tableView.dequeueReusableCell(withIdentifier: "menuCell", for: indexPath)
        menuCell.textLabel?.text = menuItems[indexPath.row]
        menuCell.textLabel?.textColor = .white
        menuCell.backgroundColor = UIColor(#colorLiteral(red: 0.1141856284, green: 0.1166089245, blue: 0.1145614261, alpha: 1))
        return menuCell
    }
}
