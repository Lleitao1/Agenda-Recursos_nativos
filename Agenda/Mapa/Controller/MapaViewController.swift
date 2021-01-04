//
//  MapaViewController.swift
//  Agenda
//
//  Created by Lucas Abdel Leitao on 04/01/21.
//  Copyright © 2021 Alura. All rights reserved.
//

import UIKit
import MapKit

class MapaViewController: UIViewController {
    
    //MARK: - IBOutlets
    
    @IBOutlet weak var mapa: MKMapView!
    
    
    //MARK: - variavel
    
    var aluno:Aluno?
    
    //MARK: - View Lyfecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.title = getTitulo()
        localizacaoInicial()
        localizarAluno()
    }
    
    //MARK: - metodos
        func getTitulo()-> String{
            
            return "localizar alunos"
    }
    
    func localizacaoInicial(){
        Localizacao().converteEnderecoCoordenadas(endereco: "Caelum - São Paulo") { (localizacaoEncontrada) in
            let pino = self.configuraPino(titulo: "Caelum", localizacao: localizacaoEncontrada)
            let regiao = MKCoordinateRegionMakeWithDistance(pino.coordinate, 5000, 5000)
            self.mapa.setRegion(regiao, animated: true)
            self.mapa.addAnnotation(pino)
        }
    }
    
    func localizarAluno(){
        if let aluno = aluno{
            Localizacao().converteEnderecoCoordenadas(endereco: aluno.endereco!) { (localizacaoEncontrada) in
                let pino = self.configuraPino(titulo: aluno.nome!, localizacao: localizacaoEncontrada)
                self.mapa.addAnnotation(pino)
            }
        }
    }
    
    func configuraPino(titulo:String, localizacao:CLPlacemark)-> MKPointAnnotation {
        let pino = MKPointAnnotation()
        pino.title = titulo
        pino.coordinate = localizacao.location!.coordinate
        
        
        return pino
    }

}
