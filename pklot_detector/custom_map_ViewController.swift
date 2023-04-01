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
    
    let select_photo_label : UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "사진 선택"
        label.textColor = .black
        return label
    }()
    
    let select_photo : UIButton = {
        let btn = UIButton()
        btn.backgroundColor = .white
        btn.layer.borderColor = UIColor.black.cgColor
        btn.layer.borderWidth = 1.5
        btn.layer.cornerRadius = 10
        btn.translatesAutoresizingMaskIntoConstraints = false
        return btn
    }()
    
    let image_view :UIImageView = {
        let view = UIImageView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.layer.cornerRadius = 7
        return view
    }()
    
    var choose_photo_check : Bool = false
    
    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .white
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "다음", style: .plain, target: self, action: #selector(next_btn))
        
        
        picker.delegate = self
        
       
        
        view.addSubview(select_photo)
        select_photo.addSubview(select_photo_label)
        view.addSubview(image_view)
        select_photo.addTarget(self, action: #selector(present_photo), for: .touchUpInside)
        auto_layout()
    }
    
    func auto_layout(){
        NSLayoutConstraint.activate([
            select_photo.topAnchor.constraint(equalTo: super.view.topAnchor, constant: 150),
            select_photo.leftAnchor.constraint(equalTo: super.view.leftAnchor, constant: 25),
            select_photo.rightAnchor.constraint(equalTo: super.view.rightAnchor, constant: -25),
            
            select_photo_label.centerXAnchor.constraint(equalTo: select_photo.centerXAnchor),
            select_photo_label.centerYAnchor.constraint(equalTo: select_photo.centerYAnchor),
            
            image_view.topAnchor.constraint(equalTo: select_photo.bottomAnchor, constant: 75),
            image_view.leftAnchor.constraint(equalTo: super.view.leftAnchor, constant: 10),
            image_view.rightAnchor.constraint(equalTo: super.view.rightAnchor, constant: -10),
            image_view.bottomAnchor.constraint(equalTo: super.view.bottomAnchor, constant: -150),
        ])
    }
    
    @objc func next_btn(){
        
        
        var vc = next_custom_mapViewController()
        
        if(choose_photo_check == false)
        {
            let alert = UIAlertController(title: "알림", message: "이미지를 선택해 주세요", preferredStyle: .alert)
            let cancle = UIAlertAction(title: "확인", style: .cancel, handler: nil)
            alert.addAction(cancle)
            present(alert, animated: true)
        }else{
            vc.image_view = image_view.self
            navigationController?.pushViewController(vc, animated: true)
        }
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
                    choose_photo_check = true
                }
        
        
        dismiss(animated: true, completion: nil)
    }
}
