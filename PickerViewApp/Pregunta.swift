//
//  Pregunta.swift
//  PickerViewApp
//
//  Created by DAM on 15/11/17.
//  Copyright © 2017 DAM. All rights reserved.
//

import Foundation

class Pregunta{
    
    var pregunta: String
    var respuestas: [String]
    /*var respuesta: String
    var respuesta2: String
    var respuesta3: String
    var respuesta4: String*/
    var realizada:Bool
    var correcta:Int
    var acertada:Bool
    
    init(){
        self.pregunta = ""
        self.respuestas = []
        /* self.respuesta = ""
        self.respuesta2 = ""
        self.respuesta3 = ""
        self.respuesta4 = "" */
        self.realizada = false
        self.correcta = 0
        self.acertada = false;
    }
    
    init(pregunta: String, respuesta:String, respuesta2:String, respuesta3:String, respuesta4:String, correcta:Int) {
        self.pregunta = pregunta
        self.respuestas = [respuesta,respuesta2,respuesta3,respuesta4]
        /*self.respuesta = respuesta
        self.respuesta2 = respuesta2
        self.respuesta3 = respuesta3
        self.respuesta4 = respuesta4*/
        self.realizada = false
        self.correcta = correcta
        self.acertada = false;
    }
}
