//
//  ViewController.swift
//  DesignPatterns
//
//  Created by Magus on 2022/5/22.
//

import UIKit

// Do any additional setup after loading the view.
/** 软件设计7条原则：
 * 1、开闭原则：对扩展开放，对修改关闭
 * 2、里氏替换：继承时子类不父类 的方法属性重写，仅扩展
 *
 * 3、单一职责：一个类只负责一项任务
 * 4、接口隔离：庞大的接口拆分为粒度更小的接口
 * 5、依赖倒置：面向接口编程
 * 6、迪米尔：引入中间类来降低耦合
 * 7、合成复用：使用组合、聚合替代继承
 */

//https://www.jianshu.com/p/e69988161819
// https://www.cnblogs.com/StevenHuSir/p/AppArchitecture_MVC.html

class ViewController: UIViewController {

    
    var viewModel = ViewModel()

    var datasource = GQDataSource()
    
    let tableView = UITableView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        
        viewModel.loadData()
        
        self.tableView.dataSource =  GQDataSource.initWithReuseIdentifier("GG", block: { [weak self] cell, model, indexPath in
        
            if let myCell = cell as? MyCell {
                myCell.nameLbel.text = model.name
                myCell.countFiled.text = model.count
                myCell.present = self?.viewModel
            }
            
            
        })
    }


}

