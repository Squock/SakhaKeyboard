//
//  KeyboardViewController.swift
//  SakhaKeyboard
//
//  Created by Admin on 04.02.2020.
//  Copyright © 2020 Admin. All rights reserved.
//

import UIKit

class KeyboardViewController: UIInputViewController {
    @IBOutlet var myKeyboard: UIButton!

    @IBOutlet var nextKeyboardButton: UIButton!
    
    override func updateViewConstraints() {
        super.updateViewConstraints()
        
        // Add custom view sizing constraints here
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        /*let buttonTitles0 = ["1", "2", "3", "4", "5", "6", "7", "8", "9", "\n0"]
        let buttonTitles1 = ["Нь", "Дь", "Ҥ", "Ҕ", "Ө", "Һ", "Ү"]
        let buttonTitles2 = ["Й", "Ц", "У", "К", "Е", "Н", "Г", "Ш", "Щ", "З", "Х", "Ъ"]
        let buttonTitles3 = ["Ф", "Ы", "В", "А", "П", "Р", "О", "Л", "Д", "Ж", "Э"]
        let buttonTitles4 = ["Я", "Ч", "С", "М", "И", "Т", "Ь", "Б", "Ю", "BK"]
        let buttonTitles5 = ["SH", "KB", "SPACE", ".", "RETURN"]
        
        let row0 = createRowOfButtons(buttonTitles: buttonTitles0)
        let row1 = createRowOfButtons(buttonTitles: buttonTitles1)
        let row2 = createRowOfButtons(buttonTitles: buttonTitles2)
        let row3 = createRowOfButtons(buttonTitles: buttonTitles3)
        let row4 = createRowOfButtons(buttonTitles: buttonTitles4)
        let row5 = createRowOfButtons(buttonTitles: buttonTitles5)
        self.view.addSubview(row0)
        self.view.addSubview(row1)
        self.view.addSubview(row2)
        self.view.addSubview(row3)
        self.view.addSubview(row4)
        self.view.addSubview(row5)
        row0.translatesAutoresizingMaskIntoConstraints = false
        row1.translatesAutoresizingMaskIntoConstraints = false
        row2.translatesAutoresizingMaskIntoConstraints = false
        row3.translatesAutoresizingMaskIntoConstraints = false
        row4.translatesAutoresizingMaskIntoConstraints = false
        row5.translatesAutoresizingMaskIntoConstraints = false
        addKeyboardViewConstraints(inputView: self.view, rowViews: [row0, row1, row2, row3, row4, row5])*/
        let buttonTitles = [["1", "2", "3", "4", "5", "6", "7", "8", "9", "0"],["Нь", "Дь", "Ҥ", "Ҕ", "Ө", "Һ", "Ү"], ["Й", "Ц", "У", "К", "Е", "Н", "Г", "Ш", "Щ", "З", "Х", "Ъ"], ["Ф", "Ы", "В", "А", "П", "Р", "О", "Л", "Д", "Ж", "Э"], ["SH", "Я", "Ч", "С", "М", "И", "Т", "Ь", "Б", "Ю", "BK"], ["KB", "SPACE", ".", "RETURN"]] as [Any]
        parseKeyboard(buttonTitles: buttonTitles)
    }
    //var rows: UIView!
    func parseKeyboard(buttonTitles: [Any]){
        var rows = [UIView]()
        for btn in buttonTitles{
            let row = createRowOfButtons(buttonTitles: btn as! [String])
            rows.append(row)
            self.view.addSubview(row)
            row.translatesAutoresizingMaskIntoConstraints = false
        }
        addKeyboardViewConstraints(inputView: self.view, rowViews: rows)
    }
    
    func createRowOfButtons(buttonTitles: [String]) -> UIView{
        var buttons = [UIButton]()
        let screen = UIScreen.main.bounds
        let keyboardRowView = UIView(frame: CGRect(x: 0, y: 0, width: screen.width, height: screen.height / 12))
        //let keyboardRowView = UIView(frame: CGRect(x: 0, y: 0, width: 375, height: 50))
        
        for buttonTitle in buttonTitles{
            let button = createButtonWithTitle(title: buttonTitle as String)
            buttons.append(button)
            keyboardRowView.addSubview(button)
        }
        //let button = createButtonWithTitle(title: "1")
        addButtonConstrainst(buttons: buttons, mainView: keyboardRowView)
        return keyboardRowView
    }
    
