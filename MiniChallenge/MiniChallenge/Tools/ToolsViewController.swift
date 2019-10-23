//
//  ToolsViewController.swift
//  MiniChallenge
//
//  Created by Aluno Mack on 09/10/19.
//  Copyright © 2019 Leo Mosca. All rights reserved.
//

import UIKit

class ToolsViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    

    @IBOutlet weak var toolsTableView: UITableView!
    
    var lang: Language = Language()
    var topicIndex = 0
    var toolIndex = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        toolsTableView.delegate = self
        toolsTableView.dataSource = self

        // Do any additional setup after loading the view.
    }
    

    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return (lang.topics?[topicIndex].tools?[toolIndex].content?.count ?? 0) + 1
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 465
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if(indexPath.row == 0){
            if let cell = tableView.dequeueReusableCell(withIdentifier: "ToolCellHeader", for: indexPath) as? ToolsHeaderTableViewCell{
                let toolitems = lang.topics?[topicIndex].tools?[toolIndex].content?.count ?? 0
                let toolname = lang.topics?[topicIndex].tools?[toolIndex].name
                let tooldesc = lang.topics?[topicIndex].tools?[toolIndex].description
                let toolimage = lang.topics?[topicIndex].tools?[toolIndex].image
                
                cell.setHeader(toolname, tooldesc, toolitems, toolimage)
                return cell
                
            }
            
        }
        else{
            //Se for um curso
            if (lang.topics?[topicIndex].tools?[toolIndex].content?[indexPath.row - 1].type == "Curso"){
    
                if let cell = tableView.dequeueReusableCell(withIdentifier: "ToolStudyCell", for: indexPath) as? ToolsStudyTableViewCell{
                    
                    let courseAuthor = lang.topics?[topicIndex].tools?[toolIndex].content?[indexPath.row - 1].author
                    let courseImage = lang.topics?[topicIndex].tools?[toolIndex].content?[indexPath.row - 1].image
                    let courseLength = lang.topics?[topicIndex].tools?[toolIndex].content?[indexPath.row - 1].duration
                    let courseRating = lang.topics?[topicIndex].tools?[toolIndex].content?[indexPath.row - 1].rating
                    let courseSubheading = lang.topics?[topicIndex].tools?[toolIndex].content?[indexPath.row - 1].subtitle
                    let courseTitle = lang.topics?[topicIndex].tools?[toolIndex].content?[indexPath.row - 1].title
                    
                    cell.setCourse(courseImage, courseTitle, courseSubheading, courseAuthor, courseLength, courseRating)
                    return cell
            }
            
        }
        
            //Se for um artigo
            else if (lang.topics?[topicIndex].tools?[toolIndex].content?[indexPath.row - 1].type == "Artigo"){
                
                if let cell = tableView.dequeueReusableCell(withIdentifier: "ToolReadCell", for: indexPath) as? ToolsReadTableViewCell{
                    
                    let articleImage = lang.topics?[topicIndex].tools?[toolIndex].content?[indexPath.row - 1].image
                    let articleSource = lang.topics?[topicIndex].tools?[toolIndex].content?[indexPath.row - 1].author
                    let articleSubheading = lang.topics?[topicIndex].tools?[toolIndex].content?[indexPath.row - 1].subtitle
                    let articleTitle = lang.topics?[topicIndex].tools?[toolIndex].content?[indexPath.row - 1].title
                    
                    cell.setArticle(articleImage, articleTitle, articleSubheading, articleSource)
                    
                    return cell
            }
        }
                
            //Se for uma Documentação
            else{
                if let cell = tableView.dequeueReusableCell(withIdentifier: "ToolWatchCell", for: indexPath) as? ToolsWatchTableViewCell{
                    
                    let docImage = lang.topics?[topicIndex].tools?[toolIndex].content?[indexPath.row - 1].image
                    let docSource = lang.topics?[topicIndex].tools?[toolIndex].content?[indexPath.row - 1].author
                    let docSubheading = lang.topics?[topicIndex].tools?[toolIndex].content?[indexPath.row - 1].subtitle
                    let docTitle = lang.topics?[topicIndex].tools?[toolIndex].content?[indexPath.row - 1].title
                    
                    cell.setDoc(docImage, docTitle, docSubheading, docSource)
                    
                    return cell
                }
            }
        }
        return UITableViewCell()
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("Clicou no" + (lang.topics?[topicIndex].tools?[toolIndex].content?[indexPath.row - 1].url ?? "nenhum"))
        
        if (lang.topics?[topicIndex].tools?[toolIndex].content?[indexPath.row - 1].url != nil){
            guard let url = URL(string: lang.topics?[topicIndex].tools?[toolIndex].content?[indexPath.row - 1].url ?? "") else {
                return
            }
            
            if UIApplication.shared.canOpenURL(url) {
                UIApplication.shared.open(url, options: [:], completionHandler: nil)
            }
        }
            }
        
        
    
    
    
    
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
