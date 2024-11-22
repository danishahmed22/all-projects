import tensorflow as tf

def create_model(vocab_size, max_length):
    model = tf.keras.Sequential([
        tf.keras.layers.Embedding(input_dim=vocab_size, output_dim=64, input_length=max_length),
        tf.keras.layers.GlobalAveragePooling1D(),
        tf.keras.layers.Dense(24, activation='relu'),
        tf.keras.layers.Dense(1, activation='sigmoid')  # Adjust activation based on output type
    ])

    model.compile(loss='binary_crossentropy',  # Change loss function if needed
                  optimizer='adam',
                  metrics=['accuracy'])

    return model
