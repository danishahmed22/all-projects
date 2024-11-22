from data_preprocessing import load_and_preprocess_data
from model import create_model

def main():
    data_file_path = 'finance_banking_laws_dataset.csv'  # Update path as necessary

    # Load and preprocess data
    X_train, X_test, y_train, y_test, tokenizer, max_length, vocab_size = load_and_preprocess_data(data_file_path)

    # Create the model
    model = create_model(vocab_size, max_length)

    # Train the model
    model.fit(X_train, y_train, epochs=10, batch_size=32, validation_data=(X_test, y_test))

    # Evaluate the model
    loss, accuracy = model.evaluate(X_test, y_test)
    print(f"Accuracy: {accuracy * 100:.2f}%")

if __name__ == "__main__":
    main()
