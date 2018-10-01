//
//  SaveTextViewController.swift
//  iOS_Pesistence
//
//  Created by Miguel Gallego Martín on 1/10/18.
//  Copyright © 2018 Miguel Gallego Martín. All rights reserved.
//

import UIKit

class SaveTextViewController: UIViewController, UITextViewDelegate {

    @IBOutlet weak var txtVw: UITextView!
    @IBOutlet weak var constrVertSpaceKeyboard: NSLayoutConstraint!
    
    
    let fileName = "/text.dat"
    let kKeyboardOnDistance: CGFloat = 225
    let kKeyboardOffDistance: CGFloat = 20
    var isPlaceHolderOn = false
 
    var filePath: String? {
        let arrPaths = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true)
        return arrPaths.first?.appending(fileName)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        txtVw.delegate = self
        onBtnLoad()
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

    func save(text: String) {
        guard let file = filePath else {
            print("Error Saving: filePath")   // TODO alertVC
            return
        }
        do {
            try text.write(toFile: file, atomically: true, encoding: String.Encoding.unicode)
        } catch {
            print("Error Saving: write")   // TODO alertVC
            print(error)
        }
    }
    
    func setTextView(inPlaceHolderMode: Bool) {
        isPlaceHolderOn = inPlaceHolderMode
        if inPlaceHolderMode {
            txtVw.text = "Write a text here"
            txtVw.textColor = UIColor.lightGray
        } else {
            txtVw.text = nil
            txtVw.textColor = UIColor.black
        }
    }
    
    // MARK: - IBActions
    
    @IBAction func onBtnSave() {
        save(text: txtVw.text)
        txtVw.resignFirstResponder()
    }
    
    @IBAction func onBtnLoad() {
        if let text = loadText(), text.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty == false {
            setTextView(inPlaceHolderMode: false)
            txtVw.text = text
        } else {
            setTextView(inPlaceHolderMode: true)
        }
        txtVw.resignFirstResponder()
    }
    
    // MARK: - UITextViewDelegate
    
    func textViewDidBeginEditing(_ textView: UITextView) {
        if isPlaceHolderOn {
            setTextView(inPlaceHolderMode: false)
        }
        constrVertSpaceKeyboard.constant = kKeyboardOnDistance
        UIView.animate(withDuration: 0.25) {
            self.view.layoutIfNeeded()
        }
    }
    
    func textViewDidEndEditing(_ textView: UITextView) {
        if txtVw.text.trimmingCharacters(in: CharacterSet.whitespacesAndNewlines).isEmpty {
            setTextView(inPlaceHolderMode: true)
        }
        constrVertSpaceKeyboard.constant = kKeyboardOffDistance
        UIView.animate(withDuration: 0.25) {
            self.view.layoutIfNeeded()
        }
    }
    
    
}



