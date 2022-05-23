//
//  MyCell.swift
//  DesignPatterns
//
//  Created by Magus on 2022/5/22.
//

import UIKit

class MyCell: UITableViewCell {

    var indexPath = IndexPath()
    var nameLbel = UILabel()
    var countFiled = UITextField()
    var button = UIButton()
    
    var present:ClickCellDelegate?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        button .addTarget(self, action: #selector(tap), for: .touchUpInside)
        print(self.indexPath)
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    @objc func tap(){
        if (self.present != nil) {
            self.present?.click(indexPath, num: "33")
        }
    }

}


protocol ClickCellDelegate {
    func click(_ indexpath: IndexPath, num: String )
}
