//
//  VC_add.swift
//  Finance
//
//  Created by Илья Тюрин on 04.02.2021.
//
import UIKit

class VC_add: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        updateSaveButton()
    }
    
    //Убираем клаву по нажатию в любой части экрана
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    
    @IBOutlet weak var haha: UILabel!
    @IBOutlet weak var text1: UITextField!
    @IBOutlet weak var saveButton: UIButton!
    
    //Делаем кнопку "дальше" активной только при наличии текста в TField
    private func updateSaveButton() {
        let sometext = text1.text ?? ""
        saveButton.isEnabled = !sometext.isEmpty
        if sometext.isEmpty {saveButton.backgroundColor = UIColor.gray
        } else {saveButton.backgroundColor = UIColor(#colorLiteral(red: 0.8006544605, green: 0.5798318559, blue: 0, alpha: 1))}
    }
        
    @IBAction func textField(_ sender: UITextField) {
        updateSaveButton()
    }
    
    //Передаем значения во второй вью контроллер
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        //Проверяем может ли сегвей принять значение необходимого вью
        guard let dvc = segue.destination as? VC_category else { return }
        //Свойство переменной берется из следующего вью, а присваивается из этого
        dvc.value2 = text1.text
    }

}
