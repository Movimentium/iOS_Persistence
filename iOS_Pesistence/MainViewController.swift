//
//  MainViewController.swift
//  iOS_Pesistence
//
//  Created by Miguel Gallego Martín on 1/10/18.
//  Copyright © 2018 Miguel Gallego Martín. All rights reserved.
//

import UIKit

class MainViewController: UIViewController {

    
    // MARK: - IBActions
    
    @IBAction func onBtnSaveText(_ sender: UIButton) {
        performSegue(withIdentifier: "Save Text", sender: nil)
    }
    
    
    
}