    func createButtonWithTitle(title: String) -> UIButton{
        let button = UIButton(type: .system)
        button.frame = CGRect(x: 0, y: 0, width: 20, height: 20)
        button.setTitle(title, for: .normal)
        button.sizeToFit()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.titleLabel?.font = UIFont.systemFont(ofSize: 15)
        button.backgroundColor = UIColor(white: 1.0, alpha: 1.0)
        button.setTitleColor(.black, for: .normal)
        //button.backgroundColor = UIColor.blue
        button.addTarget(self, action: #selector(didTapButton), for: .touchUpInside)
        
        //button.backgroundColor = UIColor(red: 171/255, green: 178/255, blue: 186/255, alpha: 1.0)
        // Shadow and Radius
        button.layer.shadowColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.25).cgColor
        button.layer.shadowOffset = CGSize(width: 0.0, height: 2.0)
        button.layer.shadowOpacity = 1.0
        button.layer.shadowRadius = 0.0
        button.layer.masksToBounds = false
        button.layer.cornerRadius = 5.0
        //button.titleLabel?.font = UIFont.systemFont(ofSize: 15, weight: UIFont.Weight.bold)
        if title == "SH" || title == "KB" || title == "BK" || title == "RETURN"{
            button.backgroundColor = UIColor(red: 171/255, green: 178/255, blue: 186/255, alpha: 1.0)
        }
        
        return button
    }
    
    func addButtonConstrainst(buttons: [UIButton], mainView: UIView){
        for(index, button) in buttons.enumerated(){
            let topConstraint = NSLayoutConstraint(item: button, attribute: .top, relatedBy: .equal, toItem: mainView, attribute: .top, multiplier: 1.0, constant: 4)
            let bottomConstraint = NSLayoutConstraint(item: button, attribute: .bottom, relatedBy: .equal, toItem: mainView, attribute: .bottom, multiplier: 1.0, constant: -4)
            var rightConstraint: NSLayoutConstraint!
            if index == buttons.count - 1{
                rightConstraint = NSLayoutConstraint(item: button, attribute: .right, relatedBy: .equal, toItem: mainView, attribute: .right, multiplier: 1.0, constant: -4)
            } else{
                let nextButton = buttons[index + 1]
                rightConstraint = NSLayoutConstraint(item: button, attribute: .right, relatedBy: .equal, toItem: nextButton, attribute: .left, multiplier: 1.0, constant: -4)
            }
            var leftConstraint: NSLayoutConstraint!
            if index == 0{
                leftConstraint = NSLayoutConstraint(item: button, attribute: .left, relatedBy: .equal, toItem: mainView, attribute: .left, multiplier: 1.0, constant: 4)
            } else{
                let prevButton = buttons[index - 1]
                leftConstraint = NSLayoutConstraint(item: button, attribute: .left, relatedBy: .equal, toItem: prevButton, attribute: .right, multiplier: 1.0, constant: 4)
                
                let firstButton = buttons[0]
                
                let widthConstraint = NSLayoutConstraint(item: firstButton, attribute: .width, relatedBy: .equal, toItem: button, attribute: .width, multiplier: 1.0, constant: 0)
                widthConstraint.priority = UILayoutPriority(rawValue: 800)
                mainView.addConstraint(widthConstraint)
            }
            mainView.addConstraints([topConstraint, bottomConstraint, rightConstraint, leftConstraint])
        }
    }
    
