//
//  PopupPresentationController.swift
//  CustomPopover
//
//  Created by bohebohechan on 2017/03/17.
//  Copyright © 2017年 FirstFourNotes. All rights reserved.
//

import UIKit

class PopupPresentationController: UIPresentationController {

    var overlay: UIView!
    
    // 表示トランジション開始前に呼ばれる
    override func presentationTransitionWillBegin() {
        let containerView = self.containerView!
        
        self.overlay = UIView(frame: containerView.bounds)
        self.overlay.gestureRecognizers = [UITapGestureRecognizer(target: self, action: #selector(self.overlayDidTouch(_:)))]
        self.overlay.backgroundColor = UIColor.lightGray
        self.overlay.alpha = 0.0
        containerView.insertSubview(self.overlay, at: 0)
        
        presentedViewController.transitionCoordinator?.animate(alongsideTransition: {
            [unowned self] context in
            self.overlay.alpha = 0.5
            }, completion: nil)
    }
    
    // 非表示トランジション開始前に呼ばれる
    override func dismissalTransitionWillBegin() {
        self.presentedViewController.transitionCoordinator?.animate(alongsideTransition: {
            [unowned self] context in
            self.overlay.alpha = 0.0
            }, completion: nil)
    }
    
    // 非表示トランジション開始後に呼ばれる
    override func dismissalTransitionDidEnd(_ completed: Bool) {
        if completed {
            self.overlay.removeFromSuperview()
        }
    }
    
    override func size(forChildContentContainer container: UIContentContainer, withParentContainerSize parentSize: CGSize) -> CGSize {
        return CGSize(width: parentSize.width / 2, height: parentSize.height / 2)
    }
    
    override var frameOfPresentedViewInContainerView : CGRect {
        var presentedViewFrame = CGRect.zero
        let containerBounds = containerView!.bounds
        presentedViewFrame.size = self.size(forChildContentContainer: self.presentedViewController, withParentContainerSize: containerBounds.size)
        //表示する座標位置をここで決める
        presentedViewFrame.origin.x = containerBounds.size.width / 4
        presentedViewFrame.origin.y = containerBounds.size.height / 4
 
        return presentedViewFrame
        
    }
    
     // レイアウト開始前に呼ばれる
    override func containerViewWillLayoutSubviews() {
        overlay.frame = containerView!.bounds
        self.presentedView!.frame = self.frameOfPresentedViewInContainerView
    }
    
    // レイアウト開始後に呼ばれる
    override func containerViewDidLayoutSubviews() {
    }
    
    //------------------------------------------------------
    
    // overlayViewをタップしたときに呼ばれる
    func overlayDidTouch(_ sender: AnyObject) {
        print("overlayDidTouch")
        print(sender)
        self.presentedViewController.dismiss(animated: true, completion: nil)
    }
    
    
}
