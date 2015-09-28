//
//  ViewController.swift
//  PopupMenuControllerExample
//
//  Created by hooge on 15/9/28.
//  Copyright © 2015年 hoowang. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.titleView = titleButton

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    private lazy var titleButton:UIButton = {
        let titleButton = UIButton()
        titleButton.setTitle("弹出菜单", forState: UIControlState.Normal)
        titleButton.addTarget(self, action: "titleButtonClickHandler", forControlEvents: UIControlEvents.TouchUpInside)
        titleButton.setTitleColor(UIColor.orangeColor(), forState: UIControlState.Normal)

        titleButton.setTitleColor(UIColor.darkGrayColor(), forState: UIControlState.Highlighted)
        return titleButton
    }()

    func titleButtonClickHandler(){
        let popMenu = UIStoryboard(name:"PopupMenuController", bundle: nil)
        let popupMenuController = popMenu.instantiateInitialViewController()

        // 以modal的方式直接展现一个控制器的时候
        // 调用modal的控制器将会被移除掉 被modal的控制器将会展现
        // 如果想保留当前控制器的显示 这个时候需要用到自定义转场动画
        // 1.直接modal方式
        //presentViewController(popupMenuController!, animated: true, completion: nil)

        // 2.自定义转场方式
        // 2.1设置代理（实现代理方法 指定自定义转场动画的实现者）
        popupMenuController?.transitioningDelegate = animationConfigurator
        // 2.2指定样式
        popupMenuController?.modalPresentationStyle = UIModalPresentationStyle.Custom

        presentViewController(popupMenuController!, animated: true, completion: nil)
    }

    private lazy var animationConfigurator:AnimationConfigurator = {
        let animationConfigurator = AnimationConfigurator()
        return animationConfigurator
        }()
}

