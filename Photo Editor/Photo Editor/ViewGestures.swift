//
//  ViewGestures.swift
//  Photo Editor
//
//  Created by Mohamed Hamed on 4/24/17.
//  Copyright © 2017 Mohamed Hamed. All rights reserved.
//

import UIKit


extension ViewController : UIGestureRecognizerDelegate  {
//Translation is moving object 
    func panGesture(_ recognizer: UIPanGestureRecognizer) {
        let view = recognizer.view!
        view.superview?.bringSubview(toFront: view)
        let point = recognizer.location(in: self.view) //recognizer.translation(in: view)
        view.center = point// CGPoint(x: view.center.x + point.x, y: view.center.y + point.y)
        recognizer.setTranslation(CGPoint.zero, in: self.view)
    }

    func pinchGesture(_ recognizer: UIPinchGestureRecognizer) {
        if let view = recognizer.view {
            view.transform = view.transform.scaledBy(x: recognizer.scale, y: recognizer.scale)
            recognizer.scale = 1
        }
    }
    
    func rotationGesture(_ recognizer: UIRotationGestureRecognizer) {
        if let view = recognizer.view {
            view.transform = view.transform.rotated(by: recognizer.rotation)
            recognizer.rotation = 0
        }
    }
    
    func tapGesture(_ recognizer: UITapGestureRecognizer) {
        if let view = recognizer.view {
            view.superview?.bringSubview(toFront: view)
            let previouTransform =  view.transform
            UIView.animate(withDuration: 0.2,
                           animations: {
                            view.transform = view.transform.scaledBy(x: 1.2, y: 1.2)
            },
                           completion: { _ in
                            UIView.animate(withDuration: 0.2) {
                                view.transform  = previouTransform//CGAffineTransform.identity
                            }
            })
        }
    }
    
    func gestureRecognizer(_ gestureRecognizer: UIGestureRecognizer, shouldRecognizeSimultaneouslyWith otherGestureRecognizer: UIGestureRecognizer) -> Bool {
        return true
    }
    
    func gestureRecognizer(_ gestureRecognizer: UIGestureRecognizer, shouldRequireFailureOf otherGestureRecognizer: UIGestureRecognizer) -> Bool {
        return false
    }
    
    func gestureRecognizer(_ gestureRecognizer: UIGestureRecognizer, shouldBeRequiredToFailBy otherGestureRecognizer: UIGestureRecognizer) -> Bool {
        return false
    }
    
    func screenEdgeSwiped(_ recognizer: UIScreenEdgePanGestureRecognizer) {
        if recognizer.state == .recognized {
            addBottomSheetView()
        }
    }
    
    
    // to Override Control Center screen edge pan from bottom
    override var prefersStatusBarHidden: Bool {
        return true
    }
    
}
