//
//  ViewController.swift
//  Animation
//
//  Created by bohebohechan on 2017/03/22.
//  Copyright © 2017年 FirstFourNotes. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var myImage: UIImageView!
    
    var index = 1
    
    var timer = Timer()
    var isAnimating = false
    
    @IBOutlet weak var btnSlideInout: UIButton!
    @IBOutlet weak var btnFadeInOut: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    
    @IBAction func startAnimation(_ sender: Any) {
        
        if isAnimating{
            self.timer.invalidate()
            isAnimating = false
        }else{
            timer = Timer.scheduledTimer(timeInterval: 4, target: self, selector: #selector(self.animateSlide), userInfo: nil, repeats: true)
            isAnimating = true
        }
    }
    
    
    @IBAction func startFadeInout(_ sender: Any) {
        
        if isAnimating{
            self.timer.invalidate()
            isAnimating = false
        }else{
            timer = Timer.scheduledTimer(timeInterval: 4, target: self, selector: #selector(self.animateFade), userInfo: nil, repeats: true)
            isAnimating = true
        }
    }
    
    func fadeIn() {
        
        myImage.alpha = 0
        
        UIView.animate(withDuration: 2){
            self.myImage.alpha = 1
        }
    }
    
    

    
    func animateSlide(){
        
        myImage.center = CGPoint(x:myImage.center.x - 800 , y:myImage.center.y)
        myImage.image = UIImage(named: "\(index).jpg")
        
        
        UIView.animate(withDuration: 0.8, delay: 0.0, options: [.curveEaseIn], animations: {
             self.myImage.center = CGPoint(x:self.myImage.center.x + 800 , y: self.myImage.center.y)
        }, completion: { _ in
 
            UIView.animate(withDuration: 0.8, delay: 2.0, options: [.curveEaseIn], animations: {
                    self.myImage.center = CGPoint(x:self.myImage.center.x + 1600 , y: self.myImage.center.y)
                }, completion: { _ in
                
                    self.index += 1
                
                    if self.index == 9 {
                     self.index = 1
                    }
                })

        })
   
    }
    
    func animateFade(){
        
        myImage.alpha = 0
        myImage.image = UIImage(named: "\(index).jpg")
        
        
        UIView.animate(withDuration: 0.8, delay: 0.0, options: [.curveEaseIn], animations: {
            self.myImage.alpha = 1
        }, completion: { _ in
            
            UIView.animate(withDuration: 0.8, delay: 2.0, options: [.curveEaseIn], animations: {
                self.myImage.alpha = 0
            }, completion: { _ in
                
                self.index += 1
                
                if self.index == 9 {
                    self.index = 1
                }
            })
            
        })
        
    }
    
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

