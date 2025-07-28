import UIKit
import Foundation

class ViewController: UIViewController {
    @IBOutlet weak var countLabel: UILabel!
    @IBOutlet weak var incrementButton: UIButton!
    @IBOutlet weak var decrementButton: UIButton!
    @IBOutlet weak var clearButton: UIButton!
    @IBOutlet weak var historyTextView: UITextView!
    var count: Int = 0
    

    override func viewDidLoad() {
        super.viewDidLoad()
        historyTextView.isEditable = false
        historyTextView.text = "История изменений:"
        incrementButton.backgroundColor = .red
        decrementButton.backgroundColor = .blue
        updateCountLabel()
    }

    @IBAction func increment(_ sender: Any) {
        count += 1
        updateCountLabel()
        addHistory(action: "значение изменено на +1")
    }
    @IBAction func decrement(_ sender: Any) {
        if count > 0 {
            count -= 1
            updateCountLabel()
            addHistory(action: "значение изменено на -1")
        }else{
            addHistory(action: "попытка уменьшить значение счётчика ниже 0")
        }
        
    }
    @IBAction func clear(_ sender: Any) {
        count = 0
        updateCountLabel()
        addHistory(action: "значение сброшено")
    }
    
    private func updateCountLabel () {
        countLabel.text = "Значение счетчика: \(count)"
    }
    
    private func addHistory (action: String) {
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd.MM.yyyy HH:mm:ss"
        let date = Date()
        let dateString = dateFormatter.string(from: date)
        
        historyTextView.text = historyTextView.text + "\n[\(dateString)]: " + action
    }
}

