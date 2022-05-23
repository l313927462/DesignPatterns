//
//  ViewModel.swift
//  DesignPatterns
//
//  Created by Magus on 2022/5/22.
//

import Foundation
struct ViewModel : ClickCellDelegate{
    func click(_ indexpath: IndexPath, num: String) {
        print("点击了：\(indexpath),\(num)")
    }
    
    var dataSourc = [[String:Any]]()
    public func loadData() {
        
    }
}
