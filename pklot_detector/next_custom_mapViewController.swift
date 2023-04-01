//
//  next_custom_mapViewController.swift
//  pklot_detector
//
//  Created by 최영호 on 2023/03/31.
//

import UIKit

class next_custom_mapViewController: UIViewController {
    
    
    let image_view : UIImageView = {
        let image_view = UIImageView()
        image_view.translatesAutoresizingMaskIntoConstraints = false
        return image_view
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = .white
        
        view.addSubview(image_view)
        
        navigationItem.rightBarButtonItems = [
            UIBarButtonItem(title: "저장", style: .plain, target: self, action: #selector(save_func)),
            UIBarButtonItem(image: UIImage(systemName: "plus"), style: .plain, target: self, action: #selector(make_layer)),
        ]
        
        auto_layout()
    }
    
    func auto_layout(){
        NSLayoutConstraint.activate([
            image_view.topAnchor.constraint(equalTo: super.view.topAnchor),
            image_view.leftAnchor.constraint(equalTo: super.view.leftAnchor),
            image_view.rightAnchor.constraint(equalTo: super.view.rightAnchor),
            image_view.bottomAnchor.constraint(equalTo: super.view.bottomAnchor),
        ])
    }
    
    @objc func make_layer(){
        
    }
    
    @objc func save_func(){
        
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
