//
//  SaveTextViewController.swift
//  iOS_Pesistence
//
//  Created by Miguel Gallego Martín on 1/10/18.
//  Copyright © 2018 Miguel Gallego Martín. All rights reserved.
//

import UIKit

class SaveTextViewController: UIViewController {

    @IBOutlet weak var txtVw: UITextView!
    
    let fileName = "text.dat"
    
    var filePath: String? {
        let arrPaths = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true)
        return arrPaths.first?.appending(fileName)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()


    }
    
    func loadText() -> String? {
        guard let file = filePath else {
            return nil
        }
        do {
            let text = try String.init(contentsOfFile: file, encoding: String.Encoding.unicode)
            return text
        } catch {
            return nil
        }
     }

    
    
    // MARK: - IBActions
    
    @IBAction func onBtnSave() {
        
    }
    
    @IBAction func onBtnLoad() {
        
    }
}
