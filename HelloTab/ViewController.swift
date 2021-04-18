//
//  ViewController.swift
//  HelloTab
//
//  Created by mimi on 2021/4/18.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var lbDisplay: UILabel!
      
    override func loadView() {
        super.loadView()
        print("loadView")
        
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        let def = UserDefaults.standard
        let value = def.value(forKey: "lastInputDate")
        if let date = value as? Date {
            let formater = DateFormatter()
            formater.dateFormat = "yyyy-MM-dd E a hh:mm:ss"
            formater.locale = Locale(identifier: "zh-tw")
            lbDisplay.text = formater.string(from: date)
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        print("viewWillAppear")
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        print("viewDidAppear")
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        print("viewWillDisappear")
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        print("viewDidDisappear")
    }
    
    

    @IBAction func dateSelected(_ sender: UIDatePicker) {
        let dateSeleted = sender.date
        print(dateSeleted.timeIntervalSince1970)
        
        let formater = DateFormatter()
        formater.dateFormat = "yyyy-MM-dd E a hh:mm:ss"
        formater.locale = Locale(identifier: "zh-tw")
        lbDisplay.text = formater.string(from: dateSeleted)
        
        let def = UserDefaults.standard
        def.setValue(dateSeleted, forKey: "lastInputDate")
        def.synchronize()
    }
    
}

