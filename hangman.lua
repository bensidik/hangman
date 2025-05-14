math.randomseed(os.time())
local socket = require("socket")
local function wait (n)
    socket.sleep(n)
end
lifes = 10

print("Welcome to the game called Hangman!")
wait(2)
print("In this game, you will have to guess a word letter by letter.")
wait(2)
print("You will have "..lifes.." lives to guess the word.")
wait(2)
print("If you guess a letter that is not in the word, you will lose a life.")
wait(2)
print("Okay, now please wait while I generate a word for you to guess.")
wait(3)
-- Generate a random word
word = {"hangman", "lua", "programming", "computer", "science"}
index = math.random(1, #word)
local guessed = {}
local tried_letters = {}
local display = ""
for i = 1, #word do
    display = display .. "_ "
end
print(display)
local word = word[index]
print("The word has been generated. It is "..#word.." letters long.")
while lifes > 0 do
    print("Please enter a letter:")
    guess = io.read()
    if tried_letters[guess] then
     print("You already tried '" .. guess .. "'. Try another.")
 else
     tried_letters[guess] = true
     local correct = false
     for i = 1, #word do
         local letter = word:sub(i, i)
         if letter == guess then
             guessed[letter] = true
             correct = true
         end
     end
     if correct then
         print("Correct guess!")
     else
         lives = lives - 1
         print("Wrong guess. Lives left: " .. lives)
     end
 end
 local current_display = ""
 local all_guessed = true
 for i = 1, #word do
     local letter = word:sub(i, i)
     if guessed[letter] then
         current_display = current_display .. letter .. " "
     else
         current_display = current_display .. "_ "
         all_guessed = false
     end
 end
local current_display = ""
 local all_guessed = true
 for i = 1, #word do
     local letter = word:sub(i, i)
     if guessed[letter] then
         current_display = current_display .. letter .. " "
     else
         current_display = current_display .. "_ "
         all_guessed = false
     end
 end
 print(current_display)
 -- Check win condition
 if all_guessed then
     print("Congratulations! You guessed the word: " .. word)
     break
 end
end
