//
//
//class Model {
//    private var _weather_info : Weather
//    private var _person_info : Person
////    private var _pants_info : [Pant]
////    private var _coats_into : [Coat]
//    
//    init(weather_info : Weather, person_info: Person) {
//        _weather_info = weather_info
//        _person_info = person_info
//    }
//    
//    private func checkIfWearingEnoughCloth() -> Bool {
//        var h = 8.6125
//        
//        var m1 = 6.0
//        var m2 = 60.0
//        var m3 = 36.0
//        var m4 = 50.0
//        var m = m1 + m2 + m3 + m4
//        
//        var n = 5400.0
//        var t = 5400.0
//        
//        var l1: Double = 1 / 1000   //cloth width
//        var l2: Double = 3.42 / 1000
//        var l3: Double = 3.42 / 1000
//        var l4: Double = 3.42 / 1000
//        
//        var lam_1 = 0.027   //cloth thermal Conductivity
//        var lam_2 = 0.071
//        var lam_3 = 0.071
//        var lam_4 = 0.071
//        
//        var de_1 = 1.18     //cloth texture density
//        var de_2 = 1550.0
//        var de_3 = 1550.0
//        var de_4 = 1550.0
//        
//        var c1 = 1010.0    //Cloth specialHeatCapacity
//        var c2 = 1210.0
//        var c3 = 1210.0
//        var c4 = 1210.0
//        
//        //calculate thermal diffusivity
////        var a1 = lam_1 / (c1 * de_1)
////        var a2 = lam_2 / (c2 * de_2)
////        var a3 = lam_3 / (c3 * de_3)
////        var a4 = lam_4 / (c4 * de_4)
//        
//        //calculate time step and material cut length
////        var delta_x1 = l1 / m1
////        var delta_x2 = l2 / m2
////        var delta_x3 = l3 / m3
////        var delta_x4 = l4 / m4
//
//        var delta_t : Double = t / n
//        
//        //calculate ratio
////        var r1 = delta_t / pow(delta_x1, 2) * a1
////        var r2 = delta_t / pow(delta_x2, 2) * a2
////        var r3 = delta_t / pow(delta_x3, 2) * a3
////        var r4 = delta_t / pow(delta_x4, 2) * a4
//        
////        var u = simd_matrix
//        
//        return false
//    }
//
//}
