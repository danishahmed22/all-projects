from tensorflow.keras.models import Sequential
from tensorflow.keras.layers import Embedding, LSTM, Dense

def create_model(vocab_size, max_length):
    # Define the model
    model = Sequential()
    model.add(Embedding(input_dim=vocab_size, output_dim=64, input_length=max_length))
    model.add(LSTM(64, return_sequences=True))
    model.add(LSTM(32))
    model.add(Dense(1, activation='sigmoid'))  # Use 'softmax' for multi-class classification

    # Compile the model
    model.compile(loss='binary_crossentropy', optimizer='adam', metrics=['accuracy'])  # Change loss for multi-class
    return model
