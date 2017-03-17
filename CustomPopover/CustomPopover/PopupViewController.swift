//
//  PopupViewController.swift
//  CustomPopover
//
//  Created by bohebohechan on 2017/03/17.
//  Copyright © 2017年 FirstFourNotes. All rights reserved.
//

import UIKit

class PopupViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = UIColor.blue
        
        let slider = UISlider(frame: CGRect(x:20, y:0, width:150, height:50))
        slider.minimumValue = SettingProvider.defaultSliderVal
        slider.maximumValue = 120
        
        if let val = SettingProvider._instance.getSliderValue() {
            
            slider.value = val
            
        }
        
        slider.addTarget(self, action: #selector(self.changeSlider(sender:)), for: UIControlEvents.valueChanged)
        slider.isUserInteractionEnabled = true
        
        view.addSubview(slider)
        
        
        let myButton = UIButton()
        let bWidth: CGFloat = 150
        let bHeight: CGFloat = 50
        
        myButton.frame = CGRect(x: 20, y: 100, width: bWidth, height: bHeight)
        myButton.backgroundColor = UIColor.white
        myButton.layer.masksToBounds = true
        myButton.layer.cornerRadius = 10.0
        myButton.setTitle("Set Value", for: .normal)
        myButton.setTitleColor(UIColor.darkGray, for: .normal)
        myButton.addTarget(self, action: #selector(clickSetButton), for: .touchUpInside)
        
        view.addSubview(myButton)
    }

    
    func changeSlider(sender : UISlider){
        print(CGFloat(sender.value))
        SettingProvider.instance.setSliderValue(floatVal: sender.value)
    }
    
    func clickSetButton(){
        dismiss(animated: true, completion: nil)
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
