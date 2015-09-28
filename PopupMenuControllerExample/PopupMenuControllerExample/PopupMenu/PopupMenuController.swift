//
//  PopupMenuController.swift
//  WKWeibo
//
//  Created by hooge on 15/9/15.
//  Copyright © 2015年 hoowang. All rights reserved.
//

import UIKit

class PopupMenuController: UIViewController {

    override func loadView() {
        let imageView = UIImageView(image: UIImage(named: "popover_background"))
        let tableView = UITableView()
        imageView.addSubview(tableView)
        view = imageView
    }

    override func viewDidLoad() {
        super.viewDidLoad()


    }

    //class func popMenu(view:UIView, size:CGSize) -> (UIViewController)
    class func popMenu() -> (UIViewController)
    {
        let popupMenuController = PopupMenuController()
        return popupMenuController
    }


}
