//
//  Pregunta.swift
//  PickerViewApp
//
//  Created by DAM on 15/11/17.
//  Copyright © 2017 DAM. All rights reserved.
//

import Foundation

class Pregunta{
    
    private var pregunta: String
    private var respuesta: String
    private var respuesta2: String
    private var respuesta3: String
    private var respuesta4: String
    private var realizada:Bool
    private var correcta:Int
    
    init(){
        self.pregunta = ""
        self.respuesta = ""
        self.respuesta2 = ""
        self.respuesta3 = ""
        self.respuesta4 = ""
        self.realizada = false
        self.correcta = 0
    }
    
    init(pregunta: String, respuesta:String, respuesta2:String, respuesta3:String, respuesta4:String, correcta:Int) {
        self.pregunta = pregunta
        self.respuesta = respuesta
        self.respuesta2 = respuesta2
        self.respuesta3 = respuesta3
        self.respuesta4 = respuesta4
        self.realizada = false
        self.correcta = correcta
    }
}
