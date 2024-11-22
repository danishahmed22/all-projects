import pandas as pd
from sklearn.model_selection import train_test_split
from tensorflow.keras.preprocessing.text import Tokenizer
from tensorflow.keras.preprocessing.sequence import pad_sequences

def load_and_preprocess_data(file_path):
    # Load your dataset
    data = pd.read_csv(file_path)

    # Preprocess the data
    questions = data['Question'].values
    answers = data['Answer'].values

    # Tokenize the questions
    tokenizer = Tokenizer()
    tokenizer.fit_on_texts(questions)

    # Convert questions to sequences
    sequences = tokenizer.texts_to_sequences(questions)

    # Define parameters
    max_length = max(len(seq) for seq in sequences)
    vocab_size = len(tokenizer.word_index) + 1  # Adding 1 for the padding token

    # Pad sequences
    padded_sequences = pad_sequences(sequences, maxlen=max_length, padding='post')

    # Split the dataset into training and testing
    X_train, X_test, y_train, y_test = train_test_split(padded_sequences, answers, test_size=0.2, random_state=42)
    
    return X_train, X_test, y_train, y_test, tokenizer, max_length, vocab_size
import pandas as pd
from sklearn.model_selection import train_test_split
from tensorflow.keras.preprocessing.text import Tokenizer
from tensorflow.keras.preprocessing.sequence import pad_sequences

def load_and_preprocess_data(file_path):
    data = pd.read_csv(file_path)
    
    # Print the columns to debug
    print("Columns in the DataFrame:", data.columns)

    # Ensure you have the correct column names
    questions = data['Question'].values  # Change if necessary
    answers = data['Answer'].values  # Change if necessary

    # Split the dataset into training and test sets
    X_train, X_test, y_train, y_test = train_test_split(questions, answers, test_size=0.2, random_state=42)

    # Tokenization
    tokenizer = Tokenizer()
    tokenizer.fit_on_texts(X_train)
    vocab_size = len(tokenizer.word_index) + 1  # +1 for padding
    max_length = max(len(x.split()) for x in X_train)
    
    # Convert texts to sequences
    X_train = tokenizer.texts_to_sequences(X_train)
    X_test = tokenizer.texts_to_sequences(X_test)
    
    # Padding sequences
    X_train = pad_sequences(X_train, maxlen=max_length, padding='post')
    X_test = pad_sequences(X_test, maxlen=max_length, padding='post')

    return X_train, X_test, y_train, y_test, tokenizer, max_length, vocab_size
