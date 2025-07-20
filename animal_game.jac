"""Animal Guessing Game - AI-Powered Adventure! """

import random;
import from mtllm.llm { Model }

glob llm = Model(
    model_name="gemini/gemini-2.0-flash", 
    verbose=False
);

"""Generate a creative and fun hint about the correct animal when the guess is wrong! 
Make it engaging and give clues about the animal's characteristics, habitat, or behavior."""
def give_animal_hint(wrong_guess: str, correct_animal: str, attempt_number: int) -> str by llm();

walker AnimalGame {
    has guess: str;

    can start with `root entry;
    can process_guess with GameSession entry;
}

node GameSession {
    has correct_animal: str;
    has attempts_left: int = 3;
}

# Will run when in CLI mode 
with entry:__main__ {
    root spawn AnimalGame("🦁 Lion");
    root spawn AnimalGame("🐘 Elephant");
    root spawn AnimalGame("🐬 Dolphin");
}
