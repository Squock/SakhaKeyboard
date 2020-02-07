//
//  ViewController.swift
//  keyboard
//
//  Created by Admin on 04.02.2020.
//  Copyright © 2020 Admin. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var button: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let buttonTitles = [["1", "2", "3", "4", "5", "6", "7", "8", "9", "0"],["Нь", "Дь", "Ҥ", "Ҕ", "Ө", "Һ", "Ү"]] as [Any]
        print("asd", button.title(for: .normal), button.titleLabel)
        for btn in buttonTitles{
            print("sdaa", btn as? [String])
        }
        // Do any additional setup after loading the view.
    }
    @IBAction func buttonAction(_ sender: Any) {
        print("LOOOL")
    }
    

}

