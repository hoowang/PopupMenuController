//
//  PopMenuPresentationController.swift
//  WKWeibo
//
//  Created by hooge on 15/9/15.
//  Copyright © 2015年 hoowang. All rights reserved.
//

import UIKit

class PopMenuPresentationController: UIPresentationController {

    override init(presentedViewController: UIViewController, presentingViewController: UIViewController) {
        super.init(presentedViewController:presentedViewController, presentingViewController:presentingViewController)
    }

    override func containerViewWillLayoutSubviews() {
        containerView?.backgroundColor = UIColor(white: 0.0, alpha: 0.2)
        //containerView?.insertSubview(maskView, atIndex: 0)
        let tapGestureRecognizer = UITapGestureRecognizer(target: self, action: "close")
        containerView?.addGestureRecognizer(tapGestureRecognizer)

        // 2.调整展现视图大小
        presentedView()?.frame = CGRect(x: 100, y: 56, width: 200, height: 200)
    }


    // 这里又延迟加载一个蒙板视图，其实无此必要 直接使用containerView即可
    private lazy var maskView:UIView = {
        let maskView = UIView()
        maskView.frame = UIScreen.mainScreen().bounds
        maskView.backgroundColor = UIColor.blueColor()
        return maskView
    }()

    func close(){
        presentedViewController.dismissViewControllerAnimated(true, completion: nil)
    }
}
