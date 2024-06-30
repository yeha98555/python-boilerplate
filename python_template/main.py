from config import logger


def add(a: int, b: int) -> int:
    return a + b


def main():
    print("Hello World")
    print(add(1, 2))

    logger.error("There's been a mistake with the process.")
    logger.info("✅ complete!")


if __name__ == "__main__":
    main()
