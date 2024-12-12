import requests
import time
import logging

# Set up logging
logging.basicConfig(level=logging.INFO, format='%(asctime)s - %(message)s')


def get_joke():
    try:
        response = requests.get(
            "https://official-joke-api.appspot.com/jokes/random"
        )
        if response.status_code == 200:
            joke = response.json()
            logging.info("Here's one for ya...")
            logging.info(f"{joke['setup']} ... {joke['punchline']}")
        else:
            logging.error(
                "Failed to fetch joke: HTTP Status %s",
                response.status_code
            )
    except Exception as e:
        logging.error("An error occurred: %s", str(e))


if __name__ == "__main__":
    logging.info("START: joke fetcher")
    while True:
        get_joke()
        logging.info("SLEEP: 5 mintues")
        time.sleep(300)  # Wait 5 minutes (300 seconds)
