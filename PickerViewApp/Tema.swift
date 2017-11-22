//
//  Tema.swift
//  PickerViewApp
//
//  Created by DAM on 17/11/17.
//  Copyright © 2017 DAM. All rights reserved.
//

import Foundation

class Tema {
    var nombre:String
    var preguntas:[Pregunta]
    var complete:Bool
    
    init() {
        nombre = ""
        preguntas = []
        complete = false
    }
    
    init(nombre:String, preguntas:[Pregunta]) {
        self.nombre = nombre
        self.preguntas = preguntas
        self.complete = false
    }
    
    init(object:Tema) {
        self.nombre = object.nombre
        self.preguntas = object.preguntas
        self.complete = object.complete
    }
}
