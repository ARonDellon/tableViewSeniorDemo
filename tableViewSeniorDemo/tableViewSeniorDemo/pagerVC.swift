//
//  pagerVC.swift
//  tableViewSeniorDemo
//
//  Created by wangweiyi on 2017/3/1.
//  Copyright © 2017年 wwy. All rights reserved.
//

import UIKit

class pagerVC: UIViewController {

    var pager: pageViewController = pageViewController()

    override func viewDidLoad() {
        super.viewDidLoad()
        pager.view.frame = self.view.bounds
        self.addChildViewController(pager)
        self.view.addSubview(pager.view)

        let vc1 = UIViewController()
        vc1.view.backgroundColor = UIColor.red
        let vc2 = UIViewController()
        vc2.view.backgroundColor = UIColor.blue
        let vc3 = UIViewController()
        vc3.view.backgroundColor = UIColor.green
        let vc4 = UIViewController()
        vc4.view.backgroundColor = UIColor.gray
        let vc5 = UIViewController()
        vc5.view.backgroundColor = UIColor.cyan
        let vc6 = UIViewController()
        vc6.view.backgroundColor = UIColor.brown

        pager.setupControllers(viewControllers: [vc1,vc2,vc3,vc4,vc5,vc6])
        pager.pagerDelegate = self




        let button = UIButton.init(frame: CGRect.init(x: 0, y: 0, width: 30, height: 30))
        button.backgroundColor = UIColor.red
        button.addTarget(self, action: #selector(pagerVC.click), for: .touchUpInside)
        let barItem = UIBarButtonItem.init(customView: button)

        let button1 = UIButton.init(frame: CGRect.init(x: 0, y: 0, width: 30, height: 30))
        button1.backgroundColor = UIColor.green
        button1.addTarget(self, action: #selector(pagerVC.click1), for: .touchUpInside)
        let barItem1 = UIBarButtonItem.init(customView: button1)
        self.navigationItem.setRightBarButtonItems([barItem,barItem1], animated: false)

    }

    @objc func click() {
        let vc6 = UIViewController()
        vc6.view.backgroundColor = UIColor.white
        pager.add(childViewController: vc6, toIndex: 2)
    }

    @objc func click1() {
        let vc1 = UIViewController()
        vc1.view.backgroundColor = UIColor.red
        let vc2 = UIViewController()
        vc2.view.backgroundColor = UIColor.blue
        let vc3 = UIViewController()
        vc3.view.backgroundColor = UIColor.green
        pager.setupControllers(viewControllers: [vc1,vc2,vc3])
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    


}


extension pagerVC: pageVCDelegate {
    func pageViewEndScroll(atIndex: Int) {
        print(atIndex)
    }

    func pageViewScrolling(offSet: CGFloat) {
        print(offSet)
    }
}
