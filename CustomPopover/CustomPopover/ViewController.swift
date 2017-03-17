//
//  ViewController.swift
//  CustomPopover
//
//  Created by bohebohechan on 2017/03/17.
//  Copyright © 2017年 FirstFourNotes. All rights reserved.
//

import UIKit

// 1. > UIViewControllerTransitioningDelegateのプロトコルを追加
class ViewController: UIViewController ,UIViewControllerTransitioningDelegate{
    
    var clickMeBtn:UIButton?

    @IBOutlet weak var sliderValLabel: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    @IBAction func tapButton(_ sender: UIButton) {
        //Button set For Animation
        clickMeBtn = sender
        
        let popupVC = PopupViewController()
        popupVC.modalPresentationStyle = .custom
        popupVC.transitioningDelegate = self
        present(popupVC, animated: true, completion: nil)
        
        
    }
    
    
    // 2. > UIViewControllerTransitioningDelegateのプロトコルにあるメソッドを追加
    // UIPresentationController の実装クラスのインスタンスを返す
    // MARK: UIViewControllerTransitioningDelegate
    
    func presentationController(forPresented presented: UIViewController, presenting: UIViewController?, source: UIViewController) -> UIPresentationController? {
        //presented が呼び出し先の View Controller、presenting が呼び出し元の View Controller 
        return PopupPresentationController(presentedViewController: presented, presenting: presenting)

    }

    
    // 3. > animationController
    // MARK: UIViewControllerAnimatedTransitioning
    
    func animationController(forPresented presented: UIViewController, presenting: UIViewController, source: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        
        return PopupAnimatedTransitioning(isPresent: true, tapButton: clickMeBtn)
    }
    
    func animationController(forDismissed dismissed: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        
        if let val = SettingProvider.instance.getSliderValue(){
            sliderValLabel.text = String(describing: val)
        }
        
        return PopupAnimatedTransitioning(isPresent: false,tapButton: clickMeBtn)
    }
    
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

