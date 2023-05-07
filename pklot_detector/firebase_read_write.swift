//
//  firebase_read_write.swift
//  pklot_detector
//
//  Created by 최영호 on 2023/05/07.
//

import Foundation
import FirebaseDatabase
import FirebaseDatabaseSwift
class FirebaseReadWrite : ObservableObject{
    var ref = Database.database().reference()
    
    @Published
    var value : String?
    var value_Youtube : String?
    var value_name : String?
    
    func readValue(){
        ref.child("something").observeSingleEvent(of: .value){snapshot in
            guard let value = snapshot.value as? [String:String] else {
                return
            }
            print("readviwmodel \(value.values)" )
            
            print(value["Youtube"])
            
            self.value_Youtube = value["Youtube"]
            
            self.value_name = value["name"]
        }
        
       
    }
    
    
    
    func writevalue(frame_resourese:String){
        
        print("write value \(frame_resourese)")
        
//        let object : [String:Any] = [
//            "name" : "ios Academy" as NSObject,
//            "Youtube" : "Yes"
//        ]

        let object : [String:Any] = [
            "make_layer" : frame_resourese as NSObject
        ]
        
        
        ref.child("frame\(write_cnt)").setValue(object)
        
        write_cnt += 1
    }

    
    func writevalue1(remain : Int){

        let object : [String:Any] = [
            "Remaining parking space" : "\(1)" as NSObject
        ]
        
        
        ref.child("Remaining parking space").setValue(object)
        
        write_cnt += 1
    }
}
