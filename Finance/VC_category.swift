//
//  VC_category.swift
//  Finance
//
//  Created by Илья Тюрин on 04.02.2021.
//

import UIKit

class VC_category: UIViewController {
    
    var typeOfExpense = expenses(emoji: "", category: "", cost: "")
    var value2: String?
    @IBOutlet weak var labelValue2: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //Передаем значение суммы со второго экрана на этот
        labelValue2.text = value2
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    
    ///Аутлеты для текст филдов
    @IBOutlet weak var emojiTextField: UITextField!
    @IBOutlet weak var catTextField: UITextField!
    @IBOutlet weak var costLabel: UILabel!
    
    //Объявляем сегвей который будет возвращать данные на таблицу
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        super.prepare(for: segue, sender: sender)
        guard segue.identifier == "saveSegue" else {return}
        
        let cost = costLabel.text ?? ""
        let emoji = emojiTextField.text ?? ""
        let cat = catTextField.text ?? ""
        
        self.typeOfExpense = expenses(emoji: emoji, category: cat, cost: cost)
        }
}
