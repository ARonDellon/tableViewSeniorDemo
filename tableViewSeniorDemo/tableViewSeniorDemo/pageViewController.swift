//
//  pageViewController.swift
//  tableViewSeniorDemo
//
//  Created by wangweiyi on 2017/3/1.
//  Copyright © 2017年 wwy. All rights reserved.
//

import UIKit

class pageViewController: UIViewController {


    fileprivate var scrollView: UIScrollView?
    fileprivate var controllers: [UIViewController] = []
    fileprivate var indexNow: Int = 0
    fileprivate var selectedViewController: UIViewController?
    public var pagerDelegate: pageVCDelegate?

    override func loadView() {
        super.loadView()
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        self.setupUI()
    }

    func reloadSelf() {
        _ = self.childViewControllers.map{$0.removeFromParentViewController()}
        _ = self.scrollView?.subviews.map{$0.removeFromSuperview()}
        self.setupChildViewControllers()
    }

    private func setupChildViewControllers() {
        if controllers.count == 0 {return}
        for (index,viewController) in controllers.enumerated() {
            viewController.view.frame = CGRect.init(x: CGFloat(index)*self.scrollView!.bounds.width,
                                                    y: 0,
                                                    width: self.scrollView!.bounds.width,
                                                    height: self.scrollView!.bounds.height)
            self.addChildViewController(viewController)
            self.scrollView?.addSubview(viewController.view)
        }

        self.scrollView?.contentSize = CGSize.init(width: CGFloat(controllers.count) * self.scrollView!.bounds.width,
                                                   height: self.scrollView!.bounds.height)
        self.move(toIndex: 0, withAnimation: false)
    }

    func add(childViewController: UIViewController, toIndex: Int) {
        if toIndex > controllers.count-1 {
            return
        }
        controllers.insert(childViewController, at: toIndex)
        self.reloadSelf()
    }

}



fileprivate extension pageViewController {

    func setupUI() {
        scrollView = UIScrollView.init(frame: self.view.bounds)
        scrollView?.backgroundColor = UIColor.clear
        scrollView?.delegate = self
        scrollView?.contentSize = self.view.bounds.size
        scrollView?.isPagingEnabled = true
        self.view.addSubview(scrollView!)
    }

}

extension pageViewController: UIScrollViewDelegate {

    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        self.pagerDelegate?.pageViewScrolling?(offSet: scrollView.contentOffset.x / scrollView.bounds.width)
    }
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        let index = scrollView.contentOffset.x / scrollView.bounds.width
        self.pagerDelegate?.pageViewEndScroll?(atIndex: Int(index))
    }
}

extension pageViewController {


    func setupControllers(viewControllers: [UIViewController]) {
        controllers = viewControllers
        self.reloadSelf()
    }

    func move(toIndex: Int, withAnimation: Bool) {
        scrollView?.setContentOffset(CGPoint.init(x: CGFloat(toIndex)*scrollView!.bounds.width, y: 0), animated: withAnimation)
    }

}


@objc protocol pageVCDelegate {
    @objc optional func pageViewScrolling(offSet: CGFloat)
    @objc optional func pageViewEndScroll(atIndex: Int)

}













