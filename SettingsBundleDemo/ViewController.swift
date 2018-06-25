//
//  ViewController.swift
//  SettingsBundleDemo
//
//  Created by EthanLin on 2018/6/25.
//  Copyright © 2018 EthanLin. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var sizeSegment: UISegmentedControl!
    @IBOutlet weak var drinkTextField: UITextField!
    @IBOutlet weak var roomForCreamSwitch: UISwitch!
    
    //註冊SettingBundle給UserDefault知道，registerDefaults 方法在资源目錄中搜索 plist 文件並將字典中存放的key Value修改为 [String:AnyObject]。此方法只需要在程式中執行一次。
    func registerSettingsBundle(){
        let appDefaults = [String:AnyObject]()
        UserDefaults.standard.register(defaults: appDefaults)
    }

    //新增一個方法 updateDisplayFromDefaults 用來讀取我们的 defaults
    @objc func updateDisplayFromDefaults(){
        
        //Get the defaults
        let defaults = UserDefaults.standard
        //Set the controls to the default values.
        roomForCreamSwitch.isOn = defaults.bool(forKey: "coffee_cream")
        if let drink = defaults.string(forKey: "coffee_type"){
            drinkTextField.text = drink
        } else{
            drinkTextField.text = ""
        }
        sizeSegment.selectedSegmentIndex = defaults.integer(forKey: "coffee_size")
    }
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        registerSettingsBundle()
        updateDisplayFromDefaults()
        
        NotificationCenter.default.addObserver(self, selector: #selector(updateDisplayFromDefaults), name: UserDefaults.didChangeNotification, object: nil)
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

