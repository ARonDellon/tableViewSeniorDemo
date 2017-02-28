//
//  rightInAnimationVC.swift
//  tableViewSeniorDemo
//
//  Created by wangweiyi on 2017/2/28.
//  Copyright © 2017年 wwy. All rights reserved.
//

import UIKit

class rightInAnimationVC: UIViewController {

    var tableView: UITableView?

    var shouldStartAnimation: Bool = false
    /*第一次push进VC的时候，列表所展示的cell是不需要动画的，而且，这些cell会在viewdidAppear之前准备好，所以动画flag会在viewdidAppear之后开启*/


    override func viewDidLoad() {
        super.viewDidLoad()
        print("viewdidload")
        self.setupUI()
        self.title = "rightInAnimation"

    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        shouldStartAnimation = true
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()

    }




}


extension rightInAnimationVC: UITableViewDelegate, UITableViewDataSource {

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 30
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

        var cell = tableView.dequeueReusableCell(withIdentifier: "cell")
        if cell == nil {
            cell = UITableViewCell.init(style: .default, reuseIdentifier: "cell")
            cell?.contentView.backgroundColor = UIColor.cyan
            cell?.selectionStyle = .none
        }
        cell?.imageView?.image = UIImage.init(named: "212")
        cell?.textLabel?.text = "text"
        return cell!
    }

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }


    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        if !shouldStartAnimation {return}
        let transform = CGAffineTransform.init(translationX: tableView.bounds.width/2, y: 0)
        cell.transform = transform
        UIView.animate(withDuration: 1) {
            cell.transform = CGAffineTransform.identity
        }
    }
}

// MARK: - UI
extension rightInAnimationVC {

    func setupUI() {
        self.tableView = UITableView.init(frame: CGRect.init(x: 0, y: 0, width: k_SCREEN_W, height: k_SCREEN_H))
        self.tableView?.delegate = self
        self.tableView?.dataSource = self
        self.view.addSubview(self.tableView!)
    }
    
    
}
