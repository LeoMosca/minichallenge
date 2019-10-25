//
//  TopicsViewController.swift
//  MiniChallenge
//
//  Created by Aluno Mack on 09/10/19.
//  Copyright © 2019 Leo Mosca. All rights reserved.
//

import UIKit

class TopicsViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    @IBOutlet weak var tableView: UITableView!
    
    var corelang: LanguageAdded?
    var lang: Language = Language()
    var topicIndex = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        
        self.title = lang.topics?[topicIndex].name
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return (lang.topics?[topicIndex].tools?.count ?? 0) + 1
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return indexPath.row == 0 ? 359 : 182
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if(indexPath.row == 0){
            if let cell = tableView.dequeueReusableCell(withIdentifier: "TopicCellHeader", for: indexPath) as? TopicsHeaderTableViewCell{
                let topic = lang.topics?[topicIndex]
                let description = lang.topics?[topicIndex].description
                let language = lang.language
                
                cell.corelang = corelang
                cell.topicId = topic?.id ?? -1
                cell.setHeader(topic?.name, description, language)
                return cell
            }
            
        } else {
            if let cell = tableView.dequeueReusableCell(withIdentifier: "TopicCellItem", for: indexPath) as? TopicsItemTableViewCell{
                let toolname = lang.topics?[topicIndex].tools?[indexPath.row - 1 ].name;
                let toolamount = lang.topics?[topicIndex].tools?[indexPath.row - 1].content?.count ?? 0;
                let description = lang.topics?[topicIndex].tools?[indexPath.row - 1 ].description;
                let toolimage = lang.topics?[topicIndex].tools?[indexPath.row - 1].image;
                
                cell.setItem(toolname, description, toolamount, toolimage);
                return cell
            }
        }
        
        return UITableViewCell()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let dest = segue.destination as? ToolsViewController {
            dest.lang = self.lang
            dest.topicIndex = topicIndex
            if let indexPath = tableView.indexPathForSelectedRow {
                dest.toolIndex = indexPath.row - 1
            }
        }
    }

    @IBAction func markAsStudied(_ sender: Any) {
        if let topicId = lang.topics?[topicIndex].id {
            let topic = CoreDataManager.sharedInstance.insertTopic(topicId)!
            
            if let coretopics = corelang?.topics?.allObjects as? [TopicDone] {
                if let addedtopic = coretopics.first(where: { $0.id_topic == topicId }) {
                    let alert = UIAlertController(title: "Então...", message: "Aparenta que você já informou que concluiu esse tópico. Quer remover a marcação?", preferredStyle: .alert)
                    alert.addAction(UIAlertAction(title: "Não, obrigado", style: .default, handler: nil))
                    alert.addAction(UIAlertAction(title: "Deletar", style: .destructive) { alert in
                        self.corelang?.removeFromTopics(addedtopic)
                        CoreDataManager.sharedInstance.saveContext()
                        self.tableView.reloadData()
                    })
                    self.present(alert, animated: true, completion: nil)
                } else {
                    corelang?.addToTopics(topic)
                    CoreDataManager.sharedInstance.saveContext()
                    self.tableView.reloadData()
                    
                    let alert = UIAlertController(title: "Perfeito!", message: "Obrigado por informar! Seu progresso foi registrado com sucesso", preferredStyle: .alert)
                    alert.addAction(UIAlertAction(title: "Entendi!", style: .default){ alert in
                        if self.corelang?.topics?.count ?? 0 >= self.lang.topics?.count ?? -1 {
                            self.corelang?.isDone = true
                            CoreDataManager.sharedInstance.saveContext()
                            
                            let alert = UIAlertController(title: "Incrível!!", message: "Você acaba de completar a linguagem \(self.lang.language ?? ""), parabéns!! Quando desejar consultar seu material, acesse a aba \"Concluídos\" no menu abaixo.", preferredStyle: .alert)
                            alert.addAction(UIAlertAction(title: "Ok, entendi", style: .default, handler: nil))
                            self.present(alert, animated: true, completion: nil)
                        }
                    })
                    self.present(alert, animated: true, completion: nil)
                }
            }
        } else {
            let alert = UIAlertController(title: "Ops...", message: "Não foi possível registrar seu progresso nesse tópico. Por favor, tente novamente.", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "Ok, entendi", style: .default, handler: nil))
            self.present(alert, animated: true, completion: nil)
        }
        
        
        
    }
}
