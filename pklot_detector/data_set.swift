//
//  data_set.swift
//  pklot_detector
//
//  Created by 최영호 on 2023/03/31.
//

import Foundation
import UIKit

var x_dot_list = Array<Double>()
var y_dot_list = Array<Double>()
var arr = Array<UIView>()
var arr_rotation = Array<rotation>()

struct rotation{
    var a : Double
    var b : Double
    var c : Double
    var d : Double
}

var detector_view_inner = false

var pk_lot_check_result = Array<Bool>()
var pk_lot_check_ratio = Array<Double>()
