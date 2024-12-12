import requests
import time
import logging
import threading

# Set up logging
logging.basicConfig(level=logging.INFO, format='%(asctime)s - %(message)s')


def mark_healthy():
    # Continuously overwrite the /tmp/healthy file with a timestamp
    while True:
        try:
            with open('/tmp/healthy', 'w') as f:
                f.write(f"healthy - {time.strftime('%Y-%m-%d %H:%M:%S')}\n")
            logging.info("HEALTH CHECK: Successfully wrote to /tmp/healthy")
        except Exception as e:
            logging.error(
                "HEALTH CHECK: Failed to write to /tmp/healthy: %s",
                str(e)
            )

        time.sleep(30)


def get_joke():
    # Fetch a joke from API and log it
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

    # Start the health marker in a separate thread
    health_thread = threading.Thread(target=mark_healthy, daemon=True)
    health_thread.start()

    while True:
        get_joke()
        logging.info("SLEEP: 5 minutes")
        time.sleep(300)  # Wait 5 minutes (300 seconds)
