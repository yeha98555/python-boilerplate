from config import logger


def main():
    print("Hello World")

    logger.error("There's been a mistake with the process.")
    logger.info("✅ complete!")


if __name__ == "__main__":
    main()
