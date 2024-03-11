import gleam/io
import gleam/erlang
import gleam/string

// Function to change the background color
pub fn change_background_color() {
  // Escape code for changing the background color to blue
  let escape_code = "\u{001b}[44m"

  // Print the escape code
  io.print(escape_code)
}

// Function to read input and change background color until 'q' is entered
fn loop_until_quit() {
  let input = erlang.get_line("Enter Key: ")

  case input {
    Ok(input_result) -> {
      let input_result = string.replace(input_result, each: "\n", with: "")
      case input_result {
        "q" -> Nil
        "a" -> change_background_color()
        "b" -> io.print("\u{001b}[49m")
        "c" -> io.print("\u{001b}[A")
        _ -> io.println("Invalid Key")
      }

      loop_until_quit()
    }
    Error(_) -> io.println("uh oh :c")
  }
}

// Main entry point
pub fn main() {
  // Run the code while the user does not type 'q'
  loop_until_quit()
}