    func addKeyboardViewConstraints(inputView: UIView, rowViews: [UIView]){
        for(index, rowView) in rowViews.enumerated(){
            let rightSideConstraints = NSLayoutConstraint(item: rowView, attribute: .right, relatedBy: .equal, toItem: inputView, attribute: .right, multiplier: 1.0, constant: 0)
            let leftConstraint = NSLayoutConstraint(item: rowView, attribute: .left, relatedBy: .equal, toItem: inputView, attribute: .left, multiplier: 1.0, constant: 0)
           
            inputView.addConstraints([rightSideConstraints, leftConstraint])
            
            let topConstraint: NSLayoutConstraint!
            
            if index == 0{
                topConstraint = NSLayoutConstraint(item: rowView, attribute: .top, relatedBy: .equal, toItem: inputView, attribute: .top, multiplier: 1.0, constant: 0)
            } else {
                let prevRow = rowViews[index - 1]
                topConstraint = NSLayoutConstraint(item: rowView, attribute: .top, relatedBy: .equal, toItem: prevRow, attribute: .bottom, multiplier: 1.0, constant: 0)
                let firstRow = rowViews[0]
                let heightConstraint = NSLayoutConstraint(item: firstRow, attribute: .height, relatedBy: .equal, toItem: rowView, attribute: .height, multiplier: 1.0, constant: 0)
                heightConstraint.priority = UILayoutPriority(rawValue: 800)
                inputView.addConstraint(heightConstraint)
            }
            inputView.addConstraint(topConstraint)
            let bottomConstraint: NSLayoutConstraint!
            if index == rowViews.count - 1{
                bottomConstraint = NSLayoutConstraint(item: rowView, attribute: .bottom, relatedBy: .equal, toItem: inputView, attribute: .bottom, multiplier: 1.0, constant: 0)
            } else {
                let nextRow = rowViews[index + 1]
                bottomConstraint = NSLayoutConstraint(item: rowView, attribute: .bottom, relatedBy: .equal, toItem: nextRow, attribute: .top, multiplier: 1.0, constant: 0)
            }
            inputView.addConstraint(bottomConstraint)
        }
    }
    
    @objc func didTapButton(sender: AnyObject){
        let button = sender as! UIButton
        self.smallWordsTap()
        let proxy = textDocumentProxy
        if let title = button.title(for: .normal){
            switch title {
            case "KB": self.advanceToNextInputMode()
            case "SPACE": buttonColor(button: button, proxy: proxy)
            case "BK": proxy.deleteBackward()
            case "RETURN": proxy.insertText("\n")
            case "SH": self.smallWords()
            default: proxy.insertText(title)
            }
        }
        //proxy.insertText(title!)
    }
    var isSmall: Bool = false
    var isSmall2: Bool = false
    func smallWordsTap(){
        let buttonTitles = [["1", "2", "3", "4", "5", "6", "7", "8", "9", "0"],["нь", "дь", "ҥ", "ҕ", "ө", "һ", "ү"], ["й", "ц", "у", "к", "е", "н", "г", "ш", "щ", "з", "х", "ъ"], ["ф", "ы", "в", "а", "п", "р", "о", "л", "д", "ж", "э"], ["SH", "я", "ч", "с", "м", "и", "т", "ь", "б", "ю", "BK"], ["KB", "SPACE", ".", "RETURN"]] as [Any]
        isSmall2 = true
        parseKeyboard(buttonTitles: buttonTitles)
    }
    func smallWords(){
        if isSmall == false && isSmall2 == true{
            let buttonTitles = [["1", "2", "3", "4", "5", "6", "7", "8", "9", "0"],["нь", "дь", "ҥ", "ҕ", "ө", "һ", "ү"], ["й", "ц", "у", "к", "е", "н", "г", "ш", "щ", "з", "х", "ъ"], ["ф", "ы", "в", "а", "п", "р", "о", "л", "д", "ж", "э"], ["SH", "я", "ч", "с", "м", "и", "т", "ь", "б", "ю", "BK"], ["KB", "SPACE", ".", "RETURN"]] as [Any]
            parseKeyboard(buttonTitles: buttonTitles)
            isSmall = true
        }
        if isSmall == true{
            let buttonTitles = [["1", "2", "3", "4", "5", "6", "7", "8", "9", "0"],["Нь", "Дь", "Ҥ", "Ҕ", "Ө", "Һ", "Ү"], ["Й", "Ц", "У", "К", "Е", "Н", "Г", "Ш", "Щ", "З", "Х", "Ъ"], ["Ф", "Ы", "В", "А", "П", "Р", "О", "Л", "Д", "Ж", "Э"], ["SH", "Я", "Ч", "С", "М", "И", "Т", "Ь", "Б", "Ю", "BK"], ["KB", "SPACE", ".", "RETURN"]] as [Any]
            parseKeyboard(buttonTitles: buttonTitles)
            isSmall = false
        }
        
    }
    func buttonColor(button: UIButton, proxy: UITextDocumentProxy){
        //button.backgroundColor = UIColor(red: 171/255, green: 178/255, blue: 186/255, alpha: 1.0)
        //button.setTitle("space11", for: .normal)
        proxy.insertText(" ")
    }
    override func textWillChange(_ textInput: UITextInput?) {
        // The app is about to change the document's contents. Perform any preparation here.
    }
    
    override func textDidChange(_ textInput: UITextInput?) {
        // The app has just changed the document's contents, the document context has been updated.
    }

}
