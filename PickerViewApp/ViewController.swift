//
//  ViewController.swift
//  PickerViewApp
//
//  Created by DAM on 15/11/17.
//  Copyright © 2017 DAM. All rights reserved.
//

import UIKit




class ViewController: UIViewController, UIPickerViewDataSource,
    UIPickerViewDelegate {
    
    var groups:[Tema] = []
    var who = 0
    
    @IBOutlet weak var pickerView: UIPickerView!
    @IBOutlet weak var pregunta: UITextField!
    @IBOutlet weak var start: UIButton!
    @IBOutlet weak var resa: UITextField!
    @IBOutlet weak var resb: UITextField!
    @IBOutlet weak var resc: UITextField!
    @IBOutlet weak var resd: UITextField!
    
    @IBAction func startQuestion(_ sender: Any) {
        
        var tema = Tema(object: groups[who])
        
        switch groups[who].nombre {
        case "juegos":
            print("hry")
            
        case "series":
            print("series")
            
        default:
            print("nada")
        }
        
        //hacer de forma dinamica el mostrar la pregunta
        
        if !tema.complete && tema.preguntas.count > 0 {
            
        } else {
            
        }
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        rellenar()
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }




//Funcion pra crear las preguntas basicas de cada tema
    func rellenar(){
        
        //Juegos
        var juegos:[Pregunta]
        
        let j1 = Pregunta(pregunta: "A que compañia pertenece Mario odyssey?", respuesta: "Nintendo", respuesta2: "SEGA", respuesta3: "EA", respuesta4: "Atari", correcta: 1)
        let j2 = Pregunta(pregunta: "Que dios grigo tiene una saga?", respuesta: "Fenrir", respuesta2: "Zeus", respuesta3: "Kratos", respuesta4: "Jesus", correcta: 3)
        let j3 = Pregunta(pregunta: "Cual es la consola mas vendida de todos los tiempos?", respuesta: "PS2", respuesta2: "PS3", respuesta3: "super nintendo", respuesta4: "Xbox360", correcta: 1)
        
        juegos = [j1,j2,j3]
        groups.append(Tema(nombre: "juegos",preguntas: juegos))
        
        //Series
        var series:[Pregunta]
        
        let s1 = Pregunta(pregunta: "En Rick&Morty, Cuantas versiones de rick hay en el multiverso?", respuesta: "ninguno", respuesta2: "millones", respuesta3: "wubba-lubba-dab-dab", respuesta4: "infinitos", correcta: 4)
        let s2 = Pregunta(pregunta: "En Dr.who, Que es el silencio?", respuesta: "Una orden destinada a matar al doctor", respuesta2: "Una orden destinada a evitar que el doctor diga su nombre", respuesta3: "Un grupo de alienigenas que no se pueden recordar", respuesta4: "una orden religiosa", correcta: 2)
        let s3 = Pregunta(pregunta: "En waliking dead, quien mata a Gleen?", respuesta: "Rick", respuesta2: "Nigan", respuesta3: "Mishon", respuesta4: "Un soldado de nigan", correcta: 2)
        
        series = [s1,s2,s3]
        groups.append(Tema(nombre:"series",preguntas: series))
    }
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return groups.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return groups[row].nombre
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        who = row
        startQuestion(startQuestion((Any).self))
    }
}
