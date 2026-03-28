# Классификатор отзывов (NLP, Triton)

Проект по обучению и развертыванию модели
intfloat/multilingual-e5-small для бинарной классификации отзывов
(негативный / позитивный) с использованием NVIDIA Triton Inference Server.

## Цель

Построить полный пайплайн:

Данные → Обучение → ONNX → Triton → gRPC инференс
## Основные возможности
Fine-tuning E5 модели
Датасет: https://huggingface.co/datasets/zloelias/kinopoisk-reviews
Экспорт модели в ONNX
Развертывание через Triton + Docker
Инференс через gRPC
Ensemble (tokenizer + модель)
## Структура проекта
Triton Model Repository
triton_repo/
└── models/
    ├── bert_classifier/
    │   ├── config.pbtxt
    │   └── 1/
    │       ├── model.onnx
    │       └── model.onnx.data
    │
    ├── text_tokenizer/
    │   └── 1/model.py
    │
    └── text_classifier_ensemble/
        └── config.pbtxt

### model.onnx.data обязателен (в нём лежат веса модели), так как модель большая

## Основные файлы
train_model_kinopoisk.ipynb — обучение + ONNX экспорт
kaggle_train.ipynb — обучение на GPU (Kaggle)
test_triton.ipynb — gRPC клиент
docker-compose.yaml + Dockerfile — запуск Triton
## Запуск
docker-compose up -d --build
## Инференс

Открыть:

test_triton.ipynb

Пример:

texts = ["This movie is terrible"]