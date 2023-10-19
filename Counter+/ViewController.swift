//
//  ViewController.swift
//  Counter+
//
//  Created by Fedor on 17.10.2023.
//

import UIKit

class ViewController: UIViewController {

    //Создаем Outlet текстового поля
    @IBOutlet weak private var historyTextView: UITextView!
    
    //Создаем Outlet для поля вывода счетчика
    @IBOutlet weak private var counterLabel: UILabel!
    
    //Создаем Outlet для кнопки увеличения счетчика
    @IBOutlet weak private var incrementCounterButton: UIButton!
    
    //Создаем Outlet для кнопки уменьшения счетчика
    @IBOutlet weak private var decrementCounterButton: UIButton!
    
    //Создаем Outlet для кнопки сброса значений счетчика
    @IBOutlet weak private var resetCounterButton: UIButton!
    
    //Создаем переменную отслеживающую состояние счетчика
    private var counter = 0
    
    //Создаем текстовую переменную отслеживающую историю значений счетчика
    private var historyMessage = "История изменений:"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        //Настраиваем внешний вид кнопок интерфейса
        incrementCounterButton.layer.cornerRadius = 10
        decrementCounterButton.layer.cornerRadius = 10
        resetCounterButton.layer.cornerRadius = 75
        resetCounterButton.layer.borderWidth = 10
        resetCounterButton.layer.borderColor = UIColor.black.cgColor
        resetCounterButton.clipsToBounds = true
        
        //Настраиваем начальные значения поля счетчика и текстового поля окна истории
        counterLabel.text = "Значение счетчика:\n\(counter)"
        historyTextView.text = historyMessage

    }

    private func updateLabelAndTextView(){
        //Обновляем значение счетчика
        counterLabel.text = "Значение счетчика:\n\(counter)"
        
        //Определяем формат даты
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd/MM/yyyy hh:mm:ss"
        let formattedDate = dateFormatter.string(from: Date())
        historyTextView.text.append("\n\(formattedDate) \(historyMessage)")
        
        //Отслеживаем отображение актуальных сообщений списка истории
        let range = NSRange(location: 0, length: historyTextView.text.count)
        historyTextView.scrollRangeToVisible(range)
    }
    
    //Создаем действия кнопки увеличения счетчика
    @IBAction private func incrementCounterButtonTap(_ sender: Any) {
        counter += 1
        historyMessage = "Значение изменено на +1"
        updateLabelAndTextView()
    }
    
    //Создаем действие кнопки увеличения счетчика
    @IBAction private func decrementCounterButtonTap(_ sender: Any) {
        if counter == 0 {
            historyMessage = "Попытка уменьшить значение счётчика ниже 0"
        } else {
            counter -= 1
            historyMessage = "Значение изменено на -1"
        }
        updateLabelAndTextView()
    }
    
    //Настраиваем действие кнопки сброса счетчика
    @IBAction private func resetCounterButtonTap(_ sender: Any) {
        counter = 0
        historyMessage = "Значение сброшено"
        updateLabelAndTextView()
    }
    

    
}

