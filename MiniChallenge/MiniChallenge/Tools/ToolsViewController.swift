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
                    
                    cell.courseAuthor.text = lang.topics?[topicIndex].tools?[toolIndex].content?[indexPath.row - 1].author
                    //cell.courseImage = lang.topics?[topicIndex].tools?[toolIndex].content?[indexPath.row - 1].image
                    cell.courseLength.text = lang.topics?[topicIndex].tools?[toolIndex].content?[indexPath.row - 1].duration
                    cell.courseRating.text = lang.topics?[topicIndex].tools?[toolIndex].content?[indexPath.row - 1].rating
                    cell.courseSubheading.text = lang.topics?[topicIndex].tools?[toolIndex].content?[indexPath.row - 1].subtitle
                    cell.courseTitle.text = lang.topics?[topicIndex].tools?[toolIndex].content?[indexPath.row - 1].title
                    
                    return cell
            }
            
        }
        
            else if (lang.topics?[topicIndex].tools?[toolIndex].content?[indexPath.row - 1].type == "Artigo"){
                
                if let cell = tableView.dequeueReusableCell(withIdentifier: "ToolReadCell", for: indexPath) as? ToolsReadTableViewCell{
                    
                    //cell.articleImage = lang.topics?[topicIndex].tools?[toolIndex].content?[indexPath.row - 1].image
                    cell.articleSource.text = lang.topics?[topicIndex].tools?[toolIndex].content?[indexPath.row - 1].author
                    cell.articleSubheading.text = lang.topics?[topicIndex].tools?[toolIndex].content?[indexPath.row - 1].subtitle
                    cell.articleTitle.text = lang.topics?[topicIndex].tools?[toolIndex].content?[indexPath.row - 1].title
                    
                    return cell
            }
        }
            else{
                if let cell = tableView.dequeueReusableCell(withIdentifier: "ToolWatchCell", for: indexPath) as? ToolsWatchTableViewCell{
                    
                    //cell.docImage = lang.topics?[topicIndex].tools?[toolIndex].content?[indexPath.row - 1].image
                    cell.docSource.text = lang.topics?[topicIndex].tools?[toolIndex].content?[indexPath.row - 1].author
                    cell.docSubheading.text = lang.topics?[topicIndex].tools?[toolIndex].content?[indexPath.row - 1].subtitle
                    cell.docTitle.text = lang.topics?[topicIndex].tools?[toolIndex].content?[indexPath.row - 1].title
                    
                    return cell
                }
            }
        }
        return UITableViewCell()
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
