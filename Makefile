.EXPORT_ALL_VARIABLES:
VERSION=edge

DOCKER_REGISTRY=pocketbase
DOCKER_IMAGE_NAME=pocketbase

BUILDX_PLATFORM=linux/amd64
DOCKER_IMAGE_TAG=${DOCKER_REGISTRY}/${DOCKER_IMAGE_NAME}:${VERSION}

# Docker Metadata Actions
DOCKER_META_IMAGES=${DOCKER_REGISTRY}/${DOCKER_IMAGE_NAME}
DOCKER_META_VERSION=${VERSION}

BUILDKIT_PROGRESS=plain

main:
	@echo No action was performed.
	@echo
	@echo Available flags:
	@echo - VERSION=${VERSION}
	@echo - DOCKER_REGISTRY=${DOCKER_REGISTRY}
	@echo - DOCKER_IMAGE_NAME=${DOCKER_IMAGE_NAME}
	@echo - BUILDX_PLATFORM=${BUILDX_PLATFORM}
	@echo
	@echo Read-only flags:
	@echo - DOCKER_IMAGE_TAG=${DOCKER_IMAGE_TAG}
	@echo - DOCKER_META_IMAGES=${DOCKER_META_IMAGES}
	@echo - DOCKER_META_VERSION=${DOCKER_META_VERSION}
	@echo
	@echo Available commands:
	@echo - run: run docker container
	@echo - push: push docker image to registry
	@echo - build: build docker image

build:
	@docker buildx bake \
		--file Makefile.docker-bake.hcl \
		--print build
	@echo Building ${DOCKER_IMAGE_TAG} docker image
	@docker buildx bake \
			--file Makefile.docker-bake.hcl \
			--load build

# push:
# 	@echo Pushing ${DOCKER_IMAGE_TAG} to registry
# 	@docker push ${DOCKER_IMAGE_TAG}

run:
	@echo Running ${DOCKER_IMAGE_TAG} image on port http://localhost:8090
	@docker run -it --rm \
		--publish 8090:8090 \
		${DOCKER_IMAGE_TAG}
