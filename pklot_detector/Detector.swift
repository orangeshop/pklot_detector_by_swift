//
//  Detector.swift
//  AiTest
//
//  Created by 최영호 on 2023/01/23.
//

import Foundation
import UIKit
import AVFoundation
import Vision

extension CameraViewController1{
    func setupDetector(){
        let modelURL = Bundle.main.url(forResource: "MyObjectDetector 13", withExtension: "mlmodelc")
        print("setupDetector")
        do{
            let vistionModel = try VNCoreMLModel(for: MLModel(contentsOf: modelURL!))
            let recognitions = VNCoreMLRequest(model: vistionModel, completionHandler: detectionDidComplete)
            self.requests = [recognitions]
        }catch let error{
            print(error)
        }
    }
    
    func detectionDidComplete(request: VNRequest, error: Error?){
        DispatchQueue.main.async(execute: {
            if let results = request.results{
                self.extractDetection(results)
            }
        })
    }
    
    
    
    func extractDetection(_ results: [VNObservation]){
        detectionLayer.sublayers = nil
        // 설정한 레이어를 체크하기 위한 임시 점들을 모아둔 배열
        var temp_x_dot_list = Array<Double>()
        var temp_y_dot_list = Array<Double>()
        var temp_pk_true_false_list = Array<Bool>()
        
        
        
        for observation in results where observation is VNRecognizedObjectObservation{
            guard let objectObservation = observation as? VNRecognizedObjectObservation else {return}
            
            //let objectBounds = VNImageRectForNormalizedRect(objectObservation.boundingBox, Int(screenRect.size.width), Int(screenRect.size.height))
            // -> 기존에서 수정
            
            let objectBounds = VNImageRectForNormalizedRect(objectObservation.boundingBox, Int(screenRect.size.height), Int(screenRect.size.width))
            
            //let transformBounds = CGRect(x: (objectBounds.minX), y: screenRect.size.height - objectBounds.maxY, width: objectBounds.maxX - objectBounds.minX, height: objectBounds.maxY - objectBounds.minY)
            // -> 기존에서 수정
            let transformBounds = CGRect(x: objectBounds.minY, y: screenRect.size.height - objectBounds.minX, width: objectBounds.maxX - objectBounds.minX, height: objectBounds.maxY - objectBounds.minY)
            
            if(detector_view_inner == true){
                for i in 0 ..< arr.count{
                    
                    if(pk_lot_check_result[i] == true){
                        detectionLayer.addSublayer(make_layer(cnt: i, color: UIColor.green))
                    }else{
                        detectionLayer.addSublayer(make_layer(cnt: i, color: UIColor.red))
                    }
                }
            }
            
            x_dot_list.append(Double(objectBounds.minY))
            y_dot_list.append(Double(screenRect.size.height - objectBounds.minX))
            
            
            temp_x_dot_list.append(Double(objectBounds.minY))
            temp_y_dot_list.append(Double(screenRect.size.height - objectBounds.minX))
            
            let boxLayer = self.drawBoundingBox(transformBounds)
            let textLayer = self.textBoundingBox(transformBounds, string: objectObservation.labels[0].identifier)
    
            let x_dot = CALayer()
            x_dot.frame = CGRect(x: objectBounds.minX, y: screenRect.size.height - objectBounds.maxY, width: 1, height: 1)
            x_dot.backgroundColor = UIColor.blue.cgColor
            
            // 정방향시 좌표 재 지정
            
            if(objectObservation.labels[0].identifier == "space-empty"){
                //print("빈 공간은 layer를 붉은색으로")
                boxLayer.backgroundColor = UIColor.red.cgColor
                temp_pk_true_false_list.append(false)
                detectionLayer.addSublayer(boxLayer)
            }else{
                //print("채워진 공간은 layer를 초록색으로")
                boxLayer.backgroundColor = UIColor.green.cgColor
                detectionLayer.addSublayer(boxLayer)
                temp_pk_true_false_list.append(true)
            }
        }
        
        for i in 0 ..< temp_x_dot_list.count{
            
            
            for k in 0 ..< arr.count{
                
                if(arr[k].frame.minX <= temp_x_dot_list[i] && temp_x_dot_list[i] <= (arr[k].frame.maxX) && arr[k].frame.minY <= temp_y_dot_list[i] && temp_y_dot_list[i] <= arr[k].frame.maxY){
                    
                    pk_lot_check_result[k] = calculate_ratio_func(cnt: k, check: temp_pk_true_false_list[i])
                }
            }
        }
        
        //초 기화
        //temp_x_dot_list.
        temp_x_dot_list.removeAll()
        temp_y_dot_list.removeAll()
        temp_pk_true_false_list.removeAll()
    }
    
    func calculate_ratio_func(cnt : Int, check : Bool) -> Bool{
        var ans = false
        pk_lot_check_ratio[cnt] = 100
        if(check == false){
            pk_lot_check_ratio[cnt] /= 2
        }else{
            pk_lot_check_ratio[cnt] *= 2
        }
        
        if(pk_lot_check_ratio[cnt] > 60){
            ans = true
        }else if(pk_lot_check_ratio[cnt] < 40){
            ans = false
        }
        
        return ans
    }
    
    func textBoundingBox(_ bounds:CGRect, string text:String) -> CATextLayer{
        
        let textLayer = CATextLayer()
        textLayer.frame = bounds
        textLayer.string = text
        
        return textLayer
    }
    
    func drawBoundingBox(_ bounds: CGRect) -> CALayer{
        
        let boxLayer = CALayer()
        boxLayer.frame = bounds
        boxLayer.borderWidth = 3.0
        boxLayer.borderColor = CGColor.init(red: 7.0, green: 8.0, blue: 7.0, alpha: 1.0)
        boxLayer.cornerRadius = 4
        
        return boxLayer
    }
    
    func setupLayers(){
        detectionLayer = CALayer()
        detectionLayer.frame = CGRect(x: 0, y: 0, width: screenRect.size.width, height: screenRect.size.height)
        previewLayer.addSublayer(detectionLayer)
        
    }
    
    func updateLayers(){
        detectionLayer?.frame = CGRect(x: 0, y: 0, width: screenRect.size.width, height: screenRect.size.height)
    }
    
    func captureOutput(_ output: AVCaptureOutput, didOutput sampleBuffer: CMSampleBuffer, from connection: AVCaptureConnection) {
        guard let pixelBuffer = CMSampleBufferGetImageBuffer(sampleBuffer) else {return}
        let imageRequestHandler = VNImageRequestHandler(cvPixelBuffer: pixelBuffer, orientation: .up, options: [:])
        
        do{
            try imageRequestHandler.perform(self.requests)
        }catch let error{
            print(error)
        }
    }
}


