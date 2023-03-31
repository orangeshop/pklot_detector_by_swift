//
//  Log_view_TableViewController.swift
//  AiTest
//
//  Created by 최영호 on 2023/03/25.
//

import UIKit

class Log_view_TableViewController: UIViewController {
    

    private let table_view : UITableView = {
        let table = UITableView()
        table.translatesAutoresizingMaskIntoConstraints = false
        table.register(Log_view_TableViewCell.self, forCellReuseIdentifier: Log_view_TableViewCell.id)
        return table
    }()
    
    let navigation_bar : UINavigationBar = {
        let bar = UINavigationBar()
        bar.translatesAutoresizingMaskIntoConstraints = false
        return bar
        
    }()
    
    let test = CameraViewController1()

    
    var x_dot : [Double] = [0]
    var y_dot : [Double] = [0]
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.view.backgroundColor = .white
    
        print(" x dot list\(x_dot_list.count)")
        print(" y dot list\(y_dot_list.count)")
        
        
        
        //print("test x dot list\(test.vc.data_x_list.count)")
        //print("test y dot list\(test.vc.data_y_list.count)")
//        
        
        x_dot.append(0)
        y_dot.append(0)
        
//        for i in 0 ..< x_dot.count{
//            print("\(x_dot[i]) , \(y_dot[i])")
//        }
//
//        //print("test data \(test.data_x_list.count)")
//        print("test data \(x_dot.count)")
        
      
        view.addSubview(table_view)
        table_view.delegate = self
        table_view.dataSource = self
        
        NSLayoutConstraint.activate([
            
            table_view.topAnchor.constraint(equalTo: super.view.topAnchor),
            table_view.leftAnchor.constraint(equalTo: super.view.leftAnchor),
            table_view.rightAnchor.constraint(equalTo: super.view.rightAnchor),
            table_view.bottomAnchor.constraint(equalTo: super.view.bottomAnchor),

        ])
    }
    
}

extension Log_view_TableViewController:UITableViewDataSource, UITableViewDelegate{
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 4
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100.0
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 50.0
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: Log_view_TableViewCell.id, for: indexPath) as? Log_view_TableViewCell else {return UITableViewCell()}
        
//        cell.x_y_dot.text = String(x_dot[indexPath.section]) + ", " + String(y_dot[indexPath.section])
        
        return cell
    }    
}
