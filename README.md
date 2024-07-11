# MLOps Fake News Classification

<a target="_blank" href="https://cookiecutter-data-science.drivendata.org/">
    <img src="https://img.shields.io/badge/CCDS-Project%20template-328F97?logo=cookiecutter" />
</a>

MLOps Project of Tobias Brock, Anne Gritto and Stefanie Schwarz.

This project is part of the fulfillment for the lecture "ML Operations" from LMU and covers the whole deployment lifecycle of a deep learning project. Here we deploy a model for fake news classification.

## Project Description: Fake News Classifier

### Overall Goal of the Project

The Fake News Classifier project aims to equip students in the ML Operations (MLOps) lecture with hands-on experience in deployment and development techniques. The task of fake news classification is chosen since it offers a straightforward implementation using transformer-based libraries. The goal is to create a robust machine learning model that accurately distinguishes between real and fake news articles.

### Framework and Integration

For the classification task, we use PyTorch Lightning in combination with Hugging Face's Transformers library. PyTorch is a popular deep learning framework known for its flexibility and ease of use. The Transformers library provides pre-trained models and APIs for implementing transformer architectures like BERT (Bidirectional Encoder Representations from Transformers) and SBERT (Sentence-BERT), which are effective for Natural Language Processing (NLP) tasks.

To integrate these frameworks, a conda environment is used to manage dependencies and ensure compatibility. Necessary packages like PyTorch, PyTorch Lightning, Transformers, and others are installed using pip. The project structure includes scripts for data preprocessing, model training, distillation, quantization, monitoring and evaluation. Moreover, FastAPI apps and a streamlit frontend are provided. The corresponding docker and cloudbuild files enable deployment in Google Cloud Services. Also, unit, integration and performance tests can be found in the test directory. Experiments are tacked using hydra configurations and Weights & Biases. The report folder contains more detailed information on the project. A general file overview can be found at the end of this file.

### Data

For the project, the [WELFake dataset](https://www.kaggle.com/datasets/saurabhshahane/fake-news-classification/data) from Kaggle is used. This dataset contains 72,134 news articles, with 35,028 labeled as real and 37,106 as fake. It combines four popular news datasets (Kaggle, McIntire, Reuters, BuzzFeed Political) to prevent over-fitting and provide a larger corpus for training.

The dataset includes:
1. **Serial Number**: A unique identifier for each entry.
2. **Title**: The headline of the news article.
3. **Text**: The content of the news article.
4. **Label**: A binary label indicating whether the news is real (0) or fake (1).

### Models
Suitable models are mainly transformer-based:

1. Distilled version of BERT without fine-tuning on the training data could serve as baseline model.

2. BERT is pre-trained on a large corpus and can further be fine-tuned for our specific tasks of fake news classification. Its contextual embeddings will help improve the classifier's accuracy in distinguishing real and fake news.

3. SBERT is a variant of BERT designed to produce semantically meaningful sentence embeddings, making it suitable for understanding sentence-level semantics in news articles.

We decided to focus only on BERT, since the project is meant to showcast the whole deployment cycle of a deep learning model and supporting different model classes would increase the amount of backend code tremendously.

Nevertheless, model distillation is conducted to improve inference speed in the context of the "scalable inference" chapter, using smaller pretrained architectures like DistilBert and Albert V2 and smaller finetuning layers. The notebook `distillation.ipynb` in the `notebooks/` folder provides an overview of these architectures.
However, only BERT is currently deployed in the Cloud Run. Although, deploying a more efficient and well-performing DistilBert model would be straightforward in our setup.


## Project Organization

```
├── LICENSE                <- Open-source license if one is chosen.
├── Makefile               <- Makefile with convenience commands such as `make data` or `make train`.
├── README.md              <- The top-level README for developers using this project.
├── config                 <- Config folder for hydra usage.
│   ├── cloud
│   ├── distillation
│   ├── model
│   ├── predict
│   ├── preprocess
│   └── train
│
├── data
│   ├── predict            <- Sampled data set to test predicting capability.
│   ├── processed          <- The final, canonical data sets for modeling.
│   └── raw                <- The original, immutable data dump.
│  
├── data.dvc               <- DVC file to pull complete data folder from Google Cloud Bucket.
├── docker                 <- Containing all docker files.
├── docs                   <- Mkdocs project; see mkdocs.org for details.
│
├── models                 <- Trained and serialized models, model predictions, or model summaries.
│
├── notebooks              <- Notebooks for visualization purposes.
│   ├── descriptives.ipynb
│   ├── distillation.ipynb
│   ├── predictions.ipynb
│   └── quantization.ipynb
│
├── pyproject.toml         <- Project configuration file with package metadata for fakenews
│                             and configuration for tools like black
│
├── reports                <- Generated analysis as HTML, PDF, LaTeX, etc.
│   ├── figures            <- Generated graphics and figures to be used in reporting
│   ├── monitoring
│   │   ├── data_drift_report.html
│   │   ├── data_drift_tests.html
│   │   └── text_drift_metrics.html
│   ├── README.md          <- Final Hand-in source file for report for MLOps
│   └── report.py
│
├── requirements.txt       <- The requirements file for reproducing the analysis environment, e.g.
│                             generated with `pip freeze > requirements.txt`
│
├── tests                  <- Test folder, to be executed with `pytest tests` from root directory
│   ├── integrationtests
│   │   ├── test_inference.py
│   │   └── test_monitoring.py
│   ├── performancetests
│   │   └── locustfile.py
│   └── unit
│       ├── test_data.py
│       ├── test_model.py
│       └── test_train.py
│
└── fakenews                <- Source code for use in this project.
    ├── app
    │   ├── frontend.py
    │   ├── inference_app.py
    │   └── monitoring_app.py
    │
    ├── config.py
    ├── data                <- Scripts to download or generate data
    │   ├── data_generator.py
    │   ├── make_dataset.py
    │   └── preprocessing.py
    │
    ├── inference           <- Scripts for model inference
    │   ├── distillation.py
    │   ├── predict.py
    │   └── quantization.py
    ├── model               <- Scripts to train models and usage
    │   ├── distillation_model.py
    │   ├── distillation_training.py
    │   ├── model.py
    │   ├── train_model.py
    │   └── wandb_registry.py
    │
    └── monitoring          <- Scripts to create exploratory and results oriented visualizations
        └── data_drift.py


```

--------
