FROM nvcr.io/nvidia/tritonserver:24.01-py3

RUN pip3 install --no-cache-dir transformers

ENV PYTHONUNBUFFERED=1

CMD ["tritonserver", "--model-store=/models"]