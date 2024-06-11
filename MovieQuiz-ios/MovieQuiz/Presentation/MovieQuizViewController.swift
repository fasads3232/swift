import UIKit

class MovieQuizViewController: UIViewController {
    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        imageView.layer.cornerRadius = 20
        yesButton.layer.cornerRadius = 15
        noButton.layer.cornerRadius = 15
        let currentQuestion = questions[currentQuestionIndex]
        show(quiz: convert(model: currentQuestion))
    }
    
    // свойства
    @IBOutlet private weak var textLabel: UILabel!
    @IBOutlet private weak var counterLabel: UILabel!
    @IBOutlet private weak var imageView: UIImageView!
    @IBOutlet private weak var yesButton: UIButton!
    @IBOutlet private weak var noButton: UIButton!
    private var currentQuestionIndex : Int = 0
    private var correctAnswers : Int = 0
    
    @IBAction private func noButtonClicked(_ sender: UIButton) {
        showAnswerResult(isCorrect: false)
    }
    
    @IBAction private func yesButtonClicked(_ sender: UIButton) {
        showAnswerResult(isCorrect: true)
    }
    
    //функци я конвертации
    private func convert(model: QuizQuestion) -> QuizStepViewModel {
        let viewModel = QuizStepViewModel(image: UIImage(named: "\(model.image)") ?? UIImage(), question: model.text, questionNumber: "\(currentQuestionIndex + 1)/\(questions.count)")
        return viewModel
    }
    // задаем параметры для наших переменных
    private func show(quiz step: QuizStepViewModel){
        imageView.image = step.image
        textLabel.text = step.question
        counterLabel.text = step.questionNumber
    }
    // в зависимости от результата переходим к следующему вопросу либо показываем финальный экран и алерт
    private func showNextQuestionOrResults(){
        if currentQuestionIndex == questions.count - 1{
            let text = "Ваш результат: \(correctAnswers)/11"
            let viewModel = QuizResultsViewModel(title: "Этот раунд окончен!",text: text, buttonText: "Сыграть ещё раз")
            showResult(quiz: viewModel)
        }
        else {
            currentQuestionIndex += 1
            let nextQuestion = questions[currentQuestionIndex]
            let viewModel = convert(model: nextQuestion)
            show(quiz: viewModel)
        }
    }
        
    // показывает результат вопроса, перекрашивая цвет рамки
    private func showAnswerResult(isCorrect: Bool) {
        imageView.layer.masksToBounds = true
        imageView.layer.borderWidth = 8
        let answer = questions[currentQuestionIndex].correctAnswer
        if answer == isCorrect {
            imageView.layer.borderColor = UIColor.ypGreen.cgColor
            correctAnswers += 1
        }
        else {
            imageView.layer.borderColor = UIColor.ypRed.cgColor
        }
        DispatchQueue.main.asyncAfter(deadline: .now() + 1.0) {
           self.imageView.layer.borderColor = UIColor.clear.cgColor
           self.showNextQuestionOrResults()
        }
        self.disableButtons()
        DispatchQueue.main.asyncAfter(deadline: .now() + 1.0){
           self.enableButtons()
            }
        
    }
    //функция для выключения нажатия кнопки на секунду, чтобы нельзя было спамить на них, тем самым влияя конечный результат
    private func disableButtons(){
        yesButton.isEnabled = false
        noButton.isEnabled = false
    }
    private func enableButtons(){
        yesButton.isEnabled = true
        noButton.isEnabled = true
    }
    
    
    //показывает результаты квиза
    private func showResult(quiz result: QuizResultsViewModel){
        let alert = UIAlertController(
                title: result.title,
                message: result.text,
                preferredStyle: .alert)
            
        let action = UIAlertAction(title: result.buttonText, style: .default) { _ in
                self.currentQuestionIndex = 0
                self.correctAnswers = 0
                let firstQuestion = self.questions[self.currentQuestionIndex]
                let viewModel = self.convert(model: firstQuestion)
                self.show(quiz: viewModel)
            }
            
        alert.addAction(action)
        self.present(alert, animated: true, completion: nil)
    }
    
    //модель экрана с вопросом
    struct QuizQuestion{
        let image : String
        let text : String
        let correctAnswer : Bool
        init(image: String, text: String, correctAnswer: Bool) {
            self.image = image
            self.text = text
            self.correctAnswer = correctAnswer
        }
    }
    //основная модель экрана
    struct QuizStepViewModel {
      let image: UIImage
      let question: String
      let questionNumber: String
        init(image: UIImage, question: String, questionNumber: String) {
            self.image = image
            self.question = question
            self.questionNumber = questionNumber
        }
    }
    
    //результат квиза
    struct QuizResultsViewModel {
      let title: String
      let text: String
      let buttonText: String
    }
    
    
    // мок данные
    private let questions: [QuizQuestion] = [
                QuizQuestion(image: "The Godfather",text: "Рейтинг этого фильма больше чем 6?",correctAnswer: true),
                QuizQuestion(image: "Scarface", text: "Рейтинг этого фильма больше чем 6?", correctAnswer: true),
                QuizQuestion(image: "The Dark Knight", text: "Рейтинг этого фильма больше чем 6?", correctAnswer: true),
                QuizQuestion(image: "Kill Bill", text: "Рейтинг этого фильма больше чем 6?", correctAnswer: true),
                QuizQuestion(image: "The Avengers", text: "Рейтинг этого фильма больше чем 6?", correctAnswer: true),
                QuizQuestion(image: "Deadpool", text: "Рейтинг этого фильма больше чем 6?", correctAnswer: true),
                QuizQuestion(image: "The Green Knight",text: "Рейтинг этого фильма больше чем 6?",correctAnswer: true),
                QuizQuestion(image: "Old",text: "Рейтинг этого фильма больше чем 6?",correctAnswer: false),
                QuizQuestion(image: "The Ice Age Adventures of Buck Wild", text: "Рейтинг этого фильма больше чем 6?",correctAnswer: false),
                QuizQuestion(image: "Tesla",text: "Рейтинг этого фильма больше чем 6?",correctAnswer: false),
                QuizQuestion(image: "Vivarium",text: "Рейтинг этого фильма больше чем 6?",correctAnswer: false)
            ]
}

