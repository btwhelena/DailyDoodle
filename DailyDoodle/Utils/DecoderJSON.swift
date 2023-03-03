// MARK: - CatPhasesModel

import Foundation

class DecoderJSON: ObservableObject {

        @Published var imageDescription = [ImageDescription]()


        init(){
            loadData()
        }

        func loadData()  {
            guard let url = Bundle.main.path(forResource: "ImagensDescription", ofType: "json")
                else {
                    print("Json file not found")
                    return
                }

            do {
                let data = try Data(contentsOf: URL(fileURLWithPath: url), options: .mappedIfSafe)
                let description = try JSONDecoder().decode(Descriptions.self, from: data)
                self.imageDescription = description.imageDescriptions
            } catch {
                print(error)

            }
            getTodaysImageDescription()
        }

    func getTodaysImageDescription() -> String {
        let filtered = self.imageDescription.filter { description in
            return description.name == "CHALLENGE-\(DateHelper.getCurrentDay())"
        }
        return filtered[0].description
    }
}

// MARK: - Phrase
struct Descriptions: Codable {
    let imageDescriptions: [ImageDescription]
}

struct ImageDescription: Codable {
    var id: Int
    var name: String
    var description: String

    enum CodingKeys: String, CodingKey {
        case id
        case name
        case description
    }
}
