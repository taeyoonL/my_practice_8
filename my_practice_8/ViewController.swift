//
//  ViewController.swift
//  my_practice_8
//
//  Created by 이태윤 on 2023/07/14.
//

import UIKit

class ViewController: UIViewController, EditDelegate {
    
    @IBOutlet var text_field_main: UITextField!
    
    @IBOutlet var image_view: UIImageView!
    
    var isOn : Bool = true
    var islarge : Bool = false
    var imgOn = UIImage(named: "lamp_on.png")
    var imgOff = UIImage(named: "lamp_off.png")
    
    override func viewDidLoad() {
        super.viewDidLoad()
        image_view.image = imgOn
        // Do any additional setup after loading the view.
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let editviewcontroller = segue.destination as! EditViewController
        if segue.identifier == "EditBarButton" {
            editviewcontroller.string_1 = "usage : bar button"
        } else if segue.identifier == "EditButton" {
            editviewcontroller.string_1 = "usage : button"
        }
        editviewcontroller.delegate = self
        editviewcontroller.text_edit = text_field_main.text!
        editviewcontroller.isOn = isOn
        editviewcontroller.islarge_edit = islarge
    }
    
    func text_check(_ controller: EditViewController, text: String) {
        text_field_main.text = text
    }
    
    func image_check(_ controller: EditViewController, isOn: Bool) {
        if isOn == true {
            image_view.image = imgOn
            self.isOn = true
        } else {
            image_view.image = imgOff
            self.isOn = false
        }
    }
    
    func image_zoom_check(_ controller: EditViewController, islarge: Bool) {
        if islarge == true {
            image_view.frame.size = CGSize(width: 300, height: 350)
            self.islarge = true
        } else {
            image_view.frame.size = CGSize(width: 100, height: 150)
            self.islarge = false
        }
    }

}

