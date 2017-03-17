//
//  PopupAnimatedTransitioning.swift
//  CustomPopover
//
//  Created by bohebohechan on 2017/03/17.
//  Copyright © 2017年 FirstFourNotes. All rights reserved.
//


import Foundation
import UIKit

class PopupAnimatedTransitioning: NSObject, UIViewControllerAnimatedTransitioning {
    
    let isPresent: Bool
    let tapButton: UIButton
    
    init(isPresent: Bool , tapButton: UIButton?) {
        self.isPresent = isPresent
        self.tapButton = tapButton ?? UIButton(frame: CGRect.zero)
    }
    
    func transitionDuration(using transitionContext: UIViewControllerContextTransitioning?) -> TimeInterval {
        return 0.45    }
    
    func animateTransition(using transitionContext: UIViewControllerContextTransitioning) {
        if isPresent {
            animatePresentTransition(transitionContext)
        } else {
            animateDissmissalTransition(transitionContext)
        }
    }
    
    // 表示する時のアニメーション
    func animatePresentTransition(_ transitionContext: UIViewControllerContextTransitioning) {
        let presentingController: UIViewController! = transitionContext.viewController(forKey: UITransitionContextViewControllerKey.from)
        let presentedController: UIViewController! = transitionContext.viewController(forKey: UITransitionContextViewControllerKey.to)
        let containerView: UIView! = transitionContext.containerView
        containerView.insertSubview(presentedController.view, belowSubview: presentingController.view)

        presentedController.view.layer.cornerRadius = 4.0
        presentedController.view.clipsToBounds = true
        presentedController.view.alpha = 0.0
        presentedController.view.transform = CGAffineTransform(scaleX: 0.01, y: 0.01)
        
        containerView.insertSubview(presentedController.view, belowSubview: presentingController.view)
        
        UIView.animate(withDuration: transitionDuration(using: transitionContext), delay: 0.0, usingSpringWithDamping: 0.7, initialSpringVelocity: 0.6, options: .curveLinear, animations: {
            presentedController.view.alpha = 1.0
            presentedController.view.frame.origin.x = containerView.bounds.size.width - self.tapButton.frame.origin.x
            presentedController.view.frame.origin.y = containerView.bounds.size.height - self.tapButton.frame.origin.y
            
            print(presentedController.view.frame.origin
            )
            presentedController.view.transform = CGAffineTransform.identity
        }, completion: { finished in
            transitionContext.completeTransition(true)
        })

        
        
    }
    
    // 非表示する時のアニメーション
    func animateDissmissalTransition(_ transitionContext: UIViewControllerContextTransitioning) {
        let presentedController: UIViewController! = transitionContext.viewController(forKey: UITransitionContextViewControllerKey.from)
        //let containerView: UIView! = transitionContext.containerView

        
        UIView.animate(withDuration: transitionDuration(using: transitionContext), delay: 0.0, usingSpringWithDamping: 0.7, initialSpringVelocity: 0.6, options: .curveEaseInOut, animations:{
            presentedController.view.alpha = 0.0
            presentedController.view.transform = CGAffineTransform(scaleX: 0.01, y: 0.01)
            presentedController.view.frame.origin.x = self.tapButton.frame.origin.x
            presentedController.view.frame.origin.y = self.tapButton.frame.origin.y
            
        }, completion: { finished in
            transitionContext.completeTransition(true)
        })
    }
    
}
