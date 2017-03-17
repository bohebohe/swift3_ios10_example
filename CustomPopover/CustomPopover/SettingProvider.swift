//
//  SettingProvider.swift
//  CustomPopover
//
//  Created by bohebohechan on 2017/03/17.
//  Copyright © 2017年 FirstFourNotes. All rights reserved.
//

import Foundation


//Singleton Class
class SettingProvider{
    
    //private static let _instance = SettingProvider()
    
    private static var sliderVal:Float?
    public static let defaultSliderVal:Float = 50.0
    
    
    static let _instance: SettingProvider = {
        let _instance = SettingProvider()
        
        sliderVal = defaultSliderVal
        
        return _instance
    }()
    
    
    

    static var instance:SettingProvider{
        
        return _instance
    }
    
    func setSliderValue(floatVal:Float){
        SettingProvider.sliderVal = floatVal
    }
    
    func getSliderValue() -> Float?{
        return SettingProvider.sliderVal!
    }
}
