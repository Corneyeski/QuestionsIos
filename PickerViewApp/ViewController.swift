import UIKit


class ViewController: UIViewController, UIPickerViewDataSource,
    UIPickerViewDelegate {
    
    var groups:[Tema] = []
    var who = 0
    var question = Pregunta()
    var tema = Tema()
    var points:Int = 0
    var btnActive = false
    
    var randomSelected = 0
    
    @IBOutlet weak var pickerView: UIPickerView!
    @IBOutlet weak var start: UIButton!
    @IBOutlet weak var pregunta: UITextView!
    @IBOutlet weak var resa: UITextView!
    @IBOutlet weak var resb: UITextView!
    @IBOutlet weak var resc: UITextView!
    @IBOutlet weak var resd: UITextView!
    @IBOutlet weak var puntos: UITextField!
    @IBOutlet weak var btna: UIButton!
    @IBOutlet weak var btnb: UIButton!
    @IBOutlet weak var btnc: UIButton!
    @IBOutlet weak var btnd: UIButton!
    
    //variables crear tema
    @IBOutlet weak var askcreate: UITextField!
    @IBOutlet weak var inputcreate: UITextField!
    @IBOutlet weak var add: UIButton!
    @IBOutlet weak var cancel: UIButton!
    var timeInput = 0
    var team = Tema()
    
    //Reinicia el juego de cero borrando todo
    @IBAction func restartGame(_ sender: Any) {
        groups.removeAll();
        rellenar();
        
        who = 0
        question = Pregunta()
        tema = Tema()
        points = 0
        btnActive = false
        
        randomSelected = 0
        
        btna.isHidden = true;
        btnb.isHidden = true;
        btnc.isHidden = true;
        btnd.isHidden = true;
        resa.backgroundColor = UIColor.clear
        resb.backgroundColor = UIColor.clear
        resc.backgroundColor = UIColor.clear
        resd.backgroundColor = UIColor.clear
        
        resa.text = ""
        resb.text = ""
        resc.text = ""
        resd.text = ""
        pregunta.text = ""
    }
    
    /**Crear tema */
    @IBAction func createTema(_ sender: Any) {
        askcreate.isHidden = false;
        inputcreate.isHidden = false;
        add.isHidden = false;
        cancel.isHidden = false;
    }
    
    @IBAction func addInputText(_ sender: Any) {
        
        //Por defecto por si no me da tie
        let askq = Pregunta()
        askq.correcta = 1
        
        switch timeInput {
        case 0:
            print("")
            
            if inputcreate.text != "" {
                team.nombre = inputcreate.text!
            }else {
                team.nombre = "no white pls"
            }
            timeInput += 1
            askcreate.text = "pregunta?"
        case 1:
            print("")
            if inputcreate.text != "" {
                askq.pregunta = inputcreate.text!
            }else {
                askq.pregunta = "white"
            }
            timeInput += 1
            askcreate.text = "respuesta 1? la correcta"
        case 2:
            print("")
            if inputcreate.text != "" {
                askq.respuestas[0] = inputcreate.text!
            }else {
                askq.respuestas[0] = "white"
            }
            timeInput += 1
            askcreate.text = "respuesta 2?"
        case 3:
            print("")
            if inputcreate.text != "" {
                askq.respuestas[1] = inputcreate.text!
            }else {
                askq.respuestas[1] = "white"
            }
            timeInput += 1
            askcreate.text = "respuesta 3?"
        case 4:
            print("")
            if inputcreate.text != "" {
                askq.respuestas[2] = inputcreate.text!
            }else {
                askq.respuestas[2] = "white"
            }
            timeInput += 1
            askcreate.text = "respuesta 4?"
        case 5:
            print("")
            if inputcreate.text != "" {
                askq.respuestas[3] = inputcreate.text!
            }else {
                askq.respuestas[3] = "white"
            }
            timeInput = 1
            askcreate.text = "pregunta?"
            
            team.preguntas.append(askq)
            
        default:
           print("ge")
        }
    }
    
    //agregar a los temas el tema
    @IBAction func addTeamToArray(_ sender: Any) {
        groups.append(team)
        
        askcreate.isHidden = true;
        inputcreate.isHidden = true;
        add.isHidden = true;
        cancel.isHidden = true;
        
        timeInput = 0
        askcreate.text = "nombre del tema?"
    }
    
    /**
     *
     *
     * Parece que la parte de añadir preguntas no va, no se por que pero esta a puntito
     *
     *
     */
    
    //seleccionamos la pregunta y comproamos que no esten todas contestadas
    @IBAction func startQuestion(_ sender: Any) {
        
        cleanBackgroundcolor()
        
        tema = Tema(object: groups[who])
        
        if !tema.complete && tema.preguntas.count > 0 {
            
            var ask = false
            
            repeat {
                let random = Int(arc4random_uniform(UInt32((tema.preguntas.count-1) - 0 + 1)) +  0)
            
                if !tema.preguntas[random].realizada {
                    ask = true
                    question = tema.preguntas[random]
                    randomSelected = random
                }
            }while !ask
            
            complete()
            
        } else {
            
        }
        
    }
    
    //Comprobar respuesta
    @IBAction func checkAnswer(_ sender: Any) {
        
        if (sender as AnyObject).tag+1 == question.correcta {
            question.acertada = true
            points += 1
            puntos.text = "PUNTOS: " + String(points)
            
            checkTema()
            isCorrect(answer: (sender as AnyObject).tag, color: UIColor.green)
        }else {
            checkTema()
            isCorrect(answer: (sender as AnyObject).tag, color: UIColor.red)
        }
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        rellenar()
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    

    //Funcion pra crear las preguntas basicas de cada tema
    func rellenar(){
        
        //Juegos
        var juegos:[Pregunta]
        
        let j1 = Pregunta(pregunta: "A que compañia pertenece Mario odyssey?",
                          respuesta: "Nintendo",
                          respuesta2: "SEGA",
                          respuesta3: "EA",
                          respuesta4: "Atari",
                          correcta: 1)
        
        let j2 = Pregunta(pregunta: "Que dios grigo tiene una saga?",
                          respuesta: "Fenrir",
                          respuesta2: "Zeus",
                          respuesta3: "Kratos",
                          respuesta4: "Jesus",
                          correcta: 3)
        
        let j3 = Pregunta(pregunta: "Cual es la consola mas vendida de todos los tiempos?", respuesta: "PS2",
                          respuesta2: "PS3",
                          respuesta3: "super nintendo",
                          respuesta4: "Xbox360",
                          correcta: 1)
        
        juegos = [j1,j2,j3]
        groups.append(Tema(nombre: "juegos",preguntas: juegos))
        
        //Series
        var series:[Pregunta]
        
        let s1 = Pregunta(pregunta: "En Rick&Morty, Cuantas versiones de rick hay en el multiverso?", respuesta: "ninguno",
                          respuesta2: "millones",
                          respuesta3: "wubba-lubba-dab-dab",
                          respuesta4: "infinitos",
                          correcta: 4)
        
        let s2 = Pregunta(pregunta: "En Dr.who, Que es el silencio?",
                          respuesta: "Una orden destinada a matar al doctor",
                          respuesta2: "Una orden destinada a evitar que el doctor diga su nombre",
                          respuesta3: "Un grupo de alienigenas que no se pueden recordar",
                          respuesta4: "una orden religiosa",
                          correcta: 2)
        
        let s3 = Pregunta(pregunta: "En waliking dead, quien mata a Gleen?",
                          respuesta: "Rick",
                          respuesta2: "Nigan",
                          respuesta3: "Mishon",
                          respuesta4: "Un soldado de nigan",
                          correcta: 2)
        
        series = [s1,s2,s3]
        groups.append(Tema(nombre:"series",preguntas: series))
    }
    
    //Rellenar pregunta
    func complete() {
        pregunta.text = question.pregunta
        resa.text = "A - " + question.respuestas[0]
        resb.text = "B - " + question.respuestas[1]
        resc.text = "C - " + question.respuestas[2]
        resd.text = "D - " + question.respuestas[3]
        hideButtons()
    }
    
    //Actualizar pregunta y comprobar si el tema esta lleno
    func checkTema() {
        question.realizada = true
        tema.preguntas[randomSelected] = question
        
        var check = true
        
        for quest in tema.preguntas {
            if !quest.realizada {
                check = false
                break
            }
        }
        
        if check {
            
            //DANI POR ALGUN MOTIVO ABSURDO ESTA FUNCION FUNCIONA ARRIBA PERO AQUI NO
            cleanBackgroundcolor()
            
            tema.complete = true
            
            resa.text = ""
            resb.text = ""
            resc.text = ""
            resd.text = ""
            
            pregunta.text = "TODAS LAS PREGUNTAS DE ESTE TEMA HAN SIDO RESPONDIDAS"
            cleanBackgroundcolor()
            
        }
        groups[who] = tema

        hideButtons()
        
    }
    
    //Esconder o mostrar botones a necesidad (y quitar background si es necesario de texto)
    func hideButtons() {
        if !btnActive {
            btna.isHidden = false;
            btnb.isHidden = false;
            btnc.isHidden = false;
            btnd.isHidden = false;
            
            btnActive = true
        }else {
            btna.isHidden = true;
            btnb.isHidden = true;
            btnc.isHidden = true;
            btnd.isHidden = true;
            
            
            btnActive = false
        }
    }
    
    //Poner background rojo/verde segun lo que toque
    
    func isCorrect(answer:Int, color:UIColor) {
        switch answer {
        case 0:
            print(0)
            resa.backgroundColor = color
        case 1:
            print(1)
            resb.backgroundColor = color
        case 2:
            print(2)
            resc.backgroundColor = color
        case 3:
            print(3)
            resd.backgroundColor = color
        default:
            print("jaja")
        }
    }
    
    //Limpiar el background color
    func cleanBackgroundcolor() {
        resa.backgroundColor = UIColor.clear
        resb.backgroundColor = UIColor.clear
        resc.backgroundColor = UIColor.clear
        resd.backgroundColor = UIColor.clear
    }
    
    //PICKERVIEW SETTINGS
    
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
    }
}
