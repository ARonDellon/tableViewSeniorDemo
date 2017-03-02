//
//  pageTitleView.swift
//  tableViewSeniorDemo
//
//  Created by wangweiyi on 2017/3/2.
//  Copyright © 2017年 wwy. All rights reserved.
//

import UIKit

enum selectedStyle {
    case underLine, border, background
}

class pageTitleView: UIView {

    let margin: CGFloat = 10
    let padding: CGFloat = 5
    public var bigFont: UIFont = UIFont.systemFont(ofSize: 14)
    public var normalFont: UIFont = UIFont.systemFont(ofSize: 12)
    public var titleColor: UIColor = UIColor.black
    public var contentBackColor: UIColor = UIColor.white

    let contentScroll: UIScrollView = {
        let view = UIScrollView.init()
        return view
    }()

    private var titles: [String] = []

    init() {
        super.init(frame: CGRect.init(x: 0, y: 0, width: k_SCREEN_W, height: 40))
        self.initializeUI()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }


}



fileprivate extension pageTitleView {

    func initializeUI() {
        contentScroll.frame = CGRect.init(x: 0,
                                          y: 0,
                                          width: self.bounds.width,
                                          height: "text".heightWithFont(font: bigFont, fixedWidth: CGFloat.greatestFiniteMagnitude))
        contentScroll.backgroundColor = UIColor.clear
        self.addSubview(contentScroll)
    }
}















