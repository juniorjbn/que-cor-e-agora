
LATEST_VERSION := v1.0
REPOSITORY := talits
IMAGE_NAME := cor-e-agora
IMAGE := $(REPOSITORY)/$(IMAGE_NAME):$(LATEST_VERSION)
LATEST := $(REPOSITORY)/$(IMAGE_NAME):latest

.PHONY: default
default: image

.PHONY: image
image:
	docker build . -t quay.io/$(IMAGE)

.PHONY: tag
tag:
	docker tag quay.io/$(IMAGE) quay.io/$(LATEST)

.PHONY: push
push: tag
	docker push quay.io/$(IMAGE)
	docker push quay.io/$(LATEST)
