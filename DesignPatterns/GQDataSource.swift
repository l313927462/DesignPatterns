//
//  GQDataSource.swift
//  DesignPatterns
//
//  Created by Magus on 2022/5/22.
//

import Foundation
import UIKit


 typealias TableViewCellConfigureBlock = ((_ cell:UITableViewCell?,_ model:BaseCellModel,_ indexPath: IndexPath) -> Void)

class GQDataSource : NSObject, UITableViewDataSource{
    
    private(set)  var reuseIdentifiers = [String]()
    var cellConfigure:TableViewCellConfigureBlock?
    var dataSource = [BaseCellModel]()
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataSource.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier:self.reuseIdentifiers[0]) as? MyCell ?? MyCell()
        let model = self.dataSource[indexPath.row]
        if let block =  self.cellConfigure {
            block(cell,model, indexPath)
        }
        cell.indexPath = indexPath
        return cell 
    }
    
    
    
    static public func  initWithReuseIdentifier(_ reuseIdentifier: String, block:  TableViewCellConfigureBlock)  -> GQDataSource{
        
        
        let object = GQDataSource()
    
        
            if object.reuseIdentifiers.contains(reuseIdentifier) == false {
                object.reuseIdentifiers.append(reuseIdentifier)
        }
        
        return object
            
    }
}
