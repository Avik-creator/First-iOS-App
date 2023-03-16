//
//  ViewController.swift
//  Paste and See it
//
//  Created by AVIK MUKHERJEE on 16/03/23.
//

import UIKit

class ViewController: UIViewController {
    
    let DATA_KEY = "data_key"

    @IBOutlet weak var testView: UITextView!
    
    var pastedStrings: [String] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        if let loadedStrings = UserDefaults.standard.stringArray(forKey: DATA_KEY){
            pastedStrings.append(contentsOf: loadedStrings)
        }
        showtext()
        
    }
    
    func addText(){
        guard let text = UIPasteboard.general.string, !pastedStrings.contains(text) else{
            return
        }
        
        pastedStrings.append(text)
        UserDefaults.standard.set(pastedStrings, forKey: DATA_KEY)
        
        showtext()
    }
    
    func showtext(){
        testView.text = ""
        for str in pastedStrings{
            testView.text.append("\(str)\n\n")
        }
    }

    @IBAction func trashwaspressed(_ sender: Any) {
        pastedStrings.removeAll()
        testView.text = ""
        UserDefaults.standard.removeObject(forKey: DATA_KEY)
    }
}

