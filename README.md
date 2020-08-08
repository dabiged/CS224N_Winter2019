# CS224N_Winter2019
Answers to assignments of CS224N - Natural Language Processing with Deep Neural Networks with Chris Manning, Winter 2019.

# Highlights
**Neural Machine Translation with a seq2seq network based on LSTM's**

In Assignment 4 of this work we build a Spanish to English Neural Machine tranlation tool using seq2seq network with attention. We use a bidirection LSTM for encoding and a unidirection LSTM for decoding. This code is available in the a4 folder of this repository.

Some Details:
Training time was 4 hrs 49 minutes on my laptop's 1050GTX video card.

This NMT gets a BLEU score of 22.7 on the test corpus.

Example outputs

Original Spanish:        Estas mujeres se reunan simplemente para hablar.

Reference Translation:   And these women would get together and just talk.

This Work's Translation: These women were getting together just to speak.




