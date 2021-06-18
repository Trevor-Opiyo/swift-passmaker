import Foundation

func main() {
  var passOptions: [Character] = []
  header()
  passOptions += includeChars(charType:"upper case letters", newOptions: ["A","B","C","D","E","F","G","H","I","J","K","L","M","N","O","P","Q","R","S","T","U","V","W","X","Y","Z"])
  passOptions += includeChars(charType: "lower case letters", newOptions: ["a","b","c","d","e","f","g","h","i","j","k","l","m","n","o","p","q","r","s","t","u","v","w","x","y","z"])
  passOptions += includeChars(charType:"integers", newOptions: ["1","2","3","4","5","6","7","8","9","0"])
  passOptions += includeChars(charType:"special characters", newOptions: ["-","_","+","=","@","#","$","%","^","&","*"])
  generate(passOptions: passOptions)
}

func header() {
  print("\n---------------------------------\n       Password Generator\n---------------------------------")
}

func includeChars(charType: String, newOptions: [Character]) -> [Character] {
  repeat {
    print("\nInclude \(charType) in the password? [Y/N]")
    let answer = readLine()
    switch answer {
      case "Yes","yes","YES","y","Y":
        return newOptions
      case "No","no","NO","n","N":
        return []
      default:
        print("\nInvalid input. Please enter \'Y\' or \'N\'")
    }
  } while true
}

func getLength() -> Int {
  var answer: Int
  print("\nEnter an integer length for the password [e.g. \'8\']")
  answer = Int(readLine() ?? "8") ?? 8
  print("\nThe password is:\n")
  return answer
}

func generate(passOptions: [Character]) {
  let passLength = getLength()
  for _ in 1..<passLength {
    print(passOptions.randomElement()!, terminator: "")
  }
  outerloop: repeat {
  print("\n\nRegenerate the password with the same parameters?")
  let answer = readLine()
  switch answer {
    case "Yes","yes","YES","y","Y":
      print("\nThe new password is:\n")
      for _ in 1..<passLength {
        print(passOptions.randomElement()!, terminator: "")
      }
    case "No","no","NO","n","N":
      break outerloop
    default:
      print("\nInvalid input. Please enter \'Y\' or \'N\'")
    }
  } while true
}
main()
