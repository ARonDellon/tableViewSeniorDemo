//
//  horizontalTableViewVC.swift
//  tableViewSeniorDemo
//
//  Created by wangweiyi on 2017/2/28.
//  Copyright © 2017年 wwy. All rights reserved.
//

import UIKit

class horizontalTableViewVC: UIViewController {

    var tableView: UITableView?


    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.lightGray
        self.setupUI()
        self.title = "horizontalTableViewVC"
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()

    }




}


extension horizontalTableViewVC: UITableViewDelegate, UITableViewDataSource {

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var cell = tableView.dequeueReusableCell(withIdentifier: "cell")
        if cell == nil {
            cell = customCell.init(style: .default, reuseIdentifier: "cell")
            cell?.selectionStyle = .none
        }
        cell?.transform = CGAffineTransform.init(rotationAngle: (CGFloat)(M_PI_2))
        return cell!
    }

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 120
    }


}

// MARK: - UI
extension horizontalTableViewVC {

    func setupUI() {
        self.tableView = UITableView.init(frame: CGRect.init(x: 0, y: 0, width: 120, height: k_SCREEN_W))
        var transform = CGAffineTransform.init(rotationAngle: -(CGFloat)(M_PI_2))       //锚点是tableview的center逆时针旋转90°
        transform.tx = k_SCREEN_W/2 - self.tableView!.bounds.width/2                    //水平平移到屏幕中央
        transform.ty = -self.tableView!.bounds.height/2 + self.tableView!.bounds.width/2//竖直平移到y=0
        //由于平移位置都是基于tableview和self.view本身的，所以tableivew的size改变不需要改变平移量
        //平移以后的tableView的位置就是初始化时候的（x:0,y:0）想要自定义便宜到哪里，改初始化的x，y即可
        self.tableView?.transform = transform
        self.tableView?.delegate = self
        self.tableView?.dataSource = self
        self.view.addSubview(self.tableView!)
    }
    
    
}






class customCell: UITableViewCell {

    var iconImage: UIImageView?
    var titleLabel: UILabel?

    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.contentView.backgroundColor = UIColor.cyan
        self.setupUI()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func setupUI() {

        iconImage = UIImageView.init(frame: CGRect.init(x: 10, y: 5, width: 100, height: 90))


        iconImage?.image = UIImage.init(named: "212")
        self.contentView.addSubview(iconImage!)

        titleLabel = UILabel.init(frame: CGRect.init(x: 10, y: 100, width: 100, height: 20))
        titleLabel?.textAlignment = .center
        titleLabel?.text = "text"
        self.contentView.addSubview(titleLabel!)
    }
}
