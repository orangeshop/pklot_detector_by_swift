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
        
        
        
        for observation in results where observation is VNRecognizedObjectObservation{
            guard let objectObservation = observation as? VNRecognizedObjectObservation else {return}
            
            
            
            
            //let objectBounds = VNImageRectForNormalizedRect(objectObservation.boundingBox, Int(screenRect.size.width), Int(screenRect.size.height))
            // -> 기존에서 수정
            
            let objectBounds = VNImageRectForNormalizedRect(objectObservation.boundingBox, Int(screenRect.size.height), Int(screenRect.size.width))
            
            //let transformBounds = CGRect(x: (objectBounds.minX), y: screenRect.size.height - objectBounds.maxY, width: objectBounds.maxX - objectBounds.minX, height: objectBounds.maxY - objectBounds.minY)
            // -> 기존에서 수정
            let transformBounds = CGRect(x: objectBounds.minY, y: screenRect.size.height - objectBounds.minX, width: objectBounds.maxX - objectBounds.minX, height: objectBounds.maxY - objectBounds.minY)
            
            
//            data_x = Double(objectBounds.minY)
//            data_y = Double(screenRect.size.height - objectBounds.minX)
//
//            data_x_list.append(Double(objectBounds.minY))
            //data_y_list.append(Double(screenRect.size.height - objectBounds.minX))
            
            x_dot_list.append(Double(objectBounds.minY))
            y_dot_list.append(Double(screenRect.size.height - objectBounds.minX))
            
            
            
           
            
            let boxLayer = self.drawBoundingBox(transformBounds)
            
            let textLayer = self.textBoundingBox(transformBounds, string: objectObservation.labels[0].identifier)
                 
           // print("transformBounds  x : \(screenRect.size.height - objectBounds.minX) , y : \(screenRect.size.height - objectBounds.maxY) ,widht : \(objectBounds.maxX - objectBounds.minX) ,height: \(transformBounds.height)  ")
            
            let x_dot = CALayer()
            x_dot.frame = CGRect(x: objectBounds.minX, y: screenRect.size.height - objectBounds.maxY, width: 1, height: 1)
            x_dot.backgroundColor = UIColor.blue.cgColor
            
            // 정방향시 좌표 재 지정
            
            if(objectObservation.labels[0].identifier == "space-empty"){
                //print("빈 공간은 layer를 붉은색으로")
                //boxLayer.layer.backgroundColor = .init(red: 255, green: 0, blue: 0, alpha: 0)
                boxLayer.backgroundColor = UIColor.red.cgColor
                detectionLayer.addSublayer(boxLayer)
                
                detectionLayer.addSublayer(textLayer)
                //previewLayer.addSublayer(x_dot)
            }else{
                //print("채워진 공간은 layer를 초록색으로")
                boxLayer.backgroundColor = UIColor.green.cgColor
                
                detectionLayer.addSublayer(boxLayer)
                
            }
        }
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


