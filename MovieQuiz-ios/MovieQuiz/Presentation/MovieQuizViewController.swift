import UIKit

class MovieQuizViewController: UIViewController {
    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        imageView.layer.cornerRadius = 20
        yesButton.layer.cornerRadius = 15
        noButton.layer.cornerRadius = 15
        if let firstQuestion = questionFactory.requestNextQuestion() {
            currentQuestion = firstQuestion
            let viewModel = convert(model: firstQuestion)
            show(quiz: viewModel)
        }
 
    }
    
    // свойства
    @IBOutlet private weak var textLabel: UILabel!
    @IBOutlet private weak var counterLabel: UILabel!
    @IBOutlet private weak var imageView: UIImageView!
    @IBOutlet private weak var yesButton: UIButton!
    @IBOutlet private weak var noButton: UIButton!
    private var currentQuestionIndex : Int = 0
    private var correctAnswers : Int = 0
    private let questionsAmount: Int = 11
    private var questionFactory: QuestionFactory = QuestionFactory()
    private var currentQuestion: QuizQuestion?
    
    @IBAction private func noButtonClicked(_ sender: UIButton) {
        showAnswerResult(isCorrect: false)
    }
    
    @IBAction private func yesButtonClicked(_ sender: UIButton) {
        showAnswerResult(isCorrect: true)
    }
    
    //функци я конвертации
    private func convert(model: QuizQuestion) -> QuizStepViewModel {
        let viewModel = QuizStepViewModel(image: UIImage(named: "\(model.image)") ?? UIImage(), question: model.text, questionNumber: "\(currentQuestionIndex + 1)/\(questionsAmount)")
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
        if currentQuestionIndex == questionsAmount - 1{
            let text = "Ваш результат: \(correctAnswers)/11"
            let viewModel = QuizResultsViewModel(title: "Этот раунд окончен!",text: text, buttonText: "Сыграть ещё раз")
            showResult(quiz: viewModel)
        }
        else {
            currentQuestionIndex += 1
            if let nextQuestion = questionFactory.requestNextQuestion() {
                currentQuestion = nextQuestion
                let viewModel = convert(model: nextQuestion)
                show(quiz: viewModel)
            }
        }
    }
        
    // показывает результат вопроса, перекрашивая цвет рамки
    private func showAnswerResult(isCorrect: Bool) {
        imageView.layer.masksToBounds = true
        imageView.layer.borderWidth = 8
        guard let currentQuestion = currentQuestion else {return}
        let answer = currentQuestion.correctAnswer
        if answer == isCorrect {
            imageView.layer.borderColor = UIColor.ypGreen.cgColor
            correctAnswers += 1
        }
        else {
            imageView.layer.borderColor = UIColor.ypRed.cgColor
        }
        DispatchQueue.main.asyncAfter(deadline: .now() + 1.0) { [weak self] in
            guard let self = self else {return}
           self.imageView.layer.borderColor = UIColor.clear.cgColor
           self.showNextQuestionOrResults()
        }
        self.disableButtons()
        DispatchQueue.main.asyncAfter(deadline: .now() + 1.0){[weak self] in
           guard let self = self else {return}
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
            
        let action = UIAlertAction(title: result.buttonText, style: .default) { [weak self] _ in
            guard let self = self else {return}
                self.currentQuestionIndex = 0
                self.correctAnswers = 0
            if let firstQuestion = self.questionFactory.requestNextQuestion() {
                self.currentQuestion = firstQuestion
                let viewModel = self.convert(model: firstQuestion)
                self.show(quiz: viewModel)
            }
            }
            
        alert.addAction(action)
        self.present(alert, animated: true, completion: nil)
    }
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