/*
 Mock-данные
 
 
 Картинка: The Godfather
 Настоящий рейтинг: 9,2
 Вопрос: Рейтинг этого фильма больше чем 6?
 Ответ: ДА
 
 
 Картинка: The Dark Knight
 Настоящий рейтинг: 9
 Вопрос: Рейтинг этого фильма больше чем 6?
 Ответ: ДА
 
 
 Картинка: Kill Bill
 Настоящий рейтинг: 8,1
 Вопрос: Рейтинг этого фильма больше чем 6?
 Ответ: ДА
 
 
 Картинка: The Avengers
 Настоящий рейтинг: 8
 Вопрос: Рейтинг этого фильма больше чем 6?
 Ответ: ДА
 
 
 Картинка: Deadpool
 Настоящий рейтинг: 8
 Вопрос: Рейтинг этого фильма больше чем 6?
 Ответ: ДА
 
 
 Картинка: The Green Knight
 Настоящий рейтинг: 6,6
 Вопрос: Рейтинг этого фильма больше чем 6?
 Ответ: ДА
 
 
 Картинка: Old
 Настоящий рейтинг: 5,8
 Вопрос: Рейтинг этого фильма больше чем 6?
 Ответ: НЕТ
 
 
 Картинка: The Ice Age Adventures of Buck Wild
 Настоящий рейтинг: 4,3
 Вопрос: Рейтинг этого фильма больше чем 6?
 Ответ: НЕТ
 
 
 Картинка: Tesla
 Настоящий рейтинг: 5,1
 Вопрос: Рейтинг этого фильма больше чем 6?
 Ответ: НЕТ
 
 
 Картинка: Vivarium
 Настоящий рейтинг: 5,8
 Вопрос: Рейтинг этого фильма больше чем 6?
 Ответ: НЕТ
*/
