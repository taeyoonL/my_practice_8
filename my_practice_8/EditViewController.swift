//
//  EditViewController.swift
//  my_practice_8
//
//  Created by 이태윤 on 2023/07/14.
//

import UIKit

protocol EditDelegate {
    func text_check (_ controller : EditViewController, text : String)
    func image_check (_ controller : EditViewController, isOn : Bool)
    func image_zoom_check (_ controller : EditViewController, islarge : Bool)
}

class EditViewController: UIViewController {
    
    
    @IBOutlet var expand_button: UIButton!
    
    @IBOutlet var label_from: UILabel!
    
    @IBOutlet var text_field_edit: UITextField!
    
    @IBOutlet var `switch`: UISwitch!
    
    
    var string_1 : String = ""
    var text_edit : String = ""
    var delegate : EditDelegate?
    var isOn : Bool = false
    var islarge_edit : Bool = true
    
    override func viewDidLoad() {
        super.viewDidLoad()
        label_from.text = string_1
        text_field_edit.text = text_edit
        `switch`.isOn = isOn
        if islarge_edit {
            expand_button.setTitle("확대", for: .normal)
        } else {
            expand_button.setTitle("축소", for: .normal)
        }
        // Do any additional setup after loading the view.
    }
    

    @IBAction func finish_button(_ sender: UIButton) {
        if delegate != nil {
            delegate?.text_check(self, text: text_field_edit.text!)
            delegate?.image_check(self, isOn: isOn)
            delegate?.image_zoom_check(self, islarge: islarge_edit)
        }
        _ = navigationController?.popViewController(animated: true)
    }
    
    
    @IBAction func switch_onoff(_ sender: UISwitch) {
        if sender.isOn == true {
            isOn = true
        } else {
            isOn = false
        }
    }
    
    @IBAction func large_or_shrink(_ sender: UIButton) {
        if islarge_edit == true {
            islarge_edit = false
            expand_button.setTitle("축소", for: .normal)
        } else {
            islarge_edit = true
            expand_button.setTitle("확대", for: .normal)
        }
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
