//
//  Log_view_TableViewCell.swift
//  AiTest
//
//  Created by 최영호 on 2023/03/25.
//

import UIKit

class Log_view_TableViewCell: UITableViewCell {

    static var id = "Log_view_tableview_cell"
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
        
    }
    
    var x_y_dot:UILabel = {
        var label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        
        return label
    }()
    
    var inner_view: UIView = {
        var view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .none
        view.layer.borderWidth = 1
        view.layer.borderColor = UIColor.black.cgColor
        view.layer.cornerRadius = 5
        return view
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)

        contentView.backgroundColor = .white
        
        contentView.addSubview(inner_view)
        inner_view.addSubview(x_y_dot)
        auto_layout()
    }

    func auto_layout(){
        NSLayoutConstraint.activate([
            inner_view.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 20),
            inner_view.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: 20),
            inner_view.rightAnchor.constraint(equalTo: contentView.rightAnchor, constant: -20),
            inner_view.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -20),
            
            x_y_dot.topAnchor.constraint(equalTo: inner_view.topAnchor, constant: 5),
            x_y_dot.leftAnchor.constraint(equalTo: inner_view.leftAnchor, constant: 5),
            x_y_dot.rightAnchor.constraint(equalTo: inner_view.rightAnchor, constant: -5),
            x_y_dot.bottomAnchor.constraint(equalTo: inner_view.bottomAnchor, constant: -5),
          
        ])
    }
    
    
    required init?(coder: NSCoder) {
        fatalError()
    }

}
