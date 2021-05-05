//
//  CCViewController.swift
//  FinalProject
//
//  Created by Kevin Durham on 4/18/21.
//  Copyright © 2021 Kevin Durham. All rights reserved.
//

import UIKit

class CCViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        if pickerView.tag == 1 {
            return weaponPickerData.count
            } else {
                return stylePickerData.count
            }
        }
    
    internal func pickerView(_ pickerView:UIPickerView, titleForRow row: Int, forComponent component: Int) -> String?    
    {
        if pickerView.tag == 1 {
            return weaponPickerData[row]
        } else {
            return stylePickerData[row]
        }
    }
    
    
   
    @IBOutlet weak var imageView: UIImageView!
    
    @IBOutlet weak var fightButton: UIButton!
    
    @IBOutlet weak var weaponPicker: UIPickerView!
    
    @IBOutlet weak var stylePicker: UIPickerView!
    
    var weaponPickerData: [String] = [String]()
    var stylePickerData: [String] = [String]()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        weaponPickerData = ["Axe", "Katana", "Rapier"]
        stylePickerData = ["Brute", "Clever", "Quick"]
        
        imageView.image = UIImage(named: "arena.jpg" )

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
