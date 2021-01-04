//
//  HomeTableViewController.swift
//  Agenda
//
//  Created by Ândriu Coelho on 24/11/17.
//  Copyright © 2017 Alura. All rights reserved.
//

import UIKit
import CoreData

class HomeTableViewController: UITableViewController, UISearchBarDelegate {
    
    //MARK: - Variáveis
    var contexto:NSManagedObjectContext{
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        return appDelegate.persistentContainer.viewContext
    }
    let searchController = UISearchController(searchResultsController: nil)
    var gerenciadorResultados:NSFetchedResultsController<Aluno>?
    
    // MARK: - View Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()
        self.configuraSearch()
    }
    
    // MARK: - Métodos
    
    func configuraSearch() {
        self.searchController.searchBar.delegate = self
        self.searchController.dimsBackgroundDuringPresentation = false
        self.navigationItem.searchController = searchController
    }
    
    func recuperaAluno(){
        let pesquisaAluno:NSFetchRequest<Aluno> = Aluno.fetchRequest()
        let ordenaPorNome = NSSortDescriptor(key: "nome", ascending: true)
        pesquisaAluno.sortDescriptors = [ordenaPorNome]
        
        gerenciadorResultados = NSFetchedResultsController(fetchRequest: pesquisaAluno, managedObjectContext: contexto, sectionNameKeyPath: nil, cacheName: nil)
        
        do{
            try gerenciadorResultados?.performFetch()
            
        }catch{
            print(error.localizedDescription)
        }
        
    }
    
    // MARK: - Table view data source

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        guard let contadorlistaDeAlunos = gerenciadorResultados?.fetchedObjects?.count else {return 0}
        return contadorlistaDeAlunos
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let celula = tableView.dequeueReusableCell(withIdentifier: "celula-aluno", for: indexPath) as! HomeTableViewCell
        guard let aluno = gerenciadorResultados?.fetchedObjects![indexPath.row] else {return celula}
        
        celula.labelNomeDoAluno.text = aluno.nome
        
        if let imagemDoAluno = aluno.foto as? UIImage{
            celula.imageAluno.image = imagemDoAluno
        }
        
        
        return celula
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 85
    }

    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }

}
