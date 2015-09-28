//
//  AnimationConfigurator.swift
//  WKWeibo
//
//  Created by hooge on 15/9/15.
//  Copyright © 2015年 hoowang. All rights reserved.
//
//  转场动画配置器

import UIKit

class AnimationConfigurator: NSObject, UIViewControllerTransitioningDelegate, UIViewControllerAnimatedTransitioning {

    // 返回负责转场动画的控制器对象
    func presentationControllerForPresentedViewController(presented: UIViewController, presentingViewController presenting: UIViewController, sourceViewController source: UIViewController) -> UIPresentationController? {
        return PopMenuPresentationController(presentedViewController: presented, presentingViewController: presenting)
    }

    func animationControllerForPresentedController(presented: UIViewController, presentingController presenting: UIViewController, sourceController source: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        return self
    }

    func animationControllerForDismissedController(dismissed: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        return self
    }

    func transitionDuration(transitionContext: UIViewControllerContextTransitioning?) -> NSTimeInterval {
        return 0.5
    }

    func animateTransition(transitionContext: UIViewControllerContextTransitioning)
    {
        // 1. 展现动画处理逻辑
        let toView = transitionContext.viewForKey(UITransitionContextToViewKey)
        if (toView != nil)
        {
            toView?.transform = CGAffineTransformMakeScale(1.0, 0.0)
            transitionContext.containerView()?.addSubview(toView!)
            toView?.layer.anchorPoint = CGPoint(x:0.5, y:0)
            UIView.animateWithDuration(0.3, animations: { () -> Void in

                toView?.transform = CGAffineTransformIdentity
                }) { (_) -> Void in
                    transitionContext.completeTransition(true)
            }
            return
        }

        // 2.消失动画处理逻辑
        let fromView = transitionContext.viewForKey(UITransitionContextFromViewKey)
        UIView.animateWithDuration(0.2, animations: { () -> Void in
            // 浮点数无法精确 所以写0.0会没有动画
            fromView?.transform = CGAffineTransformMakeScale(1.0, 0.0000001)
            }) { (_) -> Void in
                transitionContext.completeTransition(true)
        }
        
    }
    
}
