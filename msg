from telegram import Update
from telegram.ext import Updater, CommandHandler, MessageHandler, Filters, CallbackContext
import random

# List of stupid challenges
challenges = [
    "Do a dance like nobody's watching! 💃🕺",
    "Try to talk to a potato like it's your best friend 🥔💬",
    "Sing your favorite song but only in whispers 🎤🤫",
    "Do 10 jumping jacks, but pretend you're a robot 🤖",
    "Write a love letter to a tree 🌳💌",
    "Talk to your reflection in the mirror for 1 minute 🪞",
    "Pretend you're a cat for 2 minutes 🐱",
    "Give your phone a compliment 📱✨",
    "Send an emoji as a response to everything for 10 minutes ⏳",
    "Pretend you're a superhero and save the world! 🦸‍♂️🦸‍♀️"
]

# Command to start the game
def start(update: Update, context: CallbackContext):
    update.message.reply_text("Welcome to the Stupid Challenge Game! Ready for some silly challenges? Type /challenge to get started!")

# Command to get a new challenge
def challenge(update: Update, context: CallbackContext):
    challenge = random.choice(challenges)
    update.message.reply_text(f"Your challenge: {challenge}")

# Responding to any text message with a random challenge
def reply_random_challenge(update: Update, context: CallbackContext):
    if update.message.text.lower() in ['hi', 'hello', 'hey', 'yo']:
        update.message.reply_text("Say '/challenge' to get your stupid challenge!")
    else:
        challenge = random.choice(challenges)
        update.message.reply_text(f"Here’s a challenge for you: {challenge}")

# Main function to set up the bot
def main():
    # Add your bot's token here
    token = 'YOUR_BOT_TOKEN_HERE'

    updater = Updater(token, use_context=True)
    dp = updater.dispatcher

    # Start command handler
    dp.add_handler(CommandHandler("start", start))

    # Challenge command handler
    dp.add_handler(CommandHandler("challenge", challenge))

    # Reply with a random challenge to any message
    dp.add_handler(MessageHandler(Filters.text & ~Filters.command, reply_random_challenge))

    # Start the bot
    updater.start_polling()
    updater.idle()

if __name__ == '__main__':
    main()
