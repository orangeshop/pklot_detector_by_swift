//
//  custom_map_ViewController.swift
//  AiTest
//
//  Created by 최영호 on 2023/03/25.
//

import UIKit

class custom_map_ViewController: UIViewController {

    let picker : UIImagePickerController = {
        let picker = UIImagePickerController()
        picker.sourceType = .photoLibrary
        picker.allowsEditing = true
        return picker
    }()
    
    let select_photo : UIButton = {
        let btn = UIButton()
        btn.backgroundColor = .orange
        btn.translatesAutoresizingMaskIntoConstraints = false
        return btn
    }()
    
    let image_view :UIImageView = {
        let view = UIImageView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .white
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "다음", style: .plain, target: self, action: #selector(next_btn))
        
        
        picker.delegate = self
        
        view.addSubview(select_photo)
        view.addSubview(image_view)
        select_photo.addTarget(self, action: #selector(present_photo), for: .touchUpInside)
        
        auto_layout()
    }
    
    func auto_layout(){
        NSLayoutConstraint.activate([
            select_photo.topAnchor.constraint(equalTo: super.view.topAnchor, constant: 100),
            select_photo.leftAnchor.constraint(equalTo: super.view.leftAnchor, constant: 25),
            select_photo.rightAnchor.constraint(equalTo: super.view.rightAnchor, constant: -25),
            
            
            image_view.topAnchor.constraint(equalTo: select_photo.bottomAnchor, constant: 100),
            image_view.leftAnchor.constraint(equalTo: super.view.leftAnchor, constant: 10),
            image_view.rightAnchor.constraint(equalTo: super.view.rightAnchor, constant: -10),
            image_view.bottomAnchor.constraint(equalTo: super.view.bottomAnchor, constant: -150),
        ])
    }
    
    @objc func next_btn(){
        
    }
    
    @objc func present_photo(){
        print("select photo")
        present(picker, animated: true)
    }
}

extension custom_map_ViewController: UIImagePickerControllerDelegate , UINavigationControllerDelegate{
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        if let img = info[UIImagePickerController.InfoKey.originalImage]{
                    image_view.image = img as? UIImage
                }
                
        dismiss(animated: true, completion: nil)
    }
}
