//
//  RingBuffer.swift
//  HTTPSwiftExample
//
//  Created by Eric Larson on 10/27/17.
//  Copyright © 2017 Eric Larson. All rights reserved.
//

import UIKit

let BUFFER_SIZE = 50

class RingBuffer: NSObject {
    
    var x = [Double](repeating:0, count:BUFFER_SIZE)
    var y = [Double](repeating:0, count:BUFFER_SIZE)
    var z = [Double](repeating:0, count:BUFFER_SIZE)
    
    var head:Int = 0 {
        didSet{
            if(head >= BUFFER_SIZE){
                head = 0
            }
            
        }
    }
    
    func addNewData(xData:Double,yData:Double,zData:Double){
        x[head] = xData
        y[head] = yData
        z[head] = zData
        
        head += 1
    }
    
    func getDataAsVector()->[Double]{
        var allVals = [Double](repeating:0, count:3*BUFFER_SIZE)
        
        for i in 0..<BUFFER_SIZE {
            let idx = (head+i)%BUFFER_SIZE
            allVals[3*i] = x[idx]
            allVals[3*i+1] = y[idx]
            allVals[3*i+2] = z[idx]
        }
        
        return allVals
    }

}
