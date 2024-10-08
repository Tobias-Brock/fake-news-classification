# MLOps Fake News Classification documentation!

## Description


MLOps Project of Tobias Brock, Anne Gritto and Stefanie Schwarz. This project is part of the fullfilment for the lecture "ML Operations" from LMU and covers the whole deployment lifecycle of a deep learning project. Here we deploy a model for fake news classification.

### Overall Goal of the Project
The Fake News Classifier project aims to equip students in the ML Operations (MLOps) lecture with hands-on experience in deployment and development techniques. The task of fake news classification is chosen since it offers a straightforward implementation using transformer-based libraries. The goal is to create a robust machine learning model that accurately distinguishes between real and fake news articles.

### Framework and Integration
For the classification task we use PyTorch in combination with Hugging Face's Transformers library. PyTorch is a popular deep learning framework known for its flexibility and ease of use. The Transformers library provides pre-trained models and APIs for implementing transformer architectures like BERT (Bidirectional Encoder Representations from Transformers) and SBERT (Sentence-BERT), which are effective for Natural Language Processing (NLP) tasks.

To integrate these frameworks, a conda environment is used to manage dependencies and ensure compatibility. Necessary packages like PyTorch, Transformers, and others are installed using pip. The project structure includes scripts for data preprocessing, model training, and evaluation.

### Data
For the project, the WELFake dataset from Kaggle is used. This dataset contains 72,134 news articles, with 35,028 labeled as real and 37,106 as fake. It combines four popular news datasets (Kaggle, McIntire, Reuters, BuzzFeed Political) to prevent over-fitting and provide a larger corpus for training. The dataset includes:

- Serial Number: A unique identifier for each entry.

- Title: The headline of the news article.

- Text: The content of the news article.

- Label: A binary label indicating whether the news is fake (0) or real (1).

### Models
Suitable models are mainly transformer-based:

- Distilled version of BERT without fine-tuning on the training data could serve as baseline model.

- BERT is pre-trained on a large corpus and can further be fine-tune the model for our specific tasks of fake news classification. Its contextual embeddings will help improve the classifier's accuracy in distinguishing real and fake news.

- SBERT is a variant of BERT designed to produce semantically meaningful sentence embeddings, making it suitable for understanding sentence-level semantics in news articles.

We decided to focus only on BERT, since the project is meant to showcast the whole deployment cycle of a deep learning model and supporting different model classes would increase the amount of backend code tremendously.

## Overview

<figure markdown="span">
  ![Architecture overview](figures/mlops_overview-fakenews.png){ width="800" }
  <figcaption>Architecture overview</figcaption>
</figure>
