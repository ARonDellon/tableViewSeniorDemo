//
//  ViewController.swift
//  tableViewSeniorDemo
//
//  Created by wangweiyi on 2017/2/28.
//  Copyright © 2017年 wwy. All rights reserved.
//

let k_SCREEN_W = UIScreen.main.bounds.size.width
let k_SCREEN_H = UIScreen.main.bounds.size.height

import UIKit

class ViewController: UIViewController {

    var tableView: UITableView?

    let titles: [[String]] = [["横行tableview","cell延迟动画","cell右侧进入动画","cell缩放动画"],["pagerVC"]]

    override func viewDidLoad() {
        super.viewDidLoad()
        self.setupUI()
        self.title = "Demo"
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()

    }




}


extension ViewController: UITableViewDelegate, UITableViewDataSource {

    func numberOfSections(in tableView: UITableView) -> Int {
        return titles.count
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return titles[section].count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var cell = tableView.dequeueReusableCell(withIdentifier: "cell")
        if cell == nil {
            cell = UITableViewCell.init(style: .default, reuseIdentifier: "cell")
            cell?.selectionStyle = .none
        }
        cell?.textLabel?.text = titles[indexPath.section][indexPath.row]
        return cell!
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        switch indexPath.section {
        case 0:
            switch indexPath.row {
            case 0:
                self.navigationController?.pushViewController(horizontalTableViewVC(),
                                                              animated: true)
                break
            case 1:
                self.navigationController?.pushViewController(delayCellAnimationVC(),
                                                              animated: true)
                break
            case 2:
                self.navigationController?.pushViewController(rightInAnimationVC(),
                                                              animated: true)
                break
            case 3:
                self.navigationController?.pushViewController(zoomCellAnimtaionVC(),
                                                              animated: true)
                break
            default:
                break
            }
            break
        case 1:
            switch indexPath.row{
            case 0:
                self.navigationController?.pushViewController(pagerVC(),
                                                              animated: true)
                break
            default:
                break
            }
            break
        default:
            break
        }

    }
}

// MARK: - UI
extension ViewController {

    func setupUI() {
        self.tableView = UITableView.init(frame: CGRect.init(x: 0, y: 0, width: k_SCREEN_W, height: k_SCREEN_H), style: .grouped)

        self.tableView?.delegate = self
        self.tableView?.dataSource = self
        self.view.addSubview(self.tableView!)
    }


}
