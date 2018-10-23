
LATEST_VERSION := v1.0
REPOSITORY := talits
IMAGE_NAME := cor-e-agora
IMAGE := $(REPOSITORY)/$(IMAGE_NAME):$(LATEST_VERSION)
LATEST := $(REPOSITORY)/$(IMAGE_NAME):latest

.PHONY: default
default: image

.PHONY: image
image:
	docker build . -t $(IMAGE)

.PHONY: tag
tag:
	docker tag $(IMAGE) $(LATEST)

.PHONY: push
push: tag
	docker push $(IMAGE)
	docker push $(LATEST)