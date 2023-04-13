"""Calendar bot for Telegram"""
import locale
import os
import re
from datetime import datetime
from textwrap import wrap
# pylint: disable=E0401
import dotenv
# pylint: disable=E0401
import telebot

# Load environment variables from .env file
dotenv.load_dotenv()

# Set locale for output in Russian language
locale.setlocale(locale.LC_ALL, 'ru_RU.UTF-8')

TOKEN = os.getenv('TOKEN')
bot = telebot.TeleBot(TOKEN)


def handle_start(message):
    """Handler for /start command"""
    user_name = message.from_user.first_name
    reply_text = (
        f"Hi, {user_name}! Я бот, который может определить день недели по дате. "
        f"Отправь мне дату в формате ДД.ММ.ГГГГ."
    )
    bot.send_message(message.chat.id, reply_text)


def get_weekday(date_str):
    """Function to determine day of the week"""
    date_obj = datetime.strptime(date_str, '%d.%m.%Y')
    weekday = date_obj.strftime('%A')
    return weekday.capitalize()


@bot.message_handler(commands=['start'])
def handle_start_command(message):
    """Handler for /start command"""
    handle_start(message)


@bot.message_handler(func=lambda msg: re.match(r'^\d{1,2}\.\d{1,2}\.\d{4}$', msg.text))
def handle_date(message):
    """Handler for user message"""
    date_str = message.text
    weekday = get_weekday(date_str)
    reply_text = f"День недели для даты {date_str} - {weekday}"
    for line in wrap(reply_text):
        bot.reply_to(message, line)


# Launch bot
if __name__ == '__main__':
    bot.polling()
