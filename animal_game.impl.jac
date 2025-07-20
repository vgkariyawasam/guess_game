impl AnimalGame.start {
    if not [root --> (`?GameSession)] {
        available_animals = ["🦁 Lion", "🐘 Elephant", "🐬 Dolphin", "🦅 Eagle", "🐅 Tiger"];
        correct_animal = available_animals[random.randint(0, len(available_animals) - 1)];
        next = root ++> GameSession(correct_animal, 3);
        print(f"Starting new Animal Guessing Adventure! 🎮");
        print(f"🎯 Your target animal is: {next[0].correct_animal}");
        print(f"💪 You have 3 attempts to win! Good luck! 🍀");
        print("🍀 Take a lucky guess! What animal am I thinking of? 🤔");
        print("=" * 50);
    } else {
        next = [root --> (`?GameSession)];
        print(f"🔄 Continuing your epic quest! Target: {next[0].correct_animal}");
    }
    visit next;
}

impl AnimalGame.process_guess {
    print(f"🎯 Processing guess: '{self.guess}' 🤔");
    if [-->] {
        visit [-->];
    } else {
        if self.guess != here.correct_animal {
            here.attempts_left -= 1;
            if here.attempts_left > 0 {
                print(f"❌ Oops! '{self.guess}' is not correct!");
                print(f"💪 Attempts left: {here.attempts_left}");
                
                # Generate AI hint 
                hint = give_animal_hint(self.guess, here.correct_animal, 4 - here.attempts_left);
                print(f"💡 AI Hint: {hint}");
                print("🔄 Keep trying! You've got this! 🌟");
                print("-" * 40);
                
                here ++> GameSession(here.correct_animal, here.attempts_left);
            } else {
                print(f"💀 Game Over! No more attempts left! 💀");
                print(f"🎯 The correct animal was: {here.correct_animal}");
                print(f"🎮 Better luck next time, adventurer! 🍀");
                print("=" * 50);
                disengage;
            }
        } else {
            print(f"CONGRATULATIONS! 🎉");
            print(f"You guessed '{self.guess}' correctly! 🏆");
            print(f"You are an Animal Guessing Champion! 🌟");
            print("=" * 50);
            disengage;
        }
        visit [-->];
    }
}
